import 'package:json_annotation/json_annotation.dart';
import 'package:places/features/places/data/datasources/remote_api/models/place_details_model.dart';

part 'place_details_response.g.dart';

@JsonSerializable()
class PlaceDetailsResponse {
  final List<dynamic>? htmlAttributions;
  final PlaceDetailsModel? result;
  final String? status;

  const PlaceDetailsResponse({this.htmlAttributions, this.result, this.status});

  factory PlaceDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$PlaceDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceDetailsResponseToJson(this);
}
