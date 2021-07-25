import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:places/features/places/domain/entities/entities.dart';
import 'package:places/features/places/domain/usecases/get_near_places_usecase.dart';

part 'places_list_event.dart';

part 'places_list_state.dart';

class PlacesListBloc extends Bloc<PlacesListEvent, PlacesListState> {
  final GetNearPlacesUsecase getNearPlaces;

  PlacesListBloc(this.getNearPlaces) : super(PlacesListInitial());

  @override
  Stream<PlacesListState> mapEventToState(
    PlacesListEvent event,
  ) async* {
    if (event is GetNearPlacesEvent) {
      yield* _getNearPlaces();
    }
  }

  Stream<PlacesListState> _getNearPlaces() async* {
    var type = PlaceType.cafe;

    yield PlacesListLoading();

    await Future.delayed(Duration(seconds: 4), () {});

    var result = await getNearPlaces.call(GetNearPlacesParams(type: type));

    yield* result.when((error) async* {
      yield PlacesListError(message: error.runtimeType.toString());
    }, (List<PlaceEntity> success) async* {
      print("result size: ${result.getSuccess()!.length}");
      yield PlacesListLoaded(success);
    });
  }
}
