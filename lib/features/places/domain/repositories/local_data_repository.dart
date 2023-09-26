import 'package:multiple_result/multiple_result.dart';
import 'package:places/core/error/failures.dart';
import 'package:places/features/places/data/datasources/local/models/place_details_checklist.dart';

abstract class LocalDataRepository {
  Future<Result<PlaceDetailChecklist, Failure>> loadCheckList(String placeId);

  Future<Result<PlaceDetailChecklist, Failure>> saveCheckList(
      PlaceDetailChecklist checklist);
}
