import 'package:places/core/error/failures.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class UserCase<T, P> {

  Future<Result<Failure, T>> call(P? params);
}
