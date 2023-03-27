import 'package:eman_application/features/data/models/single_azkar_model.dart';
import 'package:eman_application/features/domain/entities/azkar.dart';
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
  static late Box<AzkarEntity> azkar;
  static late Box<bool> isAzkarDownloaded;

  static Future<void> init({required String path}) async {
    await Hive.initFlutter(path);
    //// Register Adapter
    Hive.registerAdapter(QuranDataAdapter());
    Hive.registerAdapter(QuranAdapter());
    Hive.registerAdapter(SurahAdapter());
    Hive.registerAdapter(AyahAdapter());
    Hive.registerAdapter(SurahBookmarkModelAdapter());
    Hive.registerAdapter(AzkarEntityAdapter());
    Hive.registerAdapter(SingleAzkarAdapter());
    //// Open Boxes
    surahs = await Hive.openBox<QuranData>(HiveKeys.surahs);
    isQuranDownloaded = await Hive.openBox<bool>(HiveKeys.isQuranDownloaded);
    surahLastRead =
        await Hive.openBox<SurahBookmarkModel>(HiveKeys.surahSurahLastRead);
    bookmarksList = await Hive.openBox<List>(HiveKeys.bookmarksList);
    azkar = await Hive.openBox<AzkarEntity>(HiveKeys.azkar);
    isAzkarDownloaded = await Hive.openBox<bool>(HiveKeys.isAzkarDownloaded);
  }

  static Future<void> putIsQuranDownloaded({
    required bool isQuranDownloadedValue,
  }) async {
    return await isQuranDownloaded.put(
        HiveKeys.isQuranDownloaded, isQuranDownloadedValue);
  }

  static bool getIsQuranDownloaded({
    required Box box,
    required String key,
  }) {
    return box.get(key, defaultValue: false);
  }

  static Future<void> putQuran({
    required QuranData quran,
  }) async {
    return await surahs!.put(HiveKeys.surahs, quran);
  }

  static QuranData getQuran() {
    return surahs!.get(HiveKeys.surahs)!;
  }

  static Future<void> putSurahLastRead({
    required SurahBookmarkModel model,
  }) async {
    return await surahLastRead.put(HiveKeys.surahSurahLastRead, model);
  }

  static SurahBookmarkModel? getSurahLastRead() {
    return surahLastRead.get(HiveKeys.surahSurahLastRead);
  }

  static Future<void> putInAzkar({
    required AzkarEntity model,
  }) async {
    return await azkar.put(HiveKeys.azkar, model);
  }

  static AzkarEntity? getAzkarData() {
    return azkar.get(HiveKeys.azkar);
  }

  static Future<void> putIsAzkarDownloaded({
    required bool isAzkarDownloadedValue,
  }) async {
    return await isAzkarDownloaded.put(
        HiveKeys.isAzkarDownloaded, isAzkarDownloadedValue);
  }

  static bool getIsAzkarDownloaded({
    required String key,
  }) {
    return isAzkarDownloaded.get(key, defaultValue: false)!;
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
