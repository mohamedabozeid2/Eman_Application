import 'package:eman_application/core/utils/app_fonts.dart';
import 'package:eman_application/core/utils/app_values.dart';
import 'package:eman_application/core/utils/helper.dart';
import 'package:eman_application/core/utils/strings.dart';
import 'package:eman_application/features/presentation/screens/main_screen/model/navigatorTapModel.dart';
import 'package:flutter/material.dart';

class NavigatorTap extends StatelessWidget {
  final NavigatorTapModel navigatorTapModel;

  const NavigatorTap({
    Key? key,
    required this.navigatorTapModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.5,
      borderRadius: BorderRadius.circular(AppSize.s25),
      child: Container(
        width: Helper.maxWidth * 0.4,
        padding: EdgeInsets.all(AppSize.s15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            stops: const [
              0.2,
              0.7,
            ],

            end: Alignment.bottomLeft,
            colors: [
              navigatorTapModel.firstColor,
              navigatorTapModel.secondColor,
            ],
          ),
          borderRadius: BorderRadius.circular(AppSize.s25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              navigatorTapModel.image,
              width: Helper.maxWidth * 0.2,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: AppSize.s10, top: AppSize.s30),
              child: Text(
                navigatorTapModel.title,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: AppSize.s10),
              child: Row(
                children: [
                  Text(
                    AppStrings.goTo,
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  SizedBox(
                    width: AppSize.s5,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: AppFontSize.s15,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
