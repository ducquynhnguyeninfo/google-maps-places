// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_json_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GooglePlaceResponse _$GooglePlaceResponseFromJson(Map<String, dynamic> json) {
  return GooglePlaceResponse(
    htmlAttributions: json['html_attributions'] as List<dynamic>,
    nextPageToken: json['next_page_token'] as String,
    places: (json['results'] as List<dynamic>?)
        ?.map((e) => PlaceModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  )..status = json['status'] as String?;
}

Map<String, dynamic> _$GooglePlaceResponseToJson(
        GooglePlaceResponse instance) =>
    <String, dynamic>{
      'html_attributions': instance.htmlAttributions,
      'next_page_token': instance.nextPageToken,
      'results': instance.places,
      'status': instance.status,
    };
