// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceDetailsResponse _$PlaceDetailsResponseFromJson(Map<String, dynamic> json) {
  return PlaceDetailsResponse(
    htmlAttributions: json['htmlAttributions'] as List<dynamic>?,
    result: json['result'] == null
        ? null
        : PlaceDetailsModel.fromJson(json['result'] as Map<String, dynamic>),
    status: json['status'] as String?,
  );
}

Map<String, dynamic> _$PlaceDetailsResponseToJson(
        PlaceDetailsResponse instance) =>
    <String, dynamic>{
      'htmlAttributions': instance.htmlAttributions,
      'result': instance.result,
      'status': instance.status,
    };
