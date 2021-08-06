import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:places/features/places/domain/usecases/get_place_detail_usecase.dart';

part 'place_details_event.dart';

part 'place_details_state.dart';

class PlaceDetailsBloc extends Bloc<PlaceDetailsEvent, PlaceDetailsState> {
  final GetPlaceDetailsUsecase getPlaceDetailsUsecase;

  PlaceDetailsBloc(this.getPlaceDetailsUsecase) : super(PlaceDetailsInitial());

  @override
  Stream<PlaceDetailsState> mapEventToState(
    PlaceDetailsEvent event,
  ) async* {
    if (event is GetPlaceDetailsEvent) {
      yield* getPlaceDetails(event.placeId);
    }
  }

  Stream<PlaceDetailsState> getPlaceDetails(String placeId) async* {
    yield PlaceDetailsLoading();

    var result = await getPlaceDetailsUsecase
        .call(GetPlaceDetailParams(placeId: placeId));

    yield* result.when((error) async* {
      yield PlaceDetailsError(message: error.runtimeType.toString());
    }, (PlaceDetails success) async* {
      yield PlaceDetailsLoaded(success);
    });
  }
}
