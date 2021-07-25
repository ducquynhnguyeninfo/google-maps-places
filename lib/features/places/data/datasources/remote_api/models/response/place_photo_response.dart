import 'package:json_annotation/json_annotation.dart';

part 'place_photo_response.g.dart';

@JsonSerializable()
class PlacePhotoResponse {
  PlacePhotoResponse({
    this.height,
    this.htmlAttributions,
    this.photoReference,
    this.width,
  });

  int? height;

  @JsonKey(name: 'html_attributions')
  List<String>? htmlAttributions;

  @JsonKey(name: 'photo_reference')
  String? photoReference;
  int? width;

  factory PlacePhotoResponse.fromJson(Map<String, dynamic> json) => _$PlacePhotoResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PlacePhotoResponseToJson(this);

}
