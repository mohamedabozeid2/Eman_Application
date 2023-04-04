import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:eman_application/core/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_values.dart';
import '../../../../core/utils/helper.dart';
import '../../../../core/utils/strings.dart';
import 'widgets/surah_item_builder.dart';

class QuranScreen extends StatelessWidget {
  final ArabicNumbers arabicNumber = ArabicNumbers();

  QuranScreen({Key? key}) : super(key: key);
  final int i = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Helper.maxHeight * 0.15,
        title: const Text(
          'My ${AppStrings.appName}',
        ),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return SurahItemBuilder(surah: quranData!.surahs[index]);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: AppSize.s5,
                    );
                  },
                  itemCount: quranData!.surahs.length,
                ),
                SizedBox(
                  height: AppSize.s50,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
