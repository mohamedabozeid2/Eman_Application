
import '../../domain/entities/azkar.dart';
import 'single_azkar_model.dart';

class AzkarModel extends AzkarEntity {
  AzkarModel({
    required super.azkarAfterSalah,
    required super.azkarAfterSleep,
    required super.azkarBeforSleep,
    required super.azkarMsaa,
    required super.azkarQuran,
    required super.azkarSbah,
    required super.prophetsWords,
    required super.tsapeh,
  });

  factory AzkarModel.fromJson(Map<String, dynamic> json) {
    return AzkarModel(
      azkarSbah: List<SingleAzkar>.from(json['أذكار الصباح'].map(
        (e) => SingleAzkar.fromJson(e),
      )),
      azkarMsaa: List<SingleAzkar>.from(json['أذكار المساء'].map(
        (e) => SingleAzkar.fromJson(e),
      )),
      azkarAfterSalah: List<SingleAzkar>.from(
          json['أذكار بعد السلام من الصلاة المفروضة'].map(
        (e) => SingleAzkar.fromJson(e),
      )),
      tsapeh: List<SingleAzkar>.from(json['تسابيح'].map(
        (e) => SingleAzkar.fromJson(e),
      )),
      azkarBeforSleep: List<SingleAzkar>.from(json['أذكار النوم'].map(
        (e) => SingleAzkar.fromJson(e),
      )),
      azkarAfterSleep: List<SingleAzkar>.from(json['أذكار الاستيقاظ'].map(
        (e) => SingleAzkar.fromJson(e),
      )),
      azkarQuran: List<SingleAzkar>.from(json['أدعية قرآنية'].map(
        (e) => SingleAzkar.fromJson(e),
      )),
      prophetsWords: List<SingleAzkar>.from(json['أدعية الأنبياء'].map(
        (e) => SingleAzkar.fromJson(e),
      )),
    );
  }
}
