import 'package:hive/hive.dart';

import 'checklist_item_type.dart';

part 'checklist_item.g.dart';

@HiveType(typeId: 2)
class ChecklistItem extends HiveObject {
  static const String hiveName = 'checklist-item';

  @HiveField(1)
  String text;

  @HiveField(2)
  ChecklistItemType type;

  @HiveField(3)
  dynamic value;

  ChecklistItem({required this.text, required this.type, this.value});

}

