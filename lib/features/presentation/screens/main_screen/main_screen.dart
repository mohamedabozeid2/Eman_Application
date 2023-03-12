import 'package:eman_application/core/utils/helper.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      Helper.maxWidth = constraints.maxWidth;
      Helper.maxHeight = constraints.maxHeight;
      return Scaffold(
        appBar: AppBar(
          title: Text("TEST"),
        ),
      );
    });
  }
}
