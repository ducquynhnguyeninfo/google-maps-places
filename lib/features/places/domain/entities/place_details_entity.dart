import 'address_component_entity.dart';
import 'entities.dart';
import 'package:equatable/equatable.dart';

import 'review_entity.dart';

class PlaceDetailsEntity extends Equatable {
  List<AddressComponentEntity>? addressComponents;
  String? adrAddress;
  String? businessStatus;
  String? formattedAddress;
  GeometryEntity? geometry;
  String? icon;
  String? name;
  OpeningHoursEntity? openingHours;
  List<PhotoEntity>? photos;
  String? placeId;
  PlusCodeEntity? plusCode;
  int? priceLevel;
  double? rating;
  String? reference;
  List<ReviewEntity>? reviews;
  List<String>? types;
  String? url;
  int? userRatingsTotal;
  int? utcOffset;
  String? vicinity;

  PlaceDetailsEntity({
    this.addressComponents,
    this.adrAddress,
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
    this.reviews,
    this.types,
    this.url,
    this.userRatingsTotal,
    this.utcOffset,
    this.vicinity,
  });

  @override
  List<Object?> get props {
    return [
      addressComponents,
      adrAddress,
      businessStatus,
      formattedAddress,
      geometry,
      icon,
      name,
      openingHours,
      photos,
      placeId,
      plusCode,
      priceLevel,
      rating,
      reference,
      reviews,
      types,
      url,
      userRatingsTotal,
      utcOffset,
      vicinity,
    ];
  }
}
