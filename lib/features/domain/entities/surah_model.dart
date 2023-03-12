import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import 'ayah_model.dart';

part 'surah_model.g.dart';

@HiveType(typeId: 2)
class SurahModel extends HiveObject with EquatableMixin {
  @HiveField(0)
  final int number;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String englishName;
  @HiveField(3)
  List<AyahModel> ayahs = [];

  SurahModel({
    required this.name,
    required this.ayahs,
    required this.number,
    required this.englishName,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        name,
        ayahs,
        number,
        englishName,
      ];
}
