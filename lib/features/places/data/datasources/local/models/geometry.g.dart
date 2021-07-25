// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geometry.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GeometryModelAdapter extends TypeAdapter<GeometryModel> {
  @override
  final int typeId = 2;

  @override
  GeometryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GeometryModel(
      location: fields[1] as LocationModel?,
      viewport: fields[2] as ViewportModel?,
    );
  }

  @override
  void write(BinaryWriter writer, GeometryModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.location)
      ..writeByte(2)
      ..write(obj.viewport);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeometryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
