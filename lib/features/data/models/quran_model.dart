import '../../domain/entities/quran_model.dart';
import 'quran_data_model.dart';

class QuranModel extends Quran {
  QuranModel(
      {required super.quranDataModel,
      required super.statusMessage,
      required super.statusCode});

  factory QuranModel.fromJson(Map<String, dynamic> json) {
    return QuranModel(
      quranDataModel: QuranDataModel.fromJson(
        json['data'],
      ),
      statusMessage: json['status'],
      statusCode: json['code'],
    );
  }
}
