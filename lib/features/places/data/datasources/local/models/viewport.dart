import 'package:hive/hive.dart';

import 'hive_models.dart';
part 'viewport.g.dart';

@HiveType(typeId: 9)
class ViewportModel {
  @HiveField(1)
  LocationModel? northeast;
  @HiveField(2)
  LocationModel? southwest;

  ViewportModel({this.northeast, this.southwest});
}
