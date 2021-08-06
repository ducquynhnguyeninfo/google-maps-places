import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/distance.dart';
import 'package:places/config/dependency_injection.dart';
import 'package:places/features/places/data/datasources/remote_api/models/directions.dart';
import 'package:places/features/places/data/datasources/remote_api/models/location_latlng.dart';
import 'package:places/features/places/presentation/screens/direction_map/bloc/direction_map_bloc.dart';
import 'package:places/values/app_colors.dart';
import 'package:places/values/size_config.dart';

class LocationMapPage extends StatefulWidget {
  static const String name = "map_page";
  static const String origin = "origin";
  static const String destination = "destination";
  static const String title = "title";

  const LocationMapPage({Key? key}) : super(key: key);

  @override
  _LocationMapPageState createState() => _LocationMapPageState();
}

class _LocationMapPageState extends State<LocationMapPage> {
  late GoogleMapController _googleMapController;
  late Marker _originMarker;
  late Marker _destinationMarker;
  Directions? directions = null;

  late final Location origin;
  late final Location destination;
  late final String title;

  late CameraPosition _initCameraPosition;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    var arguments =
    ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;
    origin = arguments[LocationMapPage.origin]!;
    destination = arguments[LocationMapPage.destination]!;
    title = arguments[LocationMapPage.title]!;
    _originMarker = Marker(
        markerId: MarkerId(origin.toString()),
        infoWindow: InfoWindow(title: 'You\'re here'),
        position: origin.toLatLng(),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen));

    _destinationMarker = Marker(
        infoWindow: InfoWindow(title: title),
        markerId: MarkerId(destination.toString()),
        position: destination.toLatLng());

    _initCameraPosition = CameraPosition(
      target: destination.toLatLng(),
      zoom: 15,
    );

    return BlocProvider<DirectionMapBloc>(
      create: (context) => sl<DirectionMapBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: BlocBuilder<DirectionMapBloc, DirectionMapState>(
          builder: (context, state) {
            if (state is DirectionMapInitial) {
              BlocProvider.of<DirectionMapBloc>(context)
                  .add(GetDirectionEvent(origin, destination));
            }
            if (state is DirectionMapLoaded) {
              directions = state.directions;
              _googleMapController.animateCamera(
                  CameraUpdate.newLatLngBounds(directions!.bounds, 100.0));
            }

            return Stack(
              children: <Widget>[
                GoogleMap(
                    myLocationEnabled: true,
                    markers: {_originMarker, _destinationMarker},
                    polylines: {
                      if (directions != null)
                        Polyline(
                            polylineId: const PolylineId("value"),
                            color: AppColors.directionLine,
                            width: SizeConfig.directionLineWidth,
                            points: directions!.polylinePoints
                                .map((e) => LatLng(e.latitude, e.longitude))
                                .toList())
                    },
                    initialCameraPosition: _initCameraPosition,
                    onMapCreated: (GoogleMapController controller) {
                      print("set controller");
                      _googleMapController = controller;
                    }),
                if (directions != null)
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(SizeConfig.default_padding),
                      child: Container(
                        padding: const EdgeInsets.all(
                            SizeConfig.default_padding * 1.5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 2),
                                  blurRadius: 6.0)
                            ]),
                        child: Text(
                            '${directions!.totalDistance}, ${directions!.totalDuration}'),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          child: Icon(Icons.center_focus_strong),
          onPressed: () {
            _googleMapController.animateCamera(directions != null
                ? CameraUpdate.newLatLngBounds(directions!.bounds, 100.0)
                : CameraUpdate.newCameraPosition(_initCameraPosition));
          },
        ),
      ),
    );
  }
}
