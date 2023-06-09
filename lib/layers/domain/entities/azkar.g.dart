// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'azkar.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AzkarEntityAdapter extends TypeAdapter<AzkarEntity> {
  @override
  final int typeId = 5;

  @override
  AzkarEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AzkarEntity(
      azkarAfterSalah: (fields[2] as List).cast<SingleAzkar>(),
      azkarAfterSleep: (fields[5] as List).cast<SingleAzkar>(),
      azkarBeforSleep: (fields[4] as List).cast<SingleAzkar>(),
      azkarMsaa: (fields[1] as List).cast<SingleAzkar>(),
      azkarQuran: (fields[6] as List).cast<SingleAzkar>(),
      azkarSbah: (fields[0] as List).cast<SingleAzkar>(),
      prophetsWords: (fields[7] as List).cast<SingleAzkar>(),
      tsapeh: (fields[3] as List).cast<SingleAzkar>(),
    );
  }

  @override
  void write(BinaryWriter writer, AzkarEntity obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.azkarSbah)
      ..writeByte(1)
      ..write(obj.azkarMsaa)
      ..writeByte(2)
      ..write(obj.azkarAfterSalah)
      ..writeByte(3)
      ..write(obj.tsapeh)
      ..writeByte(4)
      ..write(obj.azkarBeforSleep)
      ..writeByte(5)
      ..write(obj.azkarAfterSleep)
      ..writeByte(6)
      ..write(obj.azkarQuran)
      ..writeByte(7)
      ..write(obj.prophetsWords);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AzkarEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
