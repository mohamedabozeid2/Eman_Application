import 'package:eman_application/core/utils/components.dart';
import 'package:eman_application/core/utils/strings.dart';
import 'package:eman_application/core/widgets/adaptive_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';

import '../../../../core/utils/helper.dart';
import 'widgets/qibla_compass.dart';

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
      // backgroundColor: AppColors.navy.withOpacity(0.9),
      appBar: AppBar(
        toolbarHeight: Helper.maxHeight * 0.1,
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
              child: Text(
                "Error: ${snapshot.error.toString()}",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                    ),
                textAlign: TextAlign.center,
              ),
            );
          } else if (snapshot.data!) {
            return const QiblahCompass();
          } else {
            return Center(
              child: Text(
                AppStrings.yourDeviceIsNotSupported,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.white),
              ),
            );
          }
        },
      ),
    );
  }
}
