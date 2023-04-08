import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import 'quran_data_model.dart';

part 'quran_model.g.dart';

@HiveType(typeId: 0)
class Quran extends HiveObject with EquatableMixin {
  @HiveField(0)
  final int statusCode;
  @HiveField(1)
  final String statusMessage;
  @HiveField(2)
  final QuranData quranDataModel;

  Quran({
    required this.quranDataModel,
    required this.statusMessage,
    required this.statusCode,
  });

  @override
  List<Object?> get props => [
        statusCode,
        statusMessage,
        quranDataModel,
      ];
}
