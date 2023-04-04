import 'package:eman_application/core/utils/app_values.dart';
import 'package:eman_application/core/utils/assets_manager.dart';
import 'package:eman_application/core/utils/colors.dart';
import 'package:eman_application/core/utils/strings.dart';
import 'package:eman_application/features/presentation/controller/main_cubit/main_cubit.dart';
import 'package:eman_application/features/presentation/controller/main_cubit/main_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/helper.dart';

class Sebha extends StatefulWidget {
  const Sebha({Key? key}) : super(key: key);

  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  final List<String> taspehData = [
    'سبحان الله',
    "الحمد لله",
    "لا إله إلا الله",
    "الله أكبر",
    "أستغفر الله",
    "سبحان الله وبحمده",
    "سبحان الله العظيم",
  ];

  int taspehCounter = 0;

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Helper.maxHeight * 0.15,
        title: const Text(AppStrings.sebha),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocConsumer<MainCubit, MainStates>(
                buildWhen: (previous, current) =>
                    current is MainTaspehSuccessState,
                listener: (context, state) {},
                builder: (context, state) {
                  return Container(
                    height: Helper.maxHeight * 0.1,
                    width: Helper.maxWidth * 0.8,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          AppColors.mainColor.withOpacity(0.5),
                          AppColors.backgroundColor,
                        ]),
                        borderRadius: BorderRadius.circular(AppSize.s30)),
                    child: Text(
                      taspehData[taspehCounter],
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.white),
                    ),
                  );
                },
              ),
              SizedBox(
                height: AppSize.s20,
              ),
              GestureDetector(
                onTap: () {
                  counter++;
                  if (MainCubit.get(context).taspehCount(counter: counter)) {
                    taspehCounter++;
                    counter = 0;
                    if (taspehCounter == taspehData.length) {
                      taspehCounter = 0;
                    }
                  }
                },
                child: SizedBox(
                  height: Helper.maxHeight * 0.3,
                  child: Image.asset(AssetsManager.sebha),
                ),
              ),
              SizedBox(
                height: AppSize.s20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BlocConsumer<MainCubit, MainStates>(
                    buildWhen: (previous, current) =>
                        current is MainTaspehSuccessState,
                    listener: (context, state) {},
                    builder: (context, state) {
                      return Container(
                        padding: EdgeInsets.all(AppSize.s20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSize.s30),
                          gradient: LinearGradient(
                              colors: [
                                AppColors.mainColor.withOpacity(0.5),
                                AppColors.backgroundColor,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                        ),
                        child: Text(
                          counter.toString(),
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      );
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      taspehCounter = 0;
                      counter = 0;
                      setState(() {});
                    },
                    child: Container(
                      padding: EdgeInsets.all(AppSize.s20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.s30),
                        gradient: LinearGradient(
                          colors: [
                            AppColors.mainColor.withOpacity(0.5),
                            AppColors.backgroundColor,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Text(
                        AppStrings.reset,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
