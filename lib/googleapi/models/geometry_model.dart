import 'package:json_annotation/json_annotation.dart';
import 'package:places/googleapi/models/location_model.dart';
import 'package:places/googleapi/models/viewport_model.dart';

part 'geometry_model.g.dart';

@JsonSerializable()
class GeometryModel {
  GeometryModel({
    this.location,
    this.viewport,
  });

  LocationModel? location;

  @JsonKey(name: 'viewport')
  ViewportModel? viewport;

  factory GeometryModel.fromJson(Map<String, dynamic> json) => _$GeometryModelFromJson(json);

  Map<String, dynamic> toJson() => _$GeometryModelToJson(this);
}
