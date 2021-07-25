import 'package:equatable/equatable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:places/core/error/failures.dart';
import 'package:places/core/usercases/usercase.dart';
import 'package:places/features/places/domain/entities/entities.dart';
import 'package:places/features/places/domain/repositories/google_place_repository.dart';

class GetPlaceDetailsUsecase
    implements UserCase<PlaceDetailsEntity?, GetPlaceDetailParams> {
  final GooglePlaceRepository repository;

  GetPlaceDetailsUsecase(this.repository);

  @override
  Future<Result<Failure, PlaceDetailsEntity?>> call(
      GetPlaceDetailParams? params) async {
    var result = await repository.getGooglePlaceDetails(params!.placeId);

    return result;
  }
}

class GetPlaceDetailParams extends Equatable {
  final String placeId;

  GetPlaceDetailParams({required this.placeId});

  @override
  List<Object?> get props => [placeId];
}
