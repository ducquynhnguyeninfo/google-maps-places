import 'package:google_maps_webservice/directions.dart';
import 'package:google_maps_webservice/distance.dart' as distance;
import 'package:google_maps_webservice/geolocation.dart';
import 'package:google_maps_webservice/places.dart';

abstract class GoogleMapsWebserviceDatasource {
  Future<PlacesSearchResponse> getGooglePlace(String type);

  Future<PlacesDetailsResponse> getGooglePlaceDetails(String placeId);

  Future<distance.DistanceResponse> getDistance(
      {required String origin, required String destination});

  Future<DirectionsResponse> getDirections(
      {required Location origin, required Location destination});
}

class GoogleMapsWebserviceDatasourceImpl
    implements GoogleMapsWebserviceDatasource {
  final GoogleMapsPlaces placeService;
  final distance.GoogleDistanceMatrix distanceMatrix;
  final GoogleMapsGeolocation geolocation;
  final GoogleMapsDirections googleMapsDirections;

  GoogleMapsWebserviceDatasourceImpl(
      {required this.placeService,
      required this.distanceMatrix,
      required this.geolocation,
      required this.googleMapsDirections});

  @override
  Future<PlacesSearchResponse> getGooglePlace(String type) async {
    var searchResponse = await placeService.searchByText(type);

    return searchResponse;
  }

  @override
  Future<PlacesDetailsResponse> getGooglePlaceDetails(String placeId) async {
    var details = await placeService.getDetailsByPlaceId(placeId);
    return details;
  }

  @override
  Future<DirectionsResponse> getDirections(
      {required Location origin, required Location destination}) async {
    var directionsResponse =
        await googleMapsDirections.directionsWithLocation(origin, destination);

    return directionsResponse;
  }

  @override
  Future<distance.DistanceResponse> getDistance(
      {required String origin, required String destination}) async {
    var distanceWithAddress = await distanceMatrix
        .distanceWithAddress([origin], [destination], unit: Unit.metric);

    return distanceWithAddress;
  }
}
