import 'package:multiple_result/multiple_result.dart';
import 'package:places/core/error/exceptions.dart';
import 'package:places/core/error/failures.dart';
import 'package:places/core/usercases/usercase.dart';
import 'package:places/features/places/data/datasources/local/models/place_details_checklist.dart';
import 'package:places/features/places/domain/repositories/local_data_repository.dart';

class GetChecklistUsecase implements UserCase<PlaceDetailChecklist, String> {
  final LocalDataRepository _localDataRepository;

  GetChecklistUsecase(this._localDataRepository);

  @override
  Future<Result<Failure, PlaceDetailChecklist>> call(String params) async {

    try {
      var checkList = await _localDataRepository.loadCheckList(params);
      return checkList;

    } on CacheException catch (e) {

      return Error(CacheFailure(properties: [e]));
    }

  }
}
