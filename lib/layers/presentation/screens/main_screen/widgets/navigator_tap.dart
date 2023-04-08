import 'package:eman_application/core/utils/app_fonts.dart';
import 'package:eman_application/core/utils/app_values.dart';
import 'package:eman_application/core/utils/components.dart';
import 'package:eman_application/core/utils/constants.dart';
import 'package:eman_application/core/utils/helper.dart';
import 'package:eman_application/core/utils/strings.dart';
import 'package:flutter/material.dart';

import '../model/navigatorTapModel.dart';

class NavigatorTap extends StatefulWidget {
  final NavigatorTapModel navigatorTapModel;
  final bool fromLastRead;

  const NavigatorTap({
    Key? key,
    required this.navigatorTapModel,
    this.fromLastRead = false,
  }) : super(key: key);

  @override
  State<NavigatorTap> createState() => _NavigatorTapState();
}

class _NavigatorTapState extends State<NavigatorTap> {
  late double tapTextWidth;

  @override
  void initState() {
    if (widget.fromLastRead) {
      tapTextWidth =
          Helper.maxWidth * 0.7 - Helper.maxWidth * 0.2 - AppSize.s20;
    } else if (widget.navigatorTapModel.title == AppStrings.sealOfTheQuran) {
      tapTextWidth = Helper.maxWidth * 0.8;
    } else {
      tapTextWidth = Helper.maxWidth * 0.4 - AppSize.s15 - AppSize.s25;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Components.navigateTo(
          context,
          widget.navigatorTapModel.pathWidget,
        );
      },
      child: Material(
        elevation: 5.5,
        borderRadius: BorderRadius.circular(AppSize.s25),
        child: Container(
          width: widget.fromLastRead
              ? Helper.maxWidth * 0.8
              : Helper.maxWidth * 0.4,
          padding: EdgeInsets.all(AppSize.s15),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [
                0.2,
                0.7,
              ],
              colors: [
                widget.navigatorTapModel.firstColor,
                widget.navigatorTapModel.secondColor,
              ],
            ),
            borderRadius: BorderRadius.circular(AppSize.s25),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.fromLastRead
                      ? Padding(
                          padding: EdgeInsets.symmetric(vertical: AppSize.s10),
                          child: Text(
                            widget.navigatorTapModel.title,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: Colors.white),
                          ),
                        )
                      : Container(),
                  widget.fromLastRead
                      ? Container()
                      : Image.asset(
                          widget.navigatorTapModel.image,
                          width: Helper.maxWidth * 0.2,
                        ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: AppSize.s10,
                      top: widget.fromLastRead ? AppSize.s10 : AppSize.s30,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: tapTextWidth,
                              child: Text(
                                widget.fromLastRead
                                    ? lastRead!.surah.name
                                    : widget.navigatorTapModel.title,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                            widget.fromLastRead
                                ? Text(
                                    lastRead!.date,
                                    textAlign: TextAlign.start,
                                    textDirection: TextDirection.ltr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          color: Colors.white,
                                        ),
                                  )
                                : Container(),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: AppSize.s10),
                    child: Row(
                      children: [
                        Text(
                          AppStrings.goTo,
                          textAlign: TextAlign.start,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
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
              widget.fromLastRead
                  ? Image.asset(
                      widget.navigatorTapModel.image,
                      width: Helper.maxWidth * 0.2,
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
