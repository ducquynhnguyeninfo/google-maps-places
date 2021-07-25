// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opening_hour_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpeningHoursModel _$OpeningHoursModelFromJson(Map<String, dynamic> json) {
  return OpeningHoursModel(
    openNow: json['open_now'] as bool?,
  )
    ..periods = (json['periods'] as List<dynamic>?)
        ?.map((e) => Period.fromJson(e as Map<String, dynamic>))
        .toList()
    ..weekdayText = (json['weekdayText'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList();
}

Map<String, dynamic> _$OpeningHoursModelToJson(OpeningHoursModel instance) =>
    <String, dynamic>{
      'open_now': instance.openNow,
      'periods': instance.periods,
      'weekdayText': instance.weekdayText,
    };
