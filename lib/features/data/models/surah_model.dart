import '../../domain/entities/surah_model.dart';
import 'ayah_model.dart';

class SurahModel extends Surah {
  SurahModel({
    required super.name,
    required super.ayahs,
    required super.number,
    required super.englishName,
    required super.englishNameTranslation,
  });

  factory SurahModel.fromJson(Map<String, dynamic> json) {
    return SurahModel(
      name: json['name'],
      ayahs:
          List<AyahModel>.from(json['ayahs'].map((e) => AyahModel.fromJson(e))),
      number: json['number'],
      englishName: json['englishName'],
      englishNameTranslation: json['englishNameTranslation'],
    );
  }
}
