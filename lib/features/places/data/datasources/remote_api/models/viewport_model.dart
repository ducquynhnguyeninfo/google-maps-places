import 'package:json_annotation/json_annotation.dart';
import 'models.dart';

part 'viewport_model.g.dart';

@JsonSerializable()
class ViewportModel {
  LocationModel? _northeast;
  LocationModel? _southwest;

  LocationModel? get northeast => _northeast;

  LocationModel? get southwest => _southwest;

  ViewportModel({LocationModel? northeast, LocationModel? southwest}) {
    _northeast = northeast;
    _southwest = southwest;
  }

  factory ViewportModel.fromJson(Map<String, dynamic> json) =>
      _$ViewportModelFromJson(json);

  Map<String, dynamic> toJson() => _$ViewportModelToJson(this);
}
