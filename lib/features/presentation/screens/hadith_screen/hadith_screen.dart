import 'package:eman_application/core/utils/strings.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/helper.dart';

class HadithScreen extends StatelessWidget {
  const HadithScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Helper.maxHeight * 0.15,
        title: const Text(AppStrings.hadith),
      ),
    );
  }
}
