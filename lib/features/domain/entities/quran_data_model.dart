import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import 'surah_model.dart';

part 'quran_data_model.g.dart';

@HiveType(typeId: 1)
class QuranData extends HiveObject with EquatableMixin {
  @HiveField(0)
  List<Surah> surahs = [];

  QuranData({required this.surahs});

  @override
  // TODO: implement props
  List<Object?> get props => [
        surahs,
      ];
}
