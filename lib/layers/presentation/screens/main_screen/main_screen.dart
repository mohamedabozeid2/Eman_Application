import 'package:eman_application/core/utils/app_values.dart';
import 'package:eman_application/core/utils/assets_manager.dart';
import 'package:eman_application/core/utils/colors.dart';
import 'package:eman_application/core/utils/components.dart';
import 'package:eman_application/core/utils/constants.dart';
import 'package:eman_application/core/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/strings.dart';
import '../../../../core/widgets/adaptive_indicator.dart';
import '../../controller/main_cubit/main_cubit.dart';
import '../../controller/main_cubit/main_status.dart';
import '../azkar_screen/azkar_screen.dart';
import '../bookmarks_screen/bookmarks_screen.dart';
import '../qibla_screen/qibla_screen.dart';
import '../quran_screen/quran_screen.dart';
import '../quran_screen/surah_screen.dart';
import '../radio_screen/radio_screen.dart';
import '../seal_of_quran/seal_of_quran.dart';
import '../sebha_screen/sebha_screen.dart';
import '../server_error_screen/server_error_screen.dart';
import 'model/navigatorTapModel.dart';
import 'widgets/navigator_tap.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Color> tapsColors = [
    AppColors.mainColor,
    AppColors.tealColor,
    AppColors.secondaryColor,
    AppColors.backgroundColor,
    AppColors.maroonColor,
    AppColors.lightOrangeColor,
    AppColors.purple,
    AppColors.lightPurple,
    AppColors.blue,
    AppColors.lightBlue,
    AppColors.navy,
    AppColors.testTwo,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MainCubit, MainStates>(
        buildWhen: (previous, current) =>
            current is MainGetQuranLoadingState ||
            current is MainGetQuranSuccessState,
        listener: (context, state) {
          if (state is MainGetQuranServerErrorState) {
            Components.navigateAndFinish(
                context: context, widget: const ServerErrorScreen());
          }
        },
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
                        AppStrings.appName,
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
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
                                ),
                              ],
                            ),
                            SizedBox(
                              height: AppSize.s20,
                            ),
                            BlocConsumer<MainCubit, MainStates>(
                              buildWhen: (previous, current) =>
                                  current is AddToLastReadSuccessState,
                              listener: (context, state) {},
                              builder: (context, state) {
                                return lastRead == null
                                    ? Container()
                                    : NavigatorTap(
                                        navigatorTapModel: NavigatorTapModel(
                                          title: AppStrings.lastRead,
                                          firstColor: tapsColors[10],
                                          secondColor: tapsColors[1],
                                          image: AssetsManager.lantern,
                                          pathWidget: SurahScreen(
                                            surah: lastRead!.surah,
                                            jumpToPosition:
                                                lastRead!.scrollPosition,
                                          ),
                                        ),
                                        fromLastRead: true,
                                      );
                              },
                            ),
                            GridView.count(
                              crossAxisCount: 2,
                              childAspectRatio: 1 / 1.3,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              crossAxisSpacing: AppSize.s20,
                              mainAxisSpacing: AppSize.s20,
                              children: [
                                NavigatorTap(
                                  navigatorTapModel: NavigatorTapModel(
                                    title: AppStrings.quran,
                                    firstColor: tapsColors[11],
                                    secondColor: tapsColors[1],
                                    image: AssetsManager.appLogo,
                                    pathWidget: QuranScreen(),
                                  ),
                                ),
                                NavigatorTap(
                                  navigatorTapModel: NavigatorTapModel(
                                    title: AppStrings.bookmarks,
                                    firstColor: tapsColors[1],
                                    secondColor: tapsColors[3],
                                    image: AssetsManager.bookmarks,
                                    pathWidget: const BookmarksScreen(),
                                  ),
                                ),
                                NavigatorTap(
                                  navigatorTapModel: NavigatorTapModel(
                                    title: AppStrings.radio,
                                    firstColor: tapsColors[1],
                                    secondColor: tapsColors[8],
                                    image: AssetsManager.radio,
                                    pathWidget: const RadioScreen(),
                                  ),
                                ),
                                NavigatorTap(
                                  navigatorTapModel: NavigatorTapModel(
                                    title: AppStrings.tasbih,
                                    firstColor: tapsColors[10],
                                    secondColor: tapsColors[1],
                                    image: AssetsManager.tasbih,
                                    pathWidget: const Sebha(),
                                  ),
                                ),
                                NavigatorTap(
                                  navigatorTapModel: NavigatorTapModel(
                                    title: AppStrings.qibla,
                                    firstColor: tapsColors[3],
                                    secondColor: tapsColors[1],
                                    image: AssetsManager.praying,
                                    pathWidget: const Qibla(),
                                  ),
                                ),
                                NavigatorTap(
                                  navigatorTapModel: NavigatorTapModel(
                                      title: AppStrings.azkar,
                                      firstColor: tapsColors[10],
                                      secondColor: tapsColors[11],
                                      image: AssetsManager.moon,
                                      pathWidget: const AzkarScreen()),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: AppSize.s20,
                            ),
                            AspectRatio(
                              aspectRatio: 1.6,
                              child: NavigatorTap(
                                navigatorTapModel: NavigatorTapModel(
                                  title: AppStrings.sealOfTheQuran,
                                  firstColor: tapsColors[8],
                                  secondColor: tapsColors[1],
                                  image: AssetsManager.star,
                                  pathWidget: const SealOfQuran(),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: AppSize.s20,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
        },
      ),
    );
  }
}
