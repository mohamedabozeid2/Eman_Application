import 'dart:io';

import '../../layers/domain/entities/azkar.dart';
import '../../layers/domain/entities/quran_data_model.dart';
import '../../layers/domain/entities/radio.dart';
import '../../layers/domain/entities/surah_bookmark_model.dart';

Directory? directory;
bool internetConnection = false;
bool isQuranDownloaded = false;
bool isAzkarDownloaded = false;
QuranData? quranData;
SurahBookmarkModel? lastRead;
List bookmarks = <SurahBookmarkModel>[];
RadioEntity? radioModel;
AzkarEntity? azkar;
