import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'ayah_model.g.dart';

@HiveType(typeId: 3)
class Ayah extends HiveObject with EquatableMixin {
  @HiveField(0)
  final int number;
  @HiveField(1)
  final String text;
  @HiveField(2)
  final int numberInSurah;
  @HiveField(3)
  final int page;

  Ayah({
    required this.number,
    required this.page,
    required this.text,
    required this.numberInSurah,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        number,
        page,
        text,
        numberInSurah,
      ];
}
