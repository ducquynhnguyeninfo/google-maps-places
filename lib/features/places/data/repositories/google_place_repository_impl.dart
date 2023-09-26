import 'package:google_maps_webservice/directions.dart';
import 'package:google_maps_webservice/distance.dart' as distance;
import 'package:google_maps_webservice/geolocation.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:places/core/error/exceptions.dart';
import 'package:places/core/error/failures.dart';
import 'package:places/features/places/data/datasources/local/local_datasource.dart';
import 'package:places/features/places/data/datasources/remote_api/google_maps_webservice_datasource.dart';
import 'package:places/features/places/data/datasources/remote_api/models/directions.dart';
import 'package:places/features/places/domain/repositories/google_place_repository.dart';

class GooglePlaceRepositoryImpl implements GooglePlaceRepository {
  // final LocalDataSource localCacheDataSource;
  final GoogleMapsWebserviceDatasource googleMapsWebserviceDatasource;

  GooglePlaceRepositoryImpl({
    required this.googleMapsWebserviceDatasource,
    // required this.localCacheDataSource
  });

  @override
  Future<Result<List<PlacesSearchResult>, Failure>> getGooglePlace(
      String type) async {
    var response = await googleMapsWebserviceDatasource.getGooglePlace(type);
    if (response.status != 'OK') {
      return Error(ServerFailure(properties: [response.errorMessage]));
    }
    return Success(response.results);
  }

  @override
  Future<Result<PlaceDetails, Failure>> getGooglePlaceDetails(
      String placeId) async {
    var response =
        await googleMapsWebserviceDatasource.getGooglePlaceDetails(placeId);
    if (response.status != 'OK') {
      return Error(ServerFailure(properties: [response.errorMessage]));
    }
    return Success(response.result);
  }

  @override
  Future<Result<distance.Value, Failure>> getDistance(
      {required String origin, required String destination}) async {
    try {
      var response = await googleMapsWebserviceDatasource.getDistance(
          origin: origin, destination: destination);

      if (response.status != 'OK') {
        return Error(ServerFailure(properties: [response.errorMessage]));
      }

      var rows = response.rows;
      if (rows.isEmpty || response.rows[0].elements.isEmpty) {
        return Result.error(
            ServerFailure(properties: [Exception("data is empty")]));
      }

      return Success(rows[0].elements[0].distance);
    } on ServerException catch (e) {
      return Result.error(ServerFailure(properties: [e]));
    }
  }

  @override
  Future<Result<Directions, Failure>> getDirection(
      {required Location origin, required Location destination}) async {
    try {
      var response = await googleMapsWebserviceDatasource.getDirections(
          origin: origin, destination: destination);
      if (response.status != 'OK') {
        return Error(ServerFailure(properties: [response.errorMessage]));
      }
      return Success(Directions.fromResponse(response));
    } on ServerException catch (e) {
      return Error(ServerFailure(properties: [e]));
    }
  }
}
