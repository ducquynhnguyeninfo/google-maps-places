import 'package:multiple_result/multiple_result.dart';
import 'package:places/core/error/failures.dart';
import 'package:places/googleapi/models/response/google_json_response.dart';
import 'package:places/googleapi/models/types.dart';

abstract class GooglePlaceRepository {

  Future<Result<Failure, GooglePlaceResponse>> getGooglePlace(PlaceType type);

}