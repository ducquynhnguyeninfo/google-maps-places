import 'package:hive/hive.dart';

part 'opening_hour.g.dart';

@HiveType(typeId: 4)
class OpeningHoursModel {
  OpeningHoursModel({
    this.openNow,
  });

  @HiveField(1)
  bool? openNow;
}
