import 'package:json_annotation/json_annotation.dart';

import '../models.dart';

part 'google_json_response.g.dart';

@JsonSerializable()
class GooglePlaceResponse {
  @JsonKey(name: 'html_attributions')
  final List<dynamic> htmlAttributions;

  @JsonKey(name: 'next_page_token')
  final String nextPageToken;

  @JsonKey(name: 'results')
  final List<PlaceModel>? places;

  String? status;

  GooglePlaceResponse(
      {required this.htmlAttributions,
      required this.nextPageToken,
      this.places});

  factory GooglePlaceResponse.fromJson(Map<String, dynamic> json) =>
      _$GooglePlaceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GooglePlaceResponseToJson(this);
}
