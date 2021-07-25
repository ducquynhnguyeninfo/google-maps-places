import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/distance.dart';

extension LocationX on Location {
  LatLng toLatLng() => LatLng(this.lat, this.lng);

}


// extension