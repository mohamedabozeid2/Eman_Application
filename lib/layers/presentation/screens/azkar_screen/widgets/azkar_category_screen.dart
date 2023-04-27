import 'package:eman_application/core/utils/app_values.dart';
import 'package:eman_application/core/widgets/divider.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/helper.dart';
import '../../../../data/models/single_azkar_model.dart';

class AzkarCategoryScreen extends StatelessWidget {
  final List<SingleAzkar> azkarCategory;

  const AzkarCategoryScreen({
    Key? key,
    required this.azkarCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Helper.maxHeight * 0.1,
        title: Text(
          azkarCategory[0].category,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.s10,
                    // vertical: 0,
                  ),
                  child: Column(
                    children: [
                      Card(
                        color: Colors.transparent,
                        // margin: EdgeInsets.only(top: AppSize.s10),
                        // elevation: 0.2,
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppSize.s15)
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(AppSize.s7),
                            child: Text(
                              azkarCategory[index].content,
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      ),
                      azkarCategory[index].description == ""
                          ? Container()
                          : Row(
                            children: [
                              Expanded(
                                child: Text(
                                  azkarCategory[index].description,
                                  textAlign: TextAlign.center,
                                  textDirection: TextDirection.rtl,
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      color: Colors.white
                                  ),
                                ),
                              ),
                            ],
                          ),
                      azkarCategory[index].reference == ""
                          ? Container()
                          : Row(
                            children: [
                              Expanded(
                                child: Text(
                                  azkarCategory[index].reference,
                                  textAlign: TextAlign.center,
                                  textDirection: TextDirection.rtl,
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      color: Colors.white
                                  ),
                                ),
                              ),
                            ],
                          ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return MyDivider(
                  color: Colors.white,
                );
              },
              itemCount: azkarCategory.length,
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
