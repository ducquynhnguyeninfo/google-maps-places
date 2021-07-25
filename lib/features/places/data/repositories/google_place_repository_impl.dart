import 'package:google_maps_webservice/directions.dart';
import 'package:google_maps_webservice/distance.dart' as distance;
import 'package:google_maps_webservice/geolocation.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:places/core/error/exceptions.dart';
import 'package:places/core/error/failures.dart';
import 'package:places/core/network/network_manager.dart';
import 'package:places/features/places/data/datasources/local/local_datasource.dart';
import 'package:places/features/places/data/datasources/remote_api/google_maps_webservice_datasource.dart';
import 'package:places/features/places/data/datasources/remote_api/models/directions.dart';
import 'package:places/features/places/domain/repositories/google_place_repository.dart';


class GooglePlaceRepositoryImpl implements GooglePlaceRepository {
  final LocalCacheDataSource localCacheDataSource;
  final GoogleMapsWebserviceDatasource googleMapsWebserviceDatasource;
  final NetworkManager networkManager;

  GooglePlaceRepositoryImpl(
      {required this.googleMapsWebserviceDatasource,
      required this.localCacheDataSource,
      required this.networkManager});

  @override
  Future<Result<Failure, List<PlacesSearchResult>>> getGooglePlace(
      String type) async {
    if (networkManager.isConnected) {
      var response = await googleMapsWebserviceDatasource.getGooglePlace(type);
      if (response.status != 'OK') {
        return Error(ServerFailure(properties: [response.errorMessage]));
      }
      return Success(response.results);
    }
    return Error(ServerFailure());
  }

  @override
  Future<Result<Failure, PlaceDetails>> getGooglePlaceDetails(
      String placeId) async {
    if (networkManager.isConnected) {

      var response = await googleMapsWebserviceDatasource.getGooglePlaceDetails(placeId);
      if (response.status != 'OK') {
        return Error(ServerFailure(properties: [response.errorMessage]));
      }
      return Success(response.result);
    }
    return Error(ServerFailure());
  }

  @override
  Future<Result<Failure, distance.Value>> getDistance(
      {required String origin, required String destination}) async {
    try {
      var response = await googleMapsWebserviceDatasource.getDistance(
          origin: origin, destination: destination);

      if (response.status != 'OK') {
        return Error(ServerFailure(properties: [response.errorMessage]));
      }

      var rows = response.rows;
      if (rows.isEmpty || response.rows[0].elements.isEmpty)  {
        return Error(ServerFailure(properties: []));
      }

      return Success(rows[0].elements[0].distance);
    } on ServerException catch (e) {
      return Error(ServerFailure());
    }
  }

  @override
  Future<Result<Failure, Directions>> getDirection(
      {required Location origin, required Location destination}) async {
    try {
      var response = await googleMapsWebserviceDatasource.getDirections(
          origin: origin, destination: destination);
      if (response.status != 'OK') {
        return Error(ServerFailure(properties: [response.errorMessage]));
      }
      return Success(Directions.fromResponse(response));
    } on ServerException catch (e) {
      return Error(ServerFailure());
    }
  }
}
