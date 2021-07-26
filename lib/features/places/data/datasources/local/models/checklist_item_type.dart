import 'package:hive/hive.dart';

part 'checklist_item_type.g.dart';

const String checklistItemTypeHiveBoxName = 'checklist_item_type';

@HiveType(typeId: 3)
enum ChecklistItemType {

@HiveField(1)
  checkbox,
  @HiveField(2)
  rating,
  @HiveField(3)
  photo
}
