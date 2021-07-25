import 'package:multiple_result/multiple_result.dart';
import 'package:places/core/error/failures.dart';
import 'package:places/features/places/domain/entities/entities.dart';
import 'package:places/features/places/domain/entities/place_details_entity.dart';

abstract class GooglePlaceRepository {
  Future<Result<Failure, List<PlaceEntity>>> getGooglePlace(PlaceType type);

  Future<Result<Failure, PlaceDetailsEntity?>> getGooglePlaceDetails(
      String placeId);

  Future<Result<Failure, PhotoEntity?>> getGooglePlacePhoto(
      {required String placeId,
      required String photoReference,
      String? maxWith,
      String? maxHeight});
}
