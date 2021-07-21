// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewport_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViewportModel _$ViewportModelFromJson(Map<String, dynamic> json) {
  return ViewportModel(
    northeast: json['northeast'] == null
        ? null
        : LocationModel.fromJson(json['northeast'] as Map<String, dynamic>),
    southwest: json['southwest'] == null
        ? null
        : LocationModel.fromJson(json['southwest'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ViewportModelToJson(ViewportModel instance) =>
    <String, dynamic>{
      'northeast': instance.northeast,
      'southwest': instance.southwest,
    };
