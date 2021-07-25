import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_webservice/directions.dart';
import 'package:google_maps_webservice/distance.dart';
import 'package:places/features/places/data/datasources/remote_api/models/directions.dart';
import 'package:places/features/places/domain/usecases/get_direction_usecase.dart';
import 'package:places/features/places/domain/usecases/get_distance_usecase.dart';
import 'package:places/utils/location_helper.dart';

part 'direction_map_event.dart';
part 'direction_map_state.dart';

class DirectionMapBloc extends Bloc<DirectionMapEvent, DirectionMapState> {
  DirectionMapBloc(this.directionUsercase) : super(DirectionMapInitial());

  final GetDirectionsUsecase directionUsercase;

  @override
  Stream<DirectionMapState> mapEventToState(
    DirectionMapEvent event,
  ) async* {

    if (event is GetDirectionEvent) {
      yield* getDirections(event.origin, event.destination);
    }
  }


Stream<DirectionMapState> getDirections(Location origin, Location destination) async* {
  yield DirectionMapLoading();

  var result = await directionUsercase.call(GetDirectionsParams(origin: origin, destination: destination));

  yield* result.when((error) async* {
    yield  DirectionMapError(message: error.runtimeType.toString());
  }, (Directions success) async* {

    yield  DirectionMapLoaded(success);
  });
}
}