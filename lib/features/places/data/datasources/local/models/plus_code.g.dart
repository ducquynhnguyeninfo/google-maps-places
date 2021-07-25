// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plus_code.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlusCodeModelAdapter extends TypeAdapter<PlusCodeModel> {
  @override
  final int typeId = 7;

  @override
  PlusCodeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlusCodeModel(
      compoundCode: fields[1] as String?,
      globalCode: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PlusCodeModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.compoundCode)
      ..writeByte(2)
      ..write(obj.globalCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlusCodeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
