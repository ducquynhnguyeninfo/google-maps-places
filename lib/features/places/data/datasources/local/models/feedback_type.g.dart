// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FeedbackTypeAdapter extends TypeAdapter<FeedbackType> {
  @override
  final int typeId = 3;

  @override
  FeedbackType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 1:
        return FeedbackType.checkbox;
      case 2:
        return FeedbackType.rating;
      case 3:
        return FeedbackType.photo;
      default:
        return FeedbackType.checkbox;
    }
  }

  @override
  void write(BinaryWriter writer, FeedbackType obj) {
    switch (obj) {
      case FeedbackType.checkbox:
        writer.writeByte(1);
        break;
      case FeedbackType.rating:
        writer.writeByte(2);
        break;
      case FeedbackType.photo:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeedbackTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
