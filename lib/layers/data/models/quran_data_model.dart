
import '../../domain/entities/quran_data_model.dart';
import 'surah_model.dart';

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
