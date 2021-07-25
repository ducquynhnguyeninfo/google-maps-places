// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geometry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeometryModel _$GeometryModelFromJson(Map<String, dynamic> json) {
  return GeometryModel(
    location: json['location'] == null
        ? null
        : LocationModel.fromJson(json['location'] as Map<String, dynamic>),
    viewport: json['viewport'] == null
        ? null
        : ViewportModel.fromJson(json['viewport'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GeometryModelToJson(GeometryModel instance) =>
    <String, dynamic>{
      'location': instance.location,
      'viewport': instance.viewport,
    };
