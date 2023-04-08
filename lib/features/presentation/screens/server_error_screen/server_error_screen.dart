import 'package:eman_application/core/utils/components.dart';
import 'package:eman_application/core/utils/strings.dart';
import 'package:eman_application/features/presentation/controller/main_cubit/main_cubit.dart';
import 'package:eman_application/features/presentation/screens/main_screen/main_screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_values.dart';
import '../../../../core/utils/colors.dart';

class ServerErrorScreen extends StatelessWidget {
  const ServerErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(AppSize.s15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppStrings.serverError,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                    ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: AppSize.s15,
              ),
              GestureDetector(
                onTap: () {
                  MainCubit.get(context).getQuran(context: context);
                  MainCubit.get(context).getRadio();
                  Components.navigateAndFinish(
                      context: context, widget: const MainScreen());
                },
                child: Container(
                  padding: EdgeInsets.all(AppSize.s10),
                  decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(AppSize.s10)),
                  child: Text(
                    AppStrings.tryAgain,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
