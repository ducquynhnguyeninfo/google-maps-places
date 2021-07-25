import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable()
class LocationModel {
  double? _lat;
  double? _lng;

  double? get lat => _lat;
  double? get lng => _lng;

  LocationModel({
    double? lat,
    double? lng}){
    _lat = lat;
    _lng = lng;
  }

  factory LocationModel.fromJson(Map<String, dynamic> json) => _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}