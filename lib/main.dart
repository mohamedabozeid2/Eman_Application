import 'package:bloc/bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:eman_application/core/api/eman_dio_helper.dart';
import 'package:eman_application/features/presentation/screens/no_internet_screen/no_internet_screen.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'app.dart';
import 'core/api/audio_dio_helper.dart';
import 'core/api/azkar_dio_helper.dart';
import 'core/api/radio_dio_helper.dart';
import 'core/hive/hive_helper.dart';
import 'core/hive/hive_keys.dart';
import 'core/network/check_connection.dart';
import 'core/services/service_locator.dart';
import 'core/utils/constants.dart';
import 'features/presentation/controller/BlocObserver/BlocObserver.dart';
import 'features/presentation/screens/layout/layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  directory = await getApplicationDocumentsDirectory();

  ServicesLocator().init();
  await HiveHelper.init(path: directory!.path);

  await CheckConnection.checkConnection().then((value) {
    internetConnection = value;
  });

  EmanDioHelper.init();
  RadioDioHelper.init();
  AudioDioHelper.init();
  AzkarDioHelper.init();
  isQuranDownloaded = HiveHelper.getIsQuranDownloaded(
    box: HiveHelper.isQuranDownloaded,
    key: HiveKeys.isQuranDownloaded,
  );

  if (isQuranDownloaded) {
    quranData = HiveHelper.getQuran();
  }

  isAzkarDownloaded =
      HiveHelper.getIsAzkarDownloaded(key: HiveKeys.isAzkarDownloaded);
  if (isAzkarDownloaded) {
    azkar = HiveHelper.getAzkarData();
  }

  // print(HiveHelper.getBookmarksList()!);
  lastRead = HiveHelper.getSurahLastRead();
  bookmarks = HiveHelper.getBookmarksList()!;
  late Widget startWidget;

  if (!isQuranDownloaded && !internetConnection) {
    startWidget = const NoInternetScreen();
  } else {
    startWidget = const Layout();
  }

  BlocOverrides.runZoned(
    () {
      runApp(
        DevicePreview(
          enabled: false,
          builder: (context) => EmanApplication(
            startWidget: startWidget,
          ),
        ),
      );
    },
    blocObserver: MyBlocObserver(),
  );
}
