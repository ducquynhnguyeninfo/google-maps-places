// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_status.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BusinessStatusAdapter extends TypeAdapter<BusinessStatus> {
  @override
  final int typeId = 1;

  @override
  BusinessStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 1:
        return BusinessStatus.OPERATIONAL;
      case 2:
        return BusinessStatus.SUSPENDED;
      default:
        return BusinessStatus.OPERATIONAL;
    }
  }

  @override
  void write(BinaryWriter writer, BusinessStatus obj) {
    switch (obj) {
      case BusinessStatus.OPERATIONAL:
        writer.writeByte(1);
        break;
      case BusinessStatus.SUSPENDED:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BusinessStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
