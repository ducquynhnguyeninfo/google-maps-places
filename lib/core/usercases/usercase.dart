import 'package:equatable/equatable.dart';
import 'package:places/core/error/failures.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class UserCase<T, P> {
  Future<Result<Failure, T>> call(P params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
