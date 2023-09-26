import 'package:multiple_result/multiple_result.dart';
import 'package:places/core/error/failures.dart';
import 'package:places/features/places/data/datasources/local/local_datasource.dart';
import 'package:places/features/places/data/datasources/local/models/place_details_checklist.dart';
import 'package:places/features/places/domain/repositories/local_data_repository.dart';

class LocalDataRepositoryImpl implements LocalDataRepository {
  final LocalDataSource localCacheDataSource;

  LocalDataRepositoryImpl(this.localCacheDataSource);

  @override
  Future<Result<PlaceDetailChecklist, Failure>> loadCheckList(
      String placeId) async {
    var checklist = await localCacheDataSource.getPlaceChecklist(placeId);
    if (checklist == null) return const Result.error(CacheFailure());

    return Success(checklist);
  }

  @override
  Future<Result<PlaceDetailChecklist, Failure>> saveCheckList(
      PlaceDetailChecklist checklist) async {
    return Success(await localCacheDataSource.savePlaceChecklist(checklist));
  }
}
