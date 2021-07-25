// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceDetailsModel _$PlaceDetailsModelFromJson(Map<String, dynamic> json) {
  return PlaceDetailsModel(
    addressComponents: (json['addressComponents'] as List<dynamic>?)
        ?.map((e) => AddressComponentModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    adrAddress: json['adrAddress'] as String?,
    businessStatus: json['businessStatus'] as String?,
    formattedAddress: json['formattedAddress'] as String?,
    geometry: json['geometry'] == null
        ? null
        : GeometryModel.fromJson(json['geometry'] as Map<String, dynamic>),
    icon: json['icon'] as String?,
    name: json['name'] as String?,
    openingHours: json['openingHours'] == null
        ? null
        : OpeningHoursModel.fromJson(
            json['openingHours'] as Map<String, dynamic>),
    photos: (json['photos'] as List<dynamic>?)
        ?.map((e) => PhotoModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    placeId: json['placeId'] as String?,
    plusCode: json['plusCode'] == null
        ? null
        : PlusCodeModel.fromJson(json['plusCode'] as Map<String, dynamic>),
    priceLevel: json['priceLevel'] as int?,
    rating: (json['rating'] as num?)?.toDouble(),
    reference: json['reference'] as String?,
    reviews: (json['reviews'] as List<dynamic>?)
        ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
        .toList(),
    types: (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
    url: json['url'] as String?,
    userRatingsTotal: json['userRatingsTotal'] as int?,
    utcOffset: json['utcOffset'] as int?,
    vicinity: json['vicinity'] as String?,
  );
}

Map<String, dynamic> _$PlaceDetailsModelToJson(PlaceDetailsModel instance) =>
    <String, dynamic>{
      'addressComponents': instance.addressComponents,
      'adrAddress': instance.adrAddress,
      'businessStatus': instance.businessStatus,
      'formattedAddress': instance.formattedAddress,
      'geometry': instance.geometry,
      'icon': instance.icon,
      'name': instance.name,
      'openingHours': instance.openingHours,
      'photos': instance.photos,
      'placeId': instance.placeId,
      'plusCode': instance.plusCode,
      'priceLevel': instance.priceLevel,
      'rating': instance.rating,
      'reference': instance.reference,
      'reviews': instance.reviews,
      'types': instance.types,
      'url': instance.url,
      'userRatingsTotal': instance.userRatingsTotal,
      'utcOffset': instance.utcOffset,
      'vicinity': instance.vicinity,
    };
