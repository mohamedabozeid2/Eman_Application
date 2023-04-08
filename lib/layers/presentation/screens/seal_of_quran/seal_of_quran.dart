import 'package:eman_application/core/utils/app_values.dart';
import 'package:eman_application/core/utils/strings.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/helper.dart';
import 'data_strings/data_strings.dart';

class SealOfQuran extends StatefulWidget {
  const SealOfQuran({Key? key}) : super(key: key);

  @override
  State<SealOfQuran> createState() => _SealOfQuranState();
}

class _SealOfQuranState extends State<SealOfQuran> {
  final List<String> data = [
    SealDataStrings.firstData,
    SealDataStrings.secondData,
    SealDataStrings.thirdData,
    SealDataStrings.forthData,
    SealDataStrings.fifthData,
    SealDataStrings.sixthData,
    SealDataStrings.seventhData,
    SealDataStrings.eighthData,
    SealDataStrings.ninthData,
    SealDataStrings.tenthData,
    SealDataStrings.eleventhData,
  ];
  String sealText = "";

  @override
  void initState() {
    for (int i = 0; i < data.length; i++) {
      sealText += data[i];
      sealText += " * ";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: Helper.maxHeight * 0.15,
          title: const Text(AppStrings.sealOfTheQuran),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.s15),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Text(
                  sealText,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                      ),
                ),
                // Expanded(
                //   child: ListView.builder(
                //     physics: const BouncingScrollPhysics(),
                //     padding: EdgeInsets.zero,
                //     itemBuilder: (context, index) {
                //       return Text(
                //         data[index],
                //         textDirection: TextDirection.rtl,
                //         style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                //               color: Colors.white,
                //             ),
                //       );
                //     },
                //     itemCount: data.length,
                //   ),
                // )
              ],
            ),
          ),
        ));
  }
}
