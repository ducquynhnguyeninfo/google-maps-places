import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_webservice/distance.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:places/config/dependency_injection.dart';
import 'package:places/core/error/failures.dart';
import 'package:places/features/places/data/datasources/remote_api/models/place_viewmodel.dart';
import 'package:places/features/places/domain/entities/entities.dart';
import 'package:places/features/places/domain/usecases/get_distance_usecase.dart';
import 'package:places/features/places/domain/usecases/get_near_places_usecase.dart';
import 'package:places/utils/location_helper.dart';
import 'package:places/features/places/data/datasources/remote_api/models/photo_model.dart';

part 'places_list_event.dart';

part 'places_list_state.dart';

class PlacesListBloc extends Bloc<PlacesListEvent, PlacesListState> {
  final GetNearPlacesUsecase getNearPlaces;
  final GetDistanceUsecase getDistanceUsecase;

  PlacesListBloc({required this.getNearPlaces, required this.getDistanceUsecase})
      : super(PlacesListInitial());

  @override
  Stream<PlacesListState> mapEventToState(
    PlacesListEvent event,
  ) async* {
    if (event is GetNearPlacesEvent) {
      yield* _getNearPlaces();
    }
  }

  Stream<PlacesListState> _getNearPlaces() async* {
    var q = 'cafe';

    yield PlacesListLoading();

    var result = await getNearPlaces.call(GetNearPlacesParams(query: q));

    yield* result.when((Failure error) async* {
      yield PlacesListError(message: error.runtimeType.toString());
    }, (List<PlacesSearchResult> success) async* {
      List<PlaceViewModel> searchResult = [];

      print("result size: ${result.getSuccess()!.length}");
      for (int i = 0; i < success.length; i++) {
       var place = success[i];

        var origin = sl<LocationHelper>().position;
        var dest = place.geometry!.location;

        // get distance between locations
        var result = await getDistanceUsecase.call(
            GetDistanceParams(origin: origin.toLocation(), destination: dest));

        Value distance;
        if (result.isSuccess()) {
          distance = result.getSuccess()!;
        } else {
          distance = Value(value: 0, text: 'unknown');
        }

        searchResult.add(PlaceViewModel(place.placeId, place.name,
            place.formattedAddress!, place.photos[0].photoUrl, distance));
      }

      searchResult.sort((a, b) {
        return a.distance.value.compareTo(b.distance.value);
      });

      yield PlacesListLoaded(searchResult);
    });
  }
}

extension PositionX on Position {
  Location toLocation() => Location(lat: this.latitude, lng: this.longitude);
}
