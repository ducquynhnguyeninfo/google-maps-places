import 'package:equatable/equatable.dart';
import 'package:places/core/error/failures.dart';
import 'package:places/core/usercases/usercase.dart';
import 'package:places/features/places/domain/repositories/google_place_repository.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:places/googleapi/models/response/google_json_response.dart';
import 'package:places/googleapi/models/models.dart';

class GetGooglePlace implements UserCase<GooglePlaceResponse, GooglePlaceParams> {
  final GooglePlaceRepository repository;

  GetGooglePlace(this.repository);

  @override
  Future<Result<Failure, GooglePlaceResponse>> call(GooglePlaceParams? params) async {
    return await repository.getGooglePlace(params!.type);
  }

}

class GooglePlaceParams extends Equatable {
  final PlaceType type;
  GooglePlaceParams({required this.type});
  @override
  List<Object?> get props => [type];
}