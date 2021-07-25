// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewport.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ViewportModelAdapter extends TypeAdapter<ViewportModel> {
  @override
  final int typeId = 9;

  @override
  ViewportModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ViewportModel(
      northeast: fields[1] as LocationModel?,
      southwest: fields[2] as LocationModel?,
    );
  }

  @override
  void write(BinaryWriter writer, ViewportModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.northeast)
      ..writeByte(2)
      ..write(obj.southwest);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ViewportModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
