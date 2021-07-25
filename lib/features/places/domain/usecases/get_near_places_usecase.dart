import 'package:equatable/equatable.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:multiple_result/multiple_result.dart';

import 'package:places/core/error/failures.dart';
import 'package:places/core/usercases/usercase.dart';
import 'package:places/features/places/domain/repositories/google_place_repository.dart';

class GetNearPlacesUsecase
    implements UserCase<List<PlacesSearchResult>, GetNearPlacesParams> {
  final GooglePlaceRepository repository;

  GetNearPlacesUsecase(this.repository);

  @override
  Future<Result<Failure, List<PlacesSearchResult>>> call(
      GetNearPlacesParams params) async {

     var result = await repository.getGooglePlace(params.query);
     var success = result.getSuccess();

     return result;
  }
}

class GetNearPlacesParams extends Equatable {
  final String query;

  GetNearPlacesParams({required this.query});

  @override
  List<Object?> get props => [query];
}
