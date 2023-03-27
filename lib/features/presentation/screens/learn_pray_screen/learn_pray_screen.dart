import 'package:eman_application/core/utils/strings.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/helper.dart';

class LearnPrayScreen extends StatelessWidget {
  const LearnPrayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Helper.maxHeight * 0.15,
        title: const Text(AppStrings.learnHowToPray),
      ),
      body: Column(
        children: [
          Container(
            height: Helper.maxHeight*0.8,
            width: Helper.maxWidth,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
