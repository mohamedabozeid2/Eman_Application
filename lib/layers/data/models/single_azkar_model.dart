import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'single_azkar_model.g.dart';
@HiveType(typeId: 6)
class SingleAzkar extends HiveObject with EquatableMixin {
  @HiveField(0)
  final String category;
  @HiveField(1)
  final String count;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String reference;
  @HiveField(4)
  final String content;

  SingleAzkar({
    required this.count,
    required this.category,
    required this.description,
    required this.content,
    required this.reference,
  });

  factory SingleAzkar.fromJson(Map<String, dynamic> json) {
    return SingleAzkar(
      count: json['count'],
      category: json['category'],
      description: json['description'],
      content: json['content'],
      reference: json['reference'],
    );
  }

  @override
  List<Object?> get props => [
        count,
        category,
        description,
        content,
        reference,
      ];
}
