
import '../../domain/entities/ayah_model.dart';

class AyahModel extends Ayah {
  AyahModel({
    required super.number,
    required super.page,
    required super.text,
    required super.numberInSurah,
  });

  factory AyahModel.fromJson(Map<String, dynamic> json) {
    return AyahModel(
      number: json['number'],
      page: json['page'],
      text: json['text'],
      numberInSurah: json['numberInSurah'],
    );
  }
}
