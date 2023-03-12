// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuranModelAdapter extends TypeAdapter<QuranModel> {
  @override
  final int typeId = 0;

  @override
  QuranModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuranModel(
      quranDataModel: fields[2] as QuranDataModel,
      statusMessage: fields[1] as String,
      statusCode: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, QuranModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.statusCode)
      ..writeByte(1)
      ..write(obj.statusMessage)
      ..writeByte(2)
      ..write(obj.quranDataModel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuranModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
