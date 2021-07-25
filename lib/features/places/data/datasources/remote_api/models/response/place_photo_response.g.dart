// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_photo_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlacePhotoResponse _$PlacePhotoResponseFromJson(Map<String, dynamic> json) {
  return PlacePhotoResponse(
    height: json['height'] as int?,
    htmlAttributions: (json['html_attributions'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    photoReference: json['photo_reference'] as String?,
    width: json['width'] as int?,
  );
}

Map<String, dynamic> _$PlacePhotoResponseToJson(PlacePhotoResponse instance) =>
    <String, dynamic>{
      'height': instance.height,
      'html_attributions': instance.htmlAttributions,
      'photo_reference': instance.photoReference,
      'width': instance.width,
    };
