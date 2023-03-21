import 'package:eman_application/features/domain/entities/radio.dart';

class RadioModel extends RadioEntity {
  const RadioModel({
    required super.url,
    required super.id,
    required super.name,
  });

  factory RadioModel.fromJson(Map<String, dynamic> json) {
    return RadioModel(
      url: json['url'],
      id: json['id'],
      name: json['name'],
    );
  }
}
