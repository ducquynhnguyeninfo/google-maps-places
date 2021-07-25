import 'dart:convert';

import 'package:places/core/network/network_manager.dart';
import 'package:places/core/network/network_provider.dart';
import 'package:places/features/places/data/datasources/remote_api/models/models.dart'
    as m;
import 'package:places/features/places/data/datasources/remote_api/models/response/google_json_response.dart';
import 'package:places/features/places/domain/entities/entities.dart';
import 'package:places/features/places/domain/entities/place_details_entity.dart';
import 'package:places/features/places/data/datasources/mappers/remote_entity_mapper.dart';

abstract class RemoteApiDataSource {
  Future<List<PlaceEntity>> getGooglePlace(PlaceType type);

  Future<PlaceDetailsEntity?> getGooglePlaceDetails(String placeId);

  Future<PhotoEntity?> getGooglePlacePhoto(
      {required String placeId,
      required String photoReference,
      String? maxWith,
      String? maxHeight});
}

class RemoteApiDataSourceImpl extends NetworkProvider
    implements RemoteApiDataSource {
  static const place_api =
      'https://maps.googleapis.com/maps/api/place/textsearch/json';
  static const place_details_api =
      'https://maps.googleapis.com/maps/api/place/details/json';
  static const place_photos_api =
      'https://maps.googleapis.com/maps/api/place/details/json';

  final NetworkManager networkManager;

  RemoteApiDataSourceImpl({required this.networkManager})
      : super(networkManager: networkManager);

  @override
  Future<List<PlaceEntity>> getGooglePlace(PlaceType type) async {
    Map<String, String> parameters = {'type': type.eval()};

    var decoded = await get(place_api, queryParameters: parameters);
    var placeResponse = GooglePlaceResponse.fromJson(decoded);

    List<m.PlaceModel>? models = placeResponse.places;

    var entities = models?.map((e) => e.toEntity()).toList();

    return entities ?? [];
  }

  @override
  Future<PlaceDetailsEntity?> getGooglePlaceDetails(String placeId) async {
    Map<String, String> parameters = {'place_id': placeId};

    var decoded = await get(place_details_api, queryParameters: parameters);

    m.PlaceDetailsResponse detailsModel =
        m.PlaceDetailsResponse.fromJson(decoded);

    return detailsModel.result?.toEntity();
  }

  @override
  Future<PhotoEntity?> getGooglePlacePhoto(
      {required String placeId,
      required String photoReference,
      String? maxWith,
      String? maxHeight}) {
    // TODO: implement getGooglePlacePhoto
    throw UnimplementedError();
  }
}
