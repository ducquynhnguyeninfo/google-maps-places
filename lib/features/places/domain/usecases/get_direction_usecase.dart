import 'package:equatable/equatable.dart';
import 'package:google_maps_webservice/directions.dart';

import 'package:multiple_result/multiple_result.dart';
import 'package:places/core/error/failures.dart';
import 'package:places/core/usercases/usercase.dart';
import 'package:places/features/places/data/datasources/remote_api/models/directions.dart';
import 'package:places/features/places/domain/repositories/google_place_repository.dart';

class GetDirectionsUsecase
    implements UserCase<Directions, GetDirectionsParams> {
  final GooglePlaceRepository repository;

  GetDirectionsUsecase(this.repository);

  @override
  Future<Result<Directions, Failure>> call(GetDirectionsParams params) async {
    var result = await repository.getDirection(
        origin: params.origin, destination: params.destination);

    return result;
  }
}

class GetDirectionsParams extends Equatable {
  final Location origin;
  final Location destination;

  GetDirectionsParams({required this.origin, required this.destination});

  @override
  List<Object?> get props => [origin, destination];
}
