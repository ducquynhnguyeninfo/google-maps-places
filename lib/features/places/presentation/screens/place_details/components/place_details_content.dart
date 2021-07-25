import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:places/config/dependency_injection.dart';
import 'package:places/features/places/presentation/screens/direction_map/location_map_page.dart';
import 'package:places/features/places/presentation/widgets/tag_view.dart';
import 'package:places/utils/location_helper.dart';
import 'package:places/values/size_config.dart';

import 'checklist/checklist.dart';

class PlaceDetailsContent extends StatefulWidget {
  final PlaceDetails details;

  PlaceDetailsContent(this.details);

  @override
  _PlaceDetailsContentState createState() => _PlaceDetailsContentState();
}

class _PlaceDetailsContentState extends State<PlaceDetailsContent> {
  late GoogleMapController _controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var iconSize = 24.0;

    return  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(widget.details.name,
                style: Theme.of(context).textTheme.headline5),
            Wrap(
                spacing: 6.0,
                alignment: WrapAlignment.start,
                children: widget.details.types
                    .map((e) => TagView(text: e.toString(), onTap: null))
                    .toList()),
            buildLocationMap(),
            Divider(thickness: 1),
            PlacePropertyWidget(
                text: widget.details.formattedAddress!,
                icon: Icon(Icons.directions_rounded, size: iconSize),
                onTap: () {}),
            Divider(thickness: 1),

            PlacePropertyWidget(
                text: widget.details.rating.toString(),
                icon: Icon(Icons.star_rate_rounded, size: iconSize),
                onTap: () {}),
            Divider(thickness: 1),
            PlacePropertyWidget(
                text: widget.details.internationalPhoneNumber ??
                    widget.details.formattedPhoneNumber ??
                    '',
                icon: Icon(Icons.call_rounded, size: iconSize),
                onTap: () {}),

            Divider(),
            Checklist()
          ],
        ),
    );
  }

  Widget buildLocationMap() {
    return Padding(
      padding: const EdgeInsets.all(SizeConfig.default_padding),
      child: SizedBox(
          width: 300,
          height: 200,
          child: LayoutBuilder(builder: (context, constraint) {
            var pinLatLng = LatLng(widget.details.geometry!.location.lat,
                widget.details.geometry!.location.lng);
            var mp = sl<LocationHelper>().position;

            var myPosition = Location(lat: mp.latitude, lng: mp.longitude);
            var targetPosition = widget.details.geometry!.location;

            return GoogleMap(
              zoomControlsEnabled: false,
              rotateGesturesEnabled: false,
              scrollGesturesEnabled: false,
              tiltGesturesEnabled: false,
              onTap: (LatLng position) {
                print("map got tapppp");

                Navigator.of(context)
                    .pushNamed(LocationMapPage.name, arguments: {
                  LocationMapPage.origin: myPosition,
                  LocationMapPage.destination: targetPosition,
                  LocationMapPage.title: widget.details.name
                });
              },
              mapType: MapType.normal,
              markers: {
                Marker(
                  markerId: MarkerId(widget.details.placeId),
                  position: pinLatLng,
                  // icon: pinLocationIcon
                )
              },
              initialCameraPosition: CameraPosition(
                target: pinLatLng,
                zoom: 18,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
              },
            );
          })),
    );
  }
}

class PlacePropertyWidget extends StatelessWidget {
  final Icon icon;
  final String text;
  final Function()? onTap;

  const PlacePropertyWidget(
      {Key? key, required this.text, required this.icon, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var iconSize = 24.0;

    return InkWell(
        child: Row(
          children: [
            Container(
                margin:
                const EdgeInsets.only(right: SizeConfig.default_padding),
                padding: const EdgeInsets.all(SizeConfig.default_padding),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    borderRadius:
                    BorderRadius.circular(SizeConfig.default_radius)),
                child: icon),
            SizedBox(
              width: size.width - 5 * SizeConfig.default_padding - iconSize,
              child: Text(text, style: Theme.of(context).textTheme.bodyText2),
            )
          ],
        ),
        onTap: onTap);
  }
}
