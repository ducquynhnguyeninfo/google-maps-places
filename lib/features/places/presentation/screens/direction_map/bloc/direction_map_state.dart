part of 'direction_map_bloc.dart';

abstract class DirectionMapState extends Equatable {
  const DirectionMapState();

  @override
  List<Object> get props => [];
}

class DirectionMapInitial extends DirectionMapState {}

class DirectionMapLoading extends DirectionMapState {}

class DirectionMapEmpty extends DirectionMapState {}

class DirectionMapLoaded extends DirectionMapState {
  final Directions directions;

  DirectionMapLoaded(this.directions);

  @override
  List<Object> get props => [directions];
}

class DirectionMapError extends DirectionMapState {
  final String message;

  DirectionMapError({required this.message});

  @override
  List<Object> get props => [message];
}
