import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'hive_models.dart';

part 'place.g.dart';
@HiveType(typeId: 6)
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

  @HiveField(1)
  BusinessStatus? businessStatus;
  @HiveField(2)
  GeometryModel? geometry;
  @HiveField(3)
  OpeningHoursModel? openingHours;

  @HiveField(4)
  PlusCodeModel? plusCode;

  @HiveField(5)
  String? formattedAddress;

  @HiveField(6)
  String? icon;
  @HiveField(7)
  String? name;
  @HiveField(8)
  @JsonKey(name: 'place_id')
  String? placeId;
  @JsonKey(name: 'price_level')
  @HiveField(9)
  int? priceLevel;
  @HiveField(10)
  double? rating;
  @HiveField(11)
  String? reference;
  @JsonKey(name: 'user_ratings_total')
  @HiveField(12)
  int? userRatingsTotal;
  @HiveField(13)
  List<PhotoModel>? photos;
  @HiveField(14)
  List<PlaceType>? types;
}
