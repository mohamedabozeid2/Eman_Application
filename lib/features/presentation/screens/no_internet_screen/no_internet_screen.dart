import 'package:eman_application/core/network/check_connection.dart';
import 'package:eman_application/core/utils/app_values.dart';
import 'package:eman_application/core/utils/assets_manager.dart';
import 'package:eman_application/core/utils/colors.dart';
import 'package:eman_application/core/utils/components.dart';
import 'package:eman_application/core/utils/strings.dart';
import 'package:eman_application/features/presentation/screens/layout/layout.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoInternetScreen extends StatelessWidget {

  const NoInternetScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              AssetsManager.noInternet,
            ),
            Text(
              AppStrings.needNetworkForQuran,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.white,
                  ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: AppSize.s10,
            ),
            GestureDetector(
              onTap: () {
                CheckConnection.checkConnection().then((value) {
                  if (value) {
                    Components.navigateAndFinish(
                        context: context, widget: const Layout());
                  }
                });
              },
              child: Container(
                padding: EdgeInsets.all(AppSize.s10),
                decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(AppSize.s10)),
                child: Text(AppStrings.refresh,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                        )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
