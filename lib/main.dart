import 'package:bloc/bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:eman_application/core/api/eman_dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'app.dart';
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

  Widget? startWidget = const Layout();
  ServicesLocator().init();
  await HiveHelper.init(path: directory!.path);

  await CheckConnection.checkConnection().then((value) {
    internetConnection = value;
  });

  EmanDioHelper.init();
  RadioDioHelper.init();

  isQuranDownloaded = HiveHelper.getIsQuranDownloaded(
    box: HiveHelper.isQuranDownloaded,
    key: HiveKeys.isQuranDownloaded,
  );

  if (isQuranDownloaded) {
    quranData = HiveHelper.getQuran(
      box: HiveHelper.surahs!,
      key: HiveKeys.surahs,
    );
  }

  lastRead = HiveHelper.getSurahLastRead();

  BlocOverrides.runZoned(
    () {
      runApp(
        DevicePreview(
          builder: (context) => EmanApplication(
            startWidget: startWidget,
          ),
        ),
      );
    },
    blocObserver: MyBlocObserver(),
  );
}
