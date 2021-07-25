import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';


part 'address_component_model.g.dart';

@JsonSerializable()
class AddressComponentModel extends Equatable {
	final String? longName;
	final String? shortName;
	final List<String>? types;

	const AddressComponentModel({this.longName, this.shortName, this.types});


	factory AddressComponentModel.fromJson(Map<String, dynamic> json) => _$AddressComponentModelFromJson(json);
	Map<String, dynamic> toJson() => _$AddressComponentModelToJson(this);
	
	@override
	List<Object?> get props => [longName, shortName, types];
}
