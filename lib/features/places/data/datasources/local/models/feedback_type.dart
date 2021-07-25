import 'package:hive/hive.dart';

part 'feedback_type.g.dart';

const String feedbackTypeHiveBoxName = 'FeedbackType';
@HiveType(typeId: 3)
enum FeedbackType {

@HiveField(1)
  checkbox,
  @HiveField(2)
  rating,
  @HiveField(3)
  photo
}
