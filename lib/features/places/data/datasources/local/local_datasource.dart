import 'package:hive/hive.dart';

import 'models/place_details_feedback.dart';
import 'models/feedback_item.dart';
import 'models/feedback_type.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

abstract class LocalCacheDataSource {

  Future initialize();

  Future<PlaceDetailFeedback> getPlaceFeedbacks(String placeId);

  Future<PlaceDetailFeedback> savePlaceFeedback(
      {required PlaceDetailFeedback placeDetailFeedback});
}

class LocalCacheDataSourceImpl extends LocalCacheDataSource{

  Future initialize() async {
    final appDocumentDirectory =
    await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);

    Hive.registerAdapter(PlaceDetailFeedbackAdapter());
    Hive.registerAdapter(FeedbackItemAdapter());

    await Hive.openBox<PlaceDetailFeedback>(PlaceDetailFeedback.hiveName);
    await Hive.openBox<FeedbackType>(feedbackTypeHiveBoxName);
    await Hive.openBox<FeedbackItem>(FeedbackItem.hiveName);
  }

  @override
  Future<PlaceDetailFeedback> getPlaceFeedbacks(String placeId) {
    // TODO: implement getPlaceFeebacks
    throw UnimplementedError();
  }

  @override
  Future<PlaceDetailFeedback> savePlaceFeedback({required PlaceDetailFeedback placeDetailFeedback}) {
    // TODO: implement savePlaceFeedback
    throw UnimplementedError();
  }

}