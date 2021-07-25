import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class ReviewEntity extends Equatable {
	final String? authorName;
	final String? authorUrl;
	final String? language;
	final String? profilePhotoUrl;
	final int? rating;
	final String? relativeTimeDescription;
	final String? text;
	final int? time;

	const ReviewEntity({
		this.authorName, 
		this.authorUrl, 
		this.language, 
		this.profilePhotoUrl, 
		this.rating, 
		this.relativeTimeDescription, 
		this.text, 
		this.time, 
	});


	@override
	List<Object?> get props {
		return [
				authorName,
				authorUrl,
				language,
				profilePhotoUrl,
				rating,
				relativeTimeDescription,
				text,
				time,
		];
	}
}

