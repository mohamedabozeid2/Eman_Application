import 'package:eman_application/core/utils/components.dart';
import 'package:eman_application/core/utils/strings.dart';
import 'package:eman_application/core/widgets/adaptive_indicator.dart';
import 'package:eman_application/features/presentation/screens/qibla_screen/widgets/qibla_compass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';

import '../../../../core/utils/helper.dart';

class Qibla extends StatefulWidget {
  const Qibla({Key? key}) : super(key: key);

  @override
  State<Qibla> createState() => _QiblaState();
}

class _QiblaState extends State<Qibla> {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Helper.maxHeight * 0.15,
        title: const Text(AppStrings.qibla),
      ),
      body: FutureBuilder(
        future: _deviceSupport,
        builder: (BuildContext context, AsyncSnapshot<bool?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: AdaptiveIndicator(
                os: Components.getOS(),
                color: Colors.white,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.data!) {
            return const QiblahCompass();
          } else {
            return const Center(
              child: Text(
                AppStrings.yourDeviceIsNotSupported,
              ),
            );
          }
        },
      ),
    );
  }
}
