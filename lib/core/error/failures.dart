import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List<dynamic>? properties;

  Failure(this.properties);

  @override
  List<Object?> get props => properties ?? [];
}

class ServerFailure extends Failure {
  ServerFailure({List? properties}) : super(properties);
}

class CacheFailure extends Failure {
  CacheFailure({List? properties}) : super(properties);
}
