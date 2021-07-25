// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_details_feedback.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlaceDetailFeedbackAdapter extends TypeAdapter<PlaceDetailFeedback> {
  @override
  final int typeId = 1;

  @override
  PlaceDetailFeedback read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlaceDetailFeedback(
      placeId: fields[1] as String,
    )..feedbacks = (fields[2] as List).cast<FeedbackItem>();
  }

  @override
  void write(BinaryWriter writer, PlaceDetailFeedback obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.placeId)
      ..writeByte(2)
      ..write(obj.feedbacks);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlaceDetailFeedbackAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
