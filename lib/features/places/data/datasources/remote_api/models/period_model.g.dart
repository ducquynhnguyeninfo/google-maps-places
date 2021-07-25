// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'period_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Period _$PeriodFromJson(Map<String, dynamic> json) {
  return Period(
    open: json['open'] == null
        ? null
        : OpenModel.fromJson(json['open'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PeriodToJson(Period instance) => <String, dynamic>{
      'open': instance.open,
    };
