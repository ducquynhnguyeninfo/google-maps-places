import 'entities.dart';

class PlaceEntity {
  PlaceEntity({
    this.businessStatus,
    this.formattedAddress,
    this.geometry,
    this.icon,
    this.name,
    this.openingHours,
    this.photo,
    this.placeId,
    this.plusCode,
    this.priceLevel,
    this.rating,
    this.reference,
    this.types,
    this.userRatingsTotal,
  });

  BusinessStatus? businessStatus;
  GeometryEntity? geometry;
  OpeningHoursEntity? openingHours;

  PlusCodeEntity? plusCode;

  String? formattedAddress;

  String? icon;
  String? name;
  String? placeId;
  int? priceLevel;
  double? rating;
  String? reference;
  int? userRatingsTotal;
  PhotoEntity? photo;
  List<PlaceType>? types;
}
