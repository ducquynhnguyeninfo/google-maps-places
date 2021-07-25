
import 'entities.dart';
import 'location_entity.dart';

class GeometryEntity {
  GeometryEntity({
    this.location,
    this.viewport,
  });

  LocationEntity? location;

  ViewportEntity? viewport;
}
