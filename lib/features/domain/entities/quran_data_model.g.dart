// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuranDataModelAdapter extends TypeAdapter<QuranData> {
  @override
  final int typeId = 1;

  @override
  QuranData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuranData(
      surahs: (fields[0] as List).cast<Surah>(),
    );
  }

  @override
  void write(BinaryWriter writer, QuranData obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.surahs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuranDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
