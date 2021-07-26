// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checklist_item_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChecklistItemTypeAdapter extends TypeAdapter<ChecklistItemType> {
  @override
  final int typeId = 3;

  @override
  ChecklistItemType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 1:
        return ChecklistItemType.checkbox;
      case 2:
        return ChecklistItemType.rating;
      case 3:
        return ChecklistItemType.photo;
      default:
        return ChecklistItemType.checkbox;
    }
  }

  @override
  void write(BinaryWriter writer, ChecklistItemType obj) {
    switch (obj) {
      case ChecklistItemType.checkbox:
        writer.writeByte(1);
        break;
      case ChecklistItemType.rating:
        writer.writeByte(2);
        break;
      case ChecklistItemType.photo:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChecklistItemTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
