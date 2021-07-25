import 'package:hive/hive.dart';

part 'location.g.dart';

@HiveType(typeId: 3)
class LocationModel {
  @HiveField(1)
  double? lat;
  @HiveField(2)
  double? lng;

  LocationModel({this.lat, this.lng});
}
