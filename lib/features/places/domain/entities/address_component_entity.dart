import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';


class AddressComponentEntity extends Equatable {
	final String? longName;
	final String? shortName;
	final List<String>? types;

	const AddressComponentEntity({this.longName, this.shortName, this.types});

	@override
	List<Object?> get props => [longName, shortName, types];
}
