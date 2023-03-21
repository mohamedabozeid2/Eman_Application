import 'package:eman_application/core/utils/app_values.dart';
import 'package:eman_application/core/utils/colors.dart';
import 'package:eman_application/core/utils/strings.dart';
import 'package:flutter/material.dart';

class LocationErrorWidget extends StatelessWidget {
  final String? error;
  final Function? callback;

  const LocationErrorWidget({Key? key, this.error, this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            Icons.location_off,
            size: AppSize.s150,
            color: AppColors.blue,
          ),
          SizedBox(
            height: AppSize.s30,
          ),
          Text(
            error!,
            style: TextStyle(
              color: AppColors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 32),
          GestureDetector(
            onTap: () {
              if (callback != null) callback!();
            },
            child: Container(
              padding: EdgeInsets.all(AppSize.s7),
              decoration: BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.circular(
                  AppSize.s10,
                ),
              ),
              child: Text(
                AppStrings.retry,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
