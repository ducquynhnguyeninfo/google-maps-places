import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/directions.dart';
import 'package:places/core/error/exceptions.dart';

class Directions {
  final LatLngBounds bounds;
  final List<PointLatLng> polylinePoints;
  final String totalDistance;
  final String totalDuration;

  const Directions({
    required this.bounds,
    required this.polylinePoints,
    required this.totalDistance,
    required this.totalDuration,
  });

  factory Directions.fromResponse(DirectionsResponse response) {
    // Check if route is not available
    if (response.routes.isEmpty) throw ServerException();

    // Get route information
    var route = response.routes[0];

    // Bounds
    final northeast = route.bounds.northeast;
    final southwest = route.bounds.southwest;
    final bounds = LatLngBounds(
      northeast: LatLng(northeast.lat, northeast.lng),
      southwest: LatLng(southwest.lat, southwest.lng),
    );

    // Distance & Duration
    String distance = '';
    String duration = '';
    if (route.legs.isNotEmpty) {
      final leg = route.legs[0];
      distance = leg.distance.text;
      duration = leg.duration.text;
    }

    return Directions(
      bounds: bounds,
      totalDistance: distance,
      totalDuration: duration,
      polylinePoints: PolylinePoints().decodePolyline(route.overviewPolyline.points)
    );
  }
}