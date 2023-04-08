import 'package:eman_application/core/utils/app_values.dart';
import 'package:eman_application/core/utils/colors.dart';
import 'package:eman_application/core/utils/components.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/single_azkar_model.dart';
import 'azkar_category_screen.dart';

class AzkarCategoryItemBuilder extends StatelessWidget {
  final int index;
  final List<SingleAzkar> azkarCategory;

  AzkarCategoryItemBuilder({
    Key? key,
    required this.index,
    required this.azkarCategory,
  }) : super(key: key);

  final List<Color> tapsColors = [
    AppColors.azkarColorOne,
    AppColors.azkarColorTwo,
    AppColors.azkarColorFive,
    AppColors.azkarColorThree,
    AppColors.azkarColorFour,
    AppColors.azkarColorOne,
    AppColors.azkarColorTwo,
    AppColors.azkarColorFive,
    AppColors.azkarColorThree,
    AppColors.azkarColorFour,
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Components.navigateTo(
            context, AzkarCategoryScreen(azkarCategory: azkarCategory));
      },
      child: Container(
        margin: EdgeInsets.all(AppSize.s10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              tapsColors[index],
              tapsColors[index + 1],
            ],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
          borderRadius: BorderRadius.circular(AppSize.s20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              azkarCategory[0].category,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
