import 'package:hive/hive.dart';
import 'package:places/features/places/data/datasources/local/models/place_details_checklist.dart';

import 'models/checklist_item.dart';
import 'models/checklist_item_type.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

abstract class LocalDataSource {
  Future<PlaceDetailChecklist?> getPlaceChecklist(String placeId);

  Future<PlaceDetailChecklist> savePlaceChecklist(
      PlaceDetailChecklist placeDetailFeedback);

  void close();
}

class LocalHiveDataSourceImpl extends LocalDataSource {
  Future<LocalHiveDataSourceImpl> initialize() async {
    final appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);

    Hive.registerAdapter(PlaceDetailChecklistAdapter());
    Hive.registerAdapter(ChecklistItemTypeAdapter());
    Hive.registerAdapter(ChecklistItemAdapter());

    await Hive.openBox<PlaceDetailChecklist>(PlaceDetailChecklist.hiveName).then((value) => value.clear());
    await Hive.openBox<ChecklistItemType>(checklistItemTypeHiveBoxName).then((value) => value.clear());
    await Hive.openBox<ChecklistItem>(ChecklistItem.hiveName).then((value) => value.clear());


    return this;
  }

  @override
  void close() async {
    await Hive.close();
  }

  @override
  Future<PlaceDetailChecklist?> getPlaceChecklist(String placeId) async {
    Box box = Hive.box<PlaceDetailChecklist>(PlaceDetailChecklist.hiveName);
    PlaceDetailChecklist? checklist = box.get(placeId);
    if (checklist == null) {
      var defaults = [
        ChecklistItem(
            type: ChecklistItemType.checkbox,
            text: 'Is floor clean?',
            value: false),
        ChecklistItem(
            type: ChecklistItemType.checkbox,
            text: 'Is Table clothes clean?',
            value: false),
        ChecklistItem(
            type: ChecklistItemType.checkbox,
            text: 'Is staff helpful?',
            value: false),
        ChecklistItem(
            type: ChecklistItemType.rating,
            text: 'Is food/drink healthy?',
            value: 0.0)
      ].map((e) {
        if(e.isInBox == false) {
          Hive.box<ChecklistItem>(ChecklistItem.hiveName).add(e);
        }
        return e;
      }).toList();

      checklist = PlaceDetailChecklist.withChecklist(
          placeId: placeId, checklists: defaults);
      var detailChecklist = await savePlaceChecklist(checklist);
      return Future.value(detailChecklist);
    }
    return Future.value(checklist);
  }

  @override
  Future<PlaceDetailChecklist> savePlaceChecklist(
      PlaceDetailChecklist placeDetailFeedback) {
    var reversed = placeDetailFeedback.checklists.reversed.map((e) {
      if(e.isInBox == false) {
        Hive.box<ChecklistItem>(ChecklistItem.hiveName).add(e);
      }
      return e;
    }).toList();

    placeDetailFeedback.checklists = reversed.reversed.toList();
    Box box = Hive.box<PlaceDetailChecklist>(PlaceDetailChecklist.hiveName);
    box.put(placeDetailFeedback.placeId, placeDetailFeedback);
    return Future.value(placeDetailFeedback);
  }
}
