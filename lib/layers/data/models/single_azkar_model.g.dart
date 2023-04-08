// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_azkar_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SingleAzkarAdapter extends TypeAdapter<SingleAzkar> {
  @override
  final int typeId = 6;

  @override
  SingleAzkar read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SingleAzkar(
      count: fields[1] as String,
      category: fields[0] as String,
      description: fields[2] as String,
      content: fields[4] as String,
      reference: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SingleAzkar obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.category)
      ..writeByte(1)
      ..write(obj.count)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.reference)
      ..writeByte(4)
      ..write(obj.content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SingleAzkarAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
