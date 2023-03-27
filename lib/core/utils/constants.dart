import 'dart:io';

import 'package:eman_application/features/domain/entities/azkar.dart';
import 'package:eman_application/features/domain/entities/radio.dart';
import 'package:eman_application/features/domain/entities/surah_bookmark_model.dart';

import '../../features/domain/entities/quran_data_model.dart';

Directory? directory;
bool internetConnection = false;
bool isQuranDownloaded = false;
bool isAzkarDownloaded = false;
QuranData? quranData;
SurahBookmarkModel? lastRead;
List bookmarks = <SurahBookmarkModel>[];
RadioEntity? radioModel;
AzkarEntity? azkar;