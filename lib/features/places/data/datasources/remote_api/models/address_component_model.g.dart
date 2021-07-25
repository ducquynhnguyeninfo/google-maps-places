// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_component_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressComponentModel _$AddressComponentModelFromJson(
    Map<String, dynamic> json) {
  return AddressComponentModel(
    longName: json['longName'] as String?,
    shortName: json['shortName'] as String?,
    types: (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$AddressComponentModelToJson(
        AddressComponentModel instance) =>
    <String, dynamic>{
      'longName': instance.longName,
      'shortName': instance.shortName,
      'types': instance.types,
    };
