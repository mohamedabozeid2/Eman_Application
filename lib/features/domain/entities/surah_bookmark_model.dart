import 'package:eman_application/features/domain/entities/surah_model.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'surah_bookmark_model.g.dart';

@HiveType(typeId: 4)
class SurahBookmarkModel extends HiveObject with EquatableMixin {
  @HiveField(0)
  final Surah surah;
  @HiveField(1)
  final double scrollPosition;
  @HiveField(2)
  final String date;

  SurahBookmarkModel({
    required this.scrollPosition,
    required this.surah,
    required this.date,
  });

  @override
  List<Object?> get props => [
        scrollPosition,
        surah,
        date,
      ];
}
