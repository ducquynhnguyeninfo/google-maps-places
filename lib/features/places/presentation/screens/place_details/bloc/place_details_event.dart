part of 'place_details_bloc.dart';

abstract class PlaceDetailsEvent extends Equatable {
  const PlaceDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetPlaceDetailsEvent extends PlaceDetailsEvent {
  final String placeId;

  GetPlaceDetailsEvent(this.placeId);

  @override
  List<Object> get props => [placeId];
}
