import 'package:json_annotation/json_annotation.dart';
import 'package:places/googleapi/models/business_status.dart';
import 'package:places/googleapi/models/geometry_model.dart';
import 'package:places/googleapi/models/opening_hour_model.dart';
import 'package:places/googleapi/models/photo_model.dart';
import 'package:places/googleapi/models/plus_code_model.dart';
import 'package:places/googleapi/models/types.dart';

part 'place_model.g.dart';

@JsonSerializable()
class PlaceModel {
  PlaceModel({
    this.businessStatus,
    this.formattedAddress,
    this.geometry,
    this.icon,
    this.name,
    this.openingHours,
    this.photos,
    this.placeId,
    this.plusCode,
    this.priceLevel,
    this.rating,
    this.reference,
    this.types,
    this.userRatingsTotal,
  });

  @JsonKey(name: 'business_status')
  BusinessStatus? businessStatus;
  GeometryModel? geometry;
  @JsonKey(name: 'opening_hours')
  OpeningHours? openingHours;

  @JsonKey(name: 'plus_code')
  PlusCode? plusCode;

  @JsonKey(name: 'formatted_address')
  String? formattedAddress;
  String? icon;
  String? name;
  @JsonKey(name: 'place_id')
  String? placeId;
  @JsonKey(name: 'price_level')
  int? priceLevel;
  double? rating;
  String? reference;
  @JsonKey(name: 'user_ratings_total')
  int? userRatingsTotal;
  List<PhotoModel>? photos;
  List<PlaceType>? types;

  factory PlaceModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceModelToJson(this);
}
