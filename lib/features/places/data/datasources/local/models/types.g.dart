// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'types.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlaceTypeAdapter extends TypeAdapter<PlaceType> {
  @override
  final int typeId = 8;

  @override
  PlaceType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 1:
        return PlaceType.cafe;
      default:
        return PlaceType.cafe;
    }
  }

  @override
  void write(BinaryWriter writer, PlaceType obj) {
    switch (obj) {
      case PlaceType.cafe:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlaceTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
