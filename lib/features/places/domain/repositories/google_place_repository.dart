// import 'package:google_maps_webservice/directions.dart';
import 'package:google_maps_webservice/distance.dart' as d;
import 'package:google_maps_webservice/places.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:places/core/error/failures.dart';
import 'package:places/features/places/data/datasources/remote_api/models/directions.dart';

abstract class GooglePlaceRepository {
  Future<Result<List<PlacesSearchResult>, Failure>> getGooglePlace(
      String query);

  Future<Result<PlaceDetails, Failure>> getGooglePlaceDetails(String placeId);

  Future<Result<d.Value, Failure>> getDistance({
    required String origin,
    required String destination,
  });

  Future<Result<Directions, Failure>> getDirection({
    required Location origin,
    required Location destination,
  });
}
