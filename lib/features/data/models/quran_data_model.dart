import 'package:eman_application/features/data/models/surah_model.dart';
import 'package:eman_application/features/domain/entities/quran_data_model.dart';

class QuranDataModel extends QuranData {
  QuranDataModel({required super.surahs});

  factory QuranDataModel.fromJson(Map<String, dynamic> json) {
    return QuranDataModel(
      surahs: List<SurahModel>.from(
        json['surahs'].map(
          (e) => SurahModel.fromJson(e),
        ),
      ),
    );
  }
}
