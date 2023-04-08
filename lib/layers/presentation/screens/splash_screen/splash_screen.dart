import 'dart:async';

import 'package:eman_application/core/utils/app_values.dart';
import 'package:eman_application/core/utils/assets_manager.dart';
import 'package:eman_application/core/utils/components.dart';
import 'package:flutter/material.dart';

import '../../controller/main_cubit/main_cubit.dart';
import '../main_screen/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    MainCubit.get(context).getQuran(context: context);
    MainCubit.get(context).getRadio();
    Timer(
        const Duration(seconds: 2),
        () => Components.navigateAndFinish(
            context: context, widget: const MainScreen()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(AppSize.s40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(
                image: AssetImage(
                  AssetsManager.appLogo,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
