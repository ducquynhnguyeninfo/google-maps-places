import 'package:hive/hive.dart';
import 'feedback_item.dart';

part 'place_details_feedback.g.dart';

@HiveType(typeId: 1)
class PlaceDetailFeedback {
  static const String hiveName = 'place-feedback';

  @HiveField(1)
  final String placeId;

  @HiveField(2)
  List<FeedbackItem> feedbacks = [];

  PlaceDetailFeedback({required this.placeId});
}
