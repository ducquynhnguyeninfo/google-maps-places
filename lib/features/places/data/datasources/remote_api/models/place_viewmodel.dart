import 'package:google_maps_webservice/distance.dart';

class PlaceViewModel {
  final String placeId;
  final String name;
  final String address;
  final String photoUrl;
  final Value distance;

  PlaceViewModel(
      this.placeId, this.name, this.address, this.photoUrl, this.distance);
}
