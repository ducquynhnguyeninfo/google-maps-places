// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlaceModelAdapter extends TypeAdapter<PlaceModel> {
  @override
  final int typeId = 6;

  @override
  PlaceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlaceModel(
      businessStatus: fields[1] as BusinessStatus?,
      formattedAddress: fields[5] as String?,
      geometry: fields[2] as GeometryModel?,
      icon: fields[6] as String?,
      name: fields[7] as String?,
      openingHours: fields[3] as OpeningHoursModel?,
      photos: (fields[13] as List?)?.cast<PhotoModel>(),
      placeId: fields[8] as String?,
      plusCode: fields[4] as PlusCodeModel?,
      priceLevel: fields[9] as int?,
      rating: fields[10] as double?,
      reference: fields[11] as String?,
      types: (fields[14] as List?)?.cast<PlaceType>(),
      userRatingsTotal: fields[12] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, PlaceModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(1)
      ..write(obj.businessStatus)
      ..writeByte(2)
      ..write(obj.geometry)
      ..writeByte(3)
      ..write(obj.openingHours)
      ..writeByte(4)
      ..write(obj.plusCode)
      ..writeByte(5)
      ..write(obj.formattedAddress)
      ..writeByte(6)
      ..write(obj.icon)
      ..writeByte(7)
      ..write(obj.name)
      ..writeByte(8)
      ..write(obj.placeId)
      ..writeByte(9)
      ..write(obj.priceLevel)
      ..writeByte(10)
      ..write(obj.rating)
      ..writeByte(11)
      ..write(obj.reference)
      ..writeByte(12)
      ..write(obj.userRatingsTotal)
      ..writeByte(13)
      ..write(obj.photos)
      ..writeByte(14)
      ..write(obj.types);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlaceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
