import 'package:google_maps_webservice/places.dart';


extension PhotoX on Photo {
  static const thumbnailSize = 200;

  String get thumbnailUrl => 'https://maps.googleapis.com/maps/api/place/photo?maxwidth=$thumbnailSize&photoreference=$photoReference';

  String get photoUrl =>
      'https://maps.googleapis.com/maps/api/place/photo?maxwidth=$width&maxheight=$height&photoreference=$photoReference';

}