import 'package:bloc/bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:eman_application/features/presentation/screens/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'app.dart';
import 'core/hive/hive_helper.dart';
import 'core/network/check_connection.dart';
import 'core/services/service_locator.dart';
import 'core/utils/constants.dart';
import 'features/presentation/controller/BlocObserver/BlocObserver.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  directory = await getApplicationDocumentsDirectory();

  Widget? startWidget = const MainScreen();
  ServicesLocator().init();
  await HiveHelper.init(path: directory!.path);

  await CheckConnection.checkConnection().then((value) {
    internetConnection = value;
  });

  BlocOverrides.runZoned(
    () {
      runApp(DevicePreview(
          builder: (context) => EmanApplication(
                startWidget: startWidget,
              )));
    },
    blocObserver: MyBlocObserver(),
  );
}
