import 'dart:io';

import '../../features/domain/entities/quran_data_model.dart';

Directory? directory;
bool internetConnection = false;
bool isQuranDownloaded = false;
QuranData? quranData;