import 'package:json_annotation/json_annotation.dart';

import 'period_model.dart';

part 'opening_hour_model.g.dart';

@JsonSerializable()
class OpeningHoursModel {
  OpeningHoursModel({
    this.openNow,
  });

  @JsonKey(name: 'open_now')
  bool? openNow;

  List<Period>? periods;

  List<String>? weekdayText;

  factory OpeningHoursModel.fromJson(Map<String, dynamic> json) =>
      _$OpeningHoursModelFromJson(json);

  Map<String, dynamic> toJson() => _$OpeningHoursModelToJson(this);
}
