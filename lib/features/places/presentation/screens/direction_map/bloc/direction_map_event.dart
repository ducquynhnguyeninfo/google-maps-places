part of 'direction_map_bloc.dart';

abstract class DirectionMapEvent extends Equatable {
  const DirectionMapEvent();
  @override
  List<Object?> get props => [];
}

class GetDirectionEvent extends DirectionMapEvent {
  final Location origin;
  final Location destination;

  GetDirectionEvent(this.origin, this.destination);

  @override
  List<Object?> get props => [origin, destination];
}