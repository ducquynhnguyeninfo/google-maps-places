part of 'places_list_bloc.dart';

abstract class PlacesListEvent extends Equatable {
  const PlacesListEvent();
  List<Object?> get props => [];

}

class GetNearPlacesEvent extends PlacesListEvent {

  final String placeType;

  GetNearPlacesEvent(this.placeType);

  @override
  List<Object?> get props => [placeType];
}

