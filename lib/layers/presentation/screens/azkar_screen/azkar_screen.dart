import 'package:eman_application/core/utils/app_values.dart';
import 'package:eman_application/core/utils/strings.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/helper.dart';
import '../../../data/models/single_azkar_model.dart';
import '../../controller/main_cubit/main_cubit.dart';
import 'widgets/azkar_category_item_builder.dart';

class AzkarScreen extends StatefulWidget {
  const AzkarScreen({Key? key}) : super(key: key);

  @override
  State<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  List<List<SingleAzkar>> azkarCateogries = [
    azkar!.azkarSbah,
    azkar!.azkarMsaa,
    azkar!.azkarQuran,
    azkar!.azkarAfterSalah,
    azkar!.azkarAfterSleep,
    azkar!.azkarBeforSleep,
    azkar!.tsapeh,
    azkar!.prophetsWords
  ];

  @override
  void initState() {
    if (azkar == null) {
      MainCubit.get(context).getAzkar(fromAzkarScreen: true);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.testTwo,
      appBar: AppBar(
        toolbarHeight: Helper.maxHeight * 0.15,
        title: const Text(
          AppStrings.azkar,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              physics: const BouncingScrollPhysics(),
              // mainAxisSpacing: AppSize.s10,
              // crossAxisSpacing: AppSize.s10,
              children: List.generate(azkarCateogries.length, (index) {
                return AzkarCategoryItemBuilder(
                  index: index,
                  azkarCategory: azkarCateogries[index],
                );
              }),
            ),
          ),
          SizedBox(
            height: AppSize.s25,
          )
        ],
      ),
    );
  }
}
