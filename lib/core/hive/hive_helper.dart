import 'package:hive_flutter/adapters.dart';

import '../../features/domain/entities/ayah_model.dart';
import '../../features/domain/entities/quran_data_model.dart';
import '../../features/domain/entities/quran_model.dart';
import '../../features/domain/entities/surah_model.dart';
import 'hive_keys.dart';

class HiveHelper {
  static Box<QuranData>? surahs;
  static late Box<bool> isQuranDownloaded;

  static Future<void> init({required String path}) async {
    await Hive.initFlutter(path);

    //// Register Adapter
    Hive.registerAdapter(QuranDataModelAdapter());
    Hive.registerAdapter(QuranModelAdapter());
    Hive.registerAdapter(SurahModelAdapter());
    Hive.registerAdapter(AyahModelAdapter());

    //// Open Boxes
    surahs = await Hive.openBox<QuranData>(HiveKeys.surahs);
    isQuranDownloaded = await Hive.openBox<bool>(HiveKeys.isQuranDownloaded);
  }

  static Future<void> putIsQuranDownloaded({
    required Box box,
    required String key,
    required bool isQuranDownloaded,
  }) async {
    return await box.put(key, isQuranDownloaded);
  }

  static bool getIsQuranDownloaded({
    required Box box,
    required String key,
  }) {
    return box.get(key, defaultValue: false);
  }

  static Future<void> putQuran({
    required Box box,
    required String key,
    required QuranData quran,
  }) async {
    return await box.put(key, quran);
  }

  static QuranData getQuran({
    required Box box,
    required String key,
  }) {
    return box.get(key);
  }
}
