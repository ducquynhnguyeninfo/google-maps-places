part of 'places_list_bloc.dart';

abstract class PlacesListState extends Equatable {
  const PlacesListState();

  @override
  List<Object> get props => [];
}

class PlacesListInitial extends PlacesListState {}

class PlacesListLoading extends PlacesListState {}

class PlacesListEmpty extends PlacesListState {}

class PlacesListLoaded extends PlacesListState {
  final List<PlaceViewModel> places;

  PlacesListLoaded(this.places);

  @override
  List<Object> get props => [places];
}

class PlacesListError extends PlacesListState {
  final String message;

  PlacesListError({required this.message});

  @override
  List<Object> get props => [message];
}
