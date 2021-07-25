import 'package:hive/hive.dart';

import 'hive_models.dart';
import 'location.dart';

part 'geometry.g.dart';

@HiveType(typeId: 2)
class GeometryModel {
  GeometryModel({
    this.location,
    this.viewport,
  });

  @HiveField(1)
  LocationModel? location;

  @HiveField(2)
  ViewportModel? viewport;
}
