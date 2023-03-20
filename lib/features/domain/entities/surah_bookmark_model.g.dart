// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surah_bookmark_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SurahBookmarkModelAdapter extends TypeAdapter<SurahBookmarkModel> {
  @override
  final int typeId = 4;

  @override
  SurahBookmarkModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SurahBookmarkModel(
      scrollPosition: fields[1] as double,
      surah: fields[0] as Surah,
      date: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SurahBookmarkModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.surah)
      ..writeByte(1)
      ..write(obj.scrollPosition)
      ..writeByte(2)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SurahBookmarkModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
