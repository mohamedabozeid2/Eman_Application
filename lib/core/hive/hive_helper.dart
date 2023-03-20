import 'package:eman_application/features/domain/entities/surah_bookmark_model.dart';
import 'package:hive_flutter/adapters.dart';

import '../../features/domain/entities/ayah_model.dart';
import '../../features/domain/entities/quran_data_model.dart';
import '../../features/domain/entities/quran_model.dart';
import '../../features/domain/entities/surah_model.dart';
import 'hive_keys.dart';

class HiveHelper {
  static Box<QuranData>? surahs;
  static late Box<bool> isQuranDownloaded;
  static late Box<SurahBookmarkModel> surahLastRead;
  static late Box<List> bookmarksList;

  static Future<void> init({required String path}) async {
    await Hive.initFlutter(path);
    //// Register Adapter
    Hive.registerAdapter(QuranDataAdapter());
    Hive.registerAdapter(QuranAdapter());
    Hive.registerAdapter(SurahAdapter());
    Hive.registerAdapter(AyahAdapter());
    Hive.registerAdapter(SurahBookmarkModelAdapter());
    //// Open Boxes
    surahs = await Hive.openBox<QuranData>(HiveKeys.surahs);
    isQuranDownloaded = await Hive.openBox<bool>(HiveKeys.isQuranDownloaded);
    surahLastRead =
        await Hive.openBox<SurahBookmarkModel>(HiveKeys.surahSurahLastRead);
    bookmarksList =
        await Hive.openBox<List>(HiveKeys.bookmarksList);
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

  static Future<void> putSurahLastRead({
    required SurahBookmarkModel model,
  }) async {
    return await surahLastRead.put(HiveKeys.surahSurahLastRead, model);
  }

  static SurahBookmarkModel? getSurahLastRead() {
    return surahLastRead.get(HiveKeys.surahSurahLastRead);
  }

  static Future<void> putInBookmarksList({
    required List model,
  }) async {
    return await bookmarksList.put(HiveKeys.bookmarksList, model);
  }

  static List? getBookmarksList() {
    return bookmarksList.get(
      HiveKeys.bookmarksList,
      defaultValue: <SurahBookmarkModel>[],
    );
  }

}
