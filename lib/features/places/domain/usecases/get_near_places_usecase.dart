import 'package:equatable/equatable.dart';
import 'package:multiple_result/multiple_result.dart';

import 'package:places/core/error/failures.dart';
import 'package:places/core/usercases/usercase.dart';
import 'package:places/features/places/domain/entities/entities.dart';
import 'package:places/features/places/domain/repositories/google_place_repository.dart';

class GetNearPlacesUsecase
    implements UserCase<List<PlaceEntity>, GetNearPlacesParams> {
  final GooglePlaceRepository repository;

  GetNearPlacesUsecase(this.repository);

  @override
  Future<Result<Failure, List<PlaceEntity>>> call(
      GetNearPlacesParams? params) async {
     var result = await repository.getGooglePlace(params!.type);

     return result;
  }
}

class GetNearPlacesParams extends Equatable {
  final PlaceType type;

  GetNearPlacesParams({required this.type});

  @override
  List<Object?> get props => [type];
}
