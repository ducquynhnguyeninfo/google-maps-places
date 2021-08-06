import 'package:google_maps_webservice/directions.dart';
import 'package:google_maps_webservice/distance.dart' as d;
import 'package:google_maps_webservice/places.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:places/core/error/failures.dart';
import 'package:places/features/places/data/datasources/remote_api/models/directions.dart';

abstract class GooglePlaceRepository {
  Future<Result<Failure, List<PlacesSearchResult>>> getGooglePlace(String query);

  Future<Result<Failure, PlaceDetails>> getGooglePlaceDetails(
      String placeId);

  Future<Result<Failure, d.Value>> getDistance({
    required String origin,
    required String destination,
  });

  Future<Result<Failure, Directions>> getDirection({
    required Location origin,
    required Location destination,
  });
}
