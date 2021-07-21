// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opening_hour_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpeningHours _$OpeningHoursFromJson(Map<String, dynamic> json) {
  return OpeningHours(
    openNow: json['open_now'] as bool?,
  );
}

Map<String, dynamic> _$OpeningHoursToJson(OpeningHours instance) =>
    <String, dynamic>{
      'open_now': instance.openNow,
    };
