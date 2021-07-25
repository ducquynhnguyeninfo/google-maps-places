// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FeedbackItemAdapter extends TypeAdapter<FeedbackItem> {
  @override
  final int typeId = 2;

  @override
  FeedbackItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FeedbackItem(
      text: fields[1] as String,
      type: fields[2] as FeedbackType,
      value: fields[3] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, FeedbackItem obj) {
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
      other is FeedbackItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
