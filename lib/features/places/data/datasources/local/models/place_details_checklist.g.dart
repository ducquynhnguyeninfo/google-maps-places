// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_details_checklist.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlaceDetailChecklistAdapter extends TypeAdapter<PlaceDetailChecklist> {
  @override
  final int typeId = 1;

  @override
  PlaceDetailChecklist read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlaceDetailChecklist(
      placeId: fields[1] as String,
    )..checklists = (fields[2] as List).cast<ChecklistItem>();
  }

  @override
  void write(BinaryWriter writer, PlaceDetailChecklist obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.placeId)
      ..writeByte(2)
      ..write(obj.checklists);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlaceDetailChecklistAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
