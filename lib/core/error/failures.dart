import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List<dynamic>? properties;

  const Failure(this.properties);

  @override
  List<Object?> get props => properties ?? [];
}

class ServerFailure extends Failure {
  const ServerFailure({List? properties}) : super(properties);
}

class CacheFailure extends Failure {
  const CacheFailure({List? properties}) : super(properties);
}
