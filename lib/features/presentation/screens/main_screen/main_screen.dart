import 'package:eman_application/core/utils/app_values.dart';
import 'package:eman_application/core/utils/assets_manager.dart';
import 'package:eman_application/core/utils/colors.dart';
import 'package:eman_application/core/utils/components.dart';
import 'package:eman_application/core/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/strings.dart';
import '../../../../core/widgets/adaptive_indicator.dart';
import '../../controller/main_cubit/main_cubit.dart';
import '../../controller/main_cubit/main_status.dart';
import 'model/navigatorTapModel.dart';
import 'widgets/navigator_tap.dart';

class MainScreen extends StatelessWidget {
  final List<Color> tapsColors = [
    AppColors.mainColor,
    AppColors.tealColor,
    AppColors.secondaryColor,
    AppColors.lightPink,
    AppColors.maroonColor,
    AppColors.lightOrangeColor,
    AppColors.purple,
    AppColors.lightPurple,
    AppColors.blue,
    AppColors.lightBlue,
  ];

  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
      buildWhen: (previous, current) =>
          current is MainGetQuranLoadingState ||
          current is MainGetQuranSuccessState,
      listener: (context, state) {},
      builder: (context, state) {
        return state is MainGetQuranLoadingState
            ? Center(
                child: AdaptiveIndicator(
                  os: Components.getOS(),
                  color: AppColors.mainColor,
                ),
              )
            : CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    title: Text(
                      'My ${AppStrings.appName}',
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(color: Colors.white),
                    ),
                    toolbarHeight: Helper.maxHeight * 0.15,
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(AppSize.s20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AssetsManager.quranLogo,
                                width: Helper.maxWidth * 0.4,
                              )
                            ],
                          ),
                          SizedBox(
                            height: AppSize.s20,
                          ),
                          GridView.count(
                            crossAxisCount: 2,
                            childAspectRatio: 1 / 1.2,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            crossAxisSpacing: AppSize.s20,
                            mainAxisSpacing: AppSize.s20,
                            children: [
                              NavigatorTap(
                                navigatorTapModel: NavigatorTapModel(
                                  title: AppStrings.quran,
                                  firstColor: tapsColors[2],
                                  secondColor: tapsColors[3],
                                  image: AssetsManager.quranTap,
                                ),
                              ),
                              NavigatorTap(
                                navigatorTapModel: NavigatorTapModel(
                                  title: AppStrings.bookmarks,
                                  firstColor: tapsColors[8],
                                  secondColor: tapsColors[9],
                                  image: AssetsManager.bookmarks,
                                ),
                              ),
                              NavigatorTap(
                                navigatorTapModel: NavigatorTapModel(
                                  title: AppStrings.radio,
                                  firstColor: tapsColors[0],
                                  secondColor: tapsColors[1],
                                  image: AssetsManager.radio,
                                ),
                              ),
                              NavigatorTap(
                                navigatorTapModel: NavigatorTapModel(
                                  title: AppStrings.qibla,
                                  firstColor: tapsColors[6],
                                  secondColor: tapsColors[7],
                                  image: AssetsManager.kaaba,
                                ),
                              ),
                              NavigatorTap(
                                navigatorTapModel: NavigatorTapModel(
                                  title: AppStrings.hadith,
                                  firstColor: tapsColors[8],
                                  secondColor: tapsColors[9],
                                  image: AssetsManager.hadith,
                                ),
                              ),
                              NavigatorTap(
                                navigatorTapModel: NavigatorTapModel(
                                  title: AppStrings.learnHowToPray,
                                  firstColor: tapsColors[4],
                                  secondColor: tapsColors[5],
                                  image: AssetsManager.praying,
                                ),
                              ),
                              NavigatorTap(
                                navigatorTapModel: NavigatorTapModel(
                                  title: AppStrings.sealOfTheQuran,
                                  firstColor: tapsColors[1],
                                  secondColor: tapsColors[0],
                                  image: AssetsManager.star,
                                ),
                              ),
                              NavigatorTap(
                                navigatorTapModel: NavigatorTapModel(
                                  title: AppStrings.share,
                                  firstColor: tapsColors[7],
                                  secondColor: tapsColors[6],
                                  image: AssetsManager.send,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
      },
    );
  }
}
