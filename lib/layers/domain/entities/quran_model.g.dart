// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuranAdapter extends TypeAdapter<Quran> {
  @override
  final int typeId = 0;

  @override
  Quran read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Quran(
      quranDataModel: fields[2] as QuranData,
      statusMessage: fields[1] as String,
      statusCode: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Quran obj) {
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
      other is QuranAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
