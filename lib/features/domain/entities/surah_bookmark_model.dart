import 'package:eman_application/features/domain/entities/surah_model.dart';
import 'package:hive/hive.dart';


part 'surah_bookmark_model.g.dart';

@HiveType(typeId: 4)
class SurahBookmarkModel extends HiveObject {
  @HiveField(0)
  final Surah surah;
  @HiveField(1)
  final double scrollPosition;

  SurahBookmarkModel({
    required this.scrollPosition,
    required this.surah,
  });
}
