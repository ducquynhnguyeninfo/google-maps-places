
import 'models/hive_models.dart';

abstract class LocalCacheDataSource {

  Future<List<PlaceModel>> getGooglePlaces(PlaceType type);
  Future<PlaceModel> getPlaceById(String id);

  Future<PhotoModel> getGooglePlacePhoto(
      {required String placeId,
      required String photoReference,
      String? maxWith,
      String? maxHeight});
}
