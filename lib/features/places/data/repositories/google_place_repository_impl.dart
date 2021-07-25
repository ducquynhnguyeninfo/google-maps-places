import 'package:multiple_result/multiple_result.dart';
import 'package:places/core/error/failures.dart';
import 'package:places/core/network/network_manager.dart';
import 'package:places/features/places/data/datasources/local/local_cache_datasource.dart';
import 'package:places/features/places/data/datasources/remote_api/remote_api_datasource.dart';
import 'package:places/features/places/domain/entities/entities.dart';
import 'package:places/features/places/domain/repositories/google_place_repository.dart';

class GooglePlaceRepositoryImpl implements GooglePlaceRepository {
  // final LocalCacheDataSource localCacheDataSource;
  final RemoteApiDataSource remoteApiDataSource;
  final NetworkManager networkManager;

  GooglePlaceRepositoryImpl(
      {
        required this.remoteApiDataSource,
      // required this.localCacheDataSource,
      required this.networkManager});

  @override
  Future<Result<Failure, List<PlaceEntity>>> getGooglePlace(
      PlaceType type) async {
    if (networkManager.isConnected) {
      return Success(await remoteApiDataSource.getGooglePlace(type));
    }
    return Error(ServerFailure());
  }

  @override
  Future<Result<Failure, PlaceDetailsEntity?>> getGooglePlaceDetails(
      String placeId) async {
    if (networkManager.isConnected) {
      return Success(await remoteApiDataSource.getGooglePlaceDetails(placeId));
    }
    return Error(ServerFailure());
  }

  @override
  Future<Result<Failure, PhotoEntity>> getGooglePlacePhoto(
      {required String placeId,
      required String photoReference,
      String? maxWith,
      String? maxHeight}) {
    // TODO: implement getGooglePlacePhoto
    throw UnimplementedError();
  }
}
