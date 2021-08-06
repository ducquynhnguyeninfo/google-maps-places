import 'package:hive/hive.dart';
import 'checklist_item.dart';

part 'place_details_checklist.g.dart';

@HiveType(typeId: 1)
class PlaceDetailChecklist extends HiveObject {
  static const String hiveName = 'place-checklist';

  @HiveField(1)
  final String placeId;

  @HiveField(2)
  List<ChecklistItem> checklists = List.empty(growable: true);

  PlaceDetailChecklist({required this.placeId});

  PlaceDetailChecklist.withChecklist({required this.placeId, required  this.checklists});
}
