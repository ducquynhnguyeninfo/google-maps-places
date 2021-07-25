import 'package:places/config/shared_keys.dart';

class PhotoEntity {

  final int thumbnailSize = 200;

  PhotoEntity({
    this.htmlAttributions,
    this.photoReference,
    this.height,
    this.width,
  });

  List<String>? htmlAttributions;
  String? photoReference;
  int? height;
  int? width;

  String get photoUrl =>
      'https://maps.googleapis.com/maps/api/place/photo?maxwidth=$width&maxheight=$height&photoreference=$photoReference';

  String get thumbnailUrl => 'https://maps.googleapis.com/maps/api/place/photo?maxwidth=$thumbnailSize&photoreference=$photoReference&key=${SharedKeys.secretKey}';
}
