// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checklist_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChecklistItemAdapter extends TypeAdapter<ChecklistItem> {
  @override
  final int typeId = 2;

  @override
  ChecklistItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChecklistItem(
      text: fields[1] as String,
      type: fields[2] as ChecklistItemType,
      value: fields[3] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, ChecklistItem obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChecklistItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
