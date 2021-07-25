import 'package:hive/hive.dart';

import 'feedback_type.dart';

part 'feedback_item.g.dart';

@HiveType(typeId: 2)
class FeedbackItem {
  static const String hiveName = 'feedback-item';

  @HiveField(1)
  String text;

  @HiveField(2)
  FeedbackType type;

  @HiveField(3)
  dynamic value;

  FeedbackItem({required this.text, required this.type, this.value});
}

