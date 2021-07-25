import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'review_model.g.dart';

@JsonSerializable()
class Review extends Equatable {
	final String? authorName;
	final String? authorUrl;
	final String? language;
	final String? profilePhotoUrl;
	final int? rating;
	final String? relativeTimeDescription;
	final String? text;
	final int? time;

	const Review({
		this.authorName, 
		this.authorUrl, 
		this.language, 
		this.profilePhotoUrl, 
		this.rating, 
		this.relativeTimeDescription, 
		this.text, 
		this.time, 
	});


	factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
	Map<String, dynamic> toJson() => _$ReviewToJson(this);

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

