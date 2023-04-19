import 'package:eman_application/core/utils/helper.dart';
import 'package:flutter/material.dart';

import '../splash_screen/splash_screen.dart';

class Layout extends StatefulWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  void initState() {
    // MainCubit.get(context).getAllData(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      Helper.maxWidth = constraints.maxWidth;
      Helper.maxHeight = constraints.maxHeight;
      return const SplashScreen();
    });
  }
}
