// import 'package:places/features/places/data/datasources/local/models/hive_models.dart' as m;
// import 'package:places/features/places/domain/entities/entities.dart';
//
// extension PlaceModelToEntityX on m.PlaceModel {
//   PlaceEntity toEntity() => PlaceEntity()
//     ..name = this.name
//     ..icon = this.icon
//     ..formattedAddress = this.formattedAddress
//     ..placeId = this.placeId
//     ..priceLevel = this.priceLevel
//     ..rating = this.rating
//     ..reference = this.reference
//     ..userRatingsTotal = this.userRatingsTotal
//     ..types = this.types!.map((e) => e.toEntity()).toList()
//     ..photo = this.photos![0].toEntity()
//     ..businessStatus = this.businessStatus?.toEntity()
//     ..geometry = this.geometry?.toEntity()
//     ..openingHours = this.openingHours?.toEntity()
//     ..plusCode = this.plusCode?.toEntity();
// }
//
// extension PlaceTypeToEntityX on m.PlaceType {
//   PlaceType toEntity() => PlaceType.values[this.index];
// }
//
// extension PhotoModelToEntityX on m.PhotoModel {
//   PhotoEntity toEntity() => PhotoEntity()
//     ..photoReference = this.photoReference
//     ..height = this.height
//     ..width = this.width
//     ..htmlAttributions = this.htmlAttributions;
// }
//
// extension BusinessStatusX on m.BusinessStatus {
//   BusinessStatus toEntity() => BusinessStatus.values[this.index];
// }
//
// extension LocationModelToEntityX on m.LocationModel {
//   LocationEntity toEntity() => LocationEntity()
//     ..lat = this.lat
//     ..lng = this.lng;
// }
//
// extension ViewportModelToEntityX on m.ViewportModel {
//   ViewportEntity toEntity() => ViewportEntity()
//     ..northeast = this.northeast?.toEntity()
//     ..southwest = this.southwest?.toEntity();
// }
//
// extension GeometryModelToEntityX on m.GeometryModel {
//   GeometryEntity toEntity() => GeometryEntity()
//     ..location = this.location?.toEntity()
//     ..viewport = this.viewport?.toEntity();
// }
//
// extension OpeningHoursModelToEntityX on m.OpeningHoursModel {
//   OpeningHoursEntity toEntity() => OpeningHoursEntity()..openNow = this.openNow;
// }
//
// extension PlusCodeModelToEntityX on m.PlusCodeModel {
//   PlusCodeEntity toEntity() => PlusCodeEntity()
//     ..compoundCode = this.compoundCode
//     ..globalCode = this.globalCode;
// }
