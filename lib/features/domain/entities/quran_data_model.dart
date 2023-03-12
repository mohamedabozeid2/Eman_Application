import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import 'surah_model.dart';

part 'quran_data_model.g.dart';

@HiveType(typeId: 1)
class QuranDataModel extends HiveObject with EquatableMixin {
  @HiveField(0)
  List<SurahModel> surahs = [];

  QuranDataModel({required this.surahs});

  @override
  // TODO: implement props
  List<Object?> get props => [
        surahs,
      ];
}
