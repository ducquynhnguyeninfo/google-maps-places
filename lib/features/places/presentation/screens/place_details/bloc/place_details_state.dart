part of 'place_details_bloc.dart';

abstract class PlaceDetailsState extends Equatable {
  const PlaceDetailsState();

  @override
  List<Object> get props => [];
}

class PlaceDetailsInitial extends PlaceDetailsState {}

class PlaceDetailsLoading extends PlaceDetailsState {}

class PlaceDetailsEmpty extends PlaceDetailsState {}

class PlaceDetailsLoaded extends PlaceDetailsState {
  final PlaceDetails detail;

  PlaceDetailsLoaded(this.detail);

  @override
  List<Object> get props => [detail];
}

class PlaceDetailsError extends PlaceDetailsState {
  final String message;

  PlaceDetailsError({required this.message});

  @override
  List<Object> get props => [message];
}
