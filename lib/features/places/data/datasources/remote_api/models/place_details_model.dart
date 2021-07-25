import 'package:json_annotation/json_annotation.dart';

import 'package:equatable/equatable.dart';
import 'address_component_model.dart';
import 'models.dart';
import 'review_model.dart';

part 'place_details_model.g.dart';

@JsonSerializable()
class PlaceDetailsModel extends Equatable {
	final List<AddressComponentModel>? addressComponents;
	final String? adrAddress;
	final String? businessStatus;
	final String? formattedAddress;
	final GeometryModel? geometry;
	final String? icon;
	final String? name;
	final OpeningHoursModel? openingHours;
	final List<PhotoModel>? photos;
	final String? placeId;
	final PlusCodeModel? plusCode;
	final int? priceLevel;
	final double? rating;
	final String? reference;
	final List<Review>? reviews;
	final List<String>? types;
	final String? url;
	final int? userRatingsTotal;
	final int? utcOffset;
	final String? vicinity;

	const PlaceDetailsModel({
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


	factory PlaceDetailsModel.fromJson(Map<String, dynamic> json) => _$PlaceDetailsModelFromJson(json);
	Map<String, dynamic> toJson() => _$PlaceDetailsModelToJson(this);
	
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
