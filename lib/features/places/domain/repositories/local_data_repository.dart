import 'package:multiple_result/multiple_result.dart';
import 'package:places/core/error/failures.dart';
import 'package:places/features/places/data/datasources/local/models/place_details_checklist.dart';

abstract class LocalDataRepository {

  Future<Result<Failure, PlaceDetailChecklist>>  loadCheckList(String placeId);

  Future<Result<Failure, PlaceDetailChecklist>>  saveCheckList(PlaceDetailChecklist checklist);

}