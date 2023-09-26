import 'package:equatable/equatable.dart';
import 'package:google_maps_webservice/distance.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:places/core/error/failures.dart';
import 'package:places/core/usercases/usercase.dart';
import 'package:places/features/places/domain/repositories/google_place_repository.dart';

class GetDistanceUsecase implements UserCase<Value?, GetDistanceParams> {
  final GooglePlaceRepository repository;

  GetDistanceUsecase(this.repository);

  @override
  Future<Result<Value, Failure>> call(GetDistanceParams params) async {
    var result = await repository.getDistance(
        origin: params.origin.toString(),
        destination: params.destination.toString());

    return Result.success(result.getOrThrow());
  }
}

class GetDistanceParams extends Equatable {
  final Location origin;
  final Location destination;

  GetDistanceParams({required this.origin, required this.destination});

  @override
  List<Object?> get props => [origin, destination];
}
