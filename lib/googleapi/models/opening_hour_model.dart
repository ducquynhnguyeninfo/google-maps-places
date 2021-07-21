import 'package:json_annotation/json_annotation.dart';

part 'opening_hour_model.g.dart';

@JsonSerializable()
class OpeningHours {
  OpeningHours({
    this.openNow,
  });

  @JsonKey(name: 'open_now')
  bool? openNow;

  factory OpeningHours.fromJson(Map<String, dynamic> json) =>
      _$OpeningHoursFromJson(json);

  Map<String, dynamic> toJson() => _$OpeningHoursToJson(this);
}
