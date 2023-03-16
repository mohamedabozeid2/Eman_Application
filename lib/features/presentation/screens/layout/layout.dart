import 'package:eman_application/core/utils/helper.dart';
import 'package:eman_application/core/utils/strings.dart';
import 'package:eman_application/features/presentation/controller/main_cubit/main_cubit.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/constants.dart';
import '../main_screen/main_screen.dart';

class Layout extends StatefulWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  void initState() {
    if(!isQuranDownloaded){
      MainCubit.get(context).getQuran();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      Helper.maxWidth = constraints.maxWidth;
      Helper.maxHeight = constraints.maxHeight;
      return Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.appName),
          toolbarHeight: Helper.maxHeight * 0.12,
        ),
        body: const MainScreen(),
      );
    });
  }
}
