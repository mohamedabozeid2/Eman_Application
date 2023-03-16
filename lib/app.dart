import 'package:device_preview/device_preview.dart';
import 'package:eman_application/features/presentation/controller/main_cubit/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'config/themes/light_theme.dart';
import 'core/services/service_locator.dart';
import 'core/utils/strings.dart';

class EmanApplication extends StatelessWidget {
  final Widget startWidget;

  const EmanApplication({
    Key? key,
    required this.startWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392.72727272727275, 788.7272727272727),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (BuildContext context) => MainCubit(
                        sl(),
                      )),
            ],
            child: GetMaterialApp(
              useInheritedMediaQuery: true,
              locale: DevicePreview.locale(context),
              builder: DevicePreview.appBuilder,
              debugShowCheckedModeBanner: false,
              title: AppStrings.appName,
              theme: ThemeData.light(),
              darkTheme: lightTheme,
              themeMode: ThemeMode.dark,
              home: child,
            ));
      },
      child: startWidget,
    );
  }
}
