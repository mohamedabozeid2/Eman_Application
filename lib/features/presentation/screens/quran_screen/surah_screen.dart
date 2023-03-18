import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:eman_application/core/utils/assets_manager.dart';
import 'package:eman_application/core/utils/constants.dart';
import 'package:eman_application/features/presentation/controller/main_cubit/main_cubit.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/app_values.dart';
import '../../../../core/utils/helper.dart';
import '../../../domain/entities/surah_model.dart';
//ignore: must_be_immutable

class SurahScreen extends StatefulWidget {
  final Surah surah;
  final bool fromLastRead;

  const SurahScreen({
    Key? key,
    required this.surah,
    this.fromLastRead = false,
  }) : super(key: key);

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  final ArabicNumbers arabicNumber = ArabicNumbers();
  final ScrollController scrollController = ScrollController();
  String surahContent = "";

  @override
  void initState() {
    for (int i = 0; i < widget.surah.ayahs.length; i++) {
      surahContent += "${widget.surah.ayahs[i].text} ";
      surahContent +=
          "\u06DD${arabicNumber.convert(widget.surah.ayahs[i].numberInSurah)}";
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.fromLastRead) {
        scrollController.jumpTo(lastRead!.scrollPosition);
      }
      scrollController.position.isScrollingNotifier.addListener(() {
        MainCubit.get(context).saveLastRead(
          scrollController: scrollController,
          surah: widget.surah,
        );
        // HiveHelper.putSurahLastRead(
        //   model: SurahBookmarkModel(
        //       scrollPosition: scrollController.position.pixels,
        //       surah: widget.surah),
        // );
        // lastRead = SurahBookmarkModel(
        //   scrollPosition: scrollController.position.pixels,
        //   surah: widget.surah,
        // );
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.transparent,
        child: GestureDetector(
            onTap: () {
              // print(scrollController.position.pixels);
              // widget.scrollPosition = scrollController.position.pixels;
              // HiveHelper.putBookmark(
              //   model: SurahBookmarkModel(
              //     scrollPosition: scrollController.position.pixels,
              //     surah: widget.surah,
              //   ),
              // );
              // Components.showSnackBar(
              //   title: AppStrings.appName,
              //   message: AppStrings.addedToBookmarks,
              //   backgroundColor: AppColors.tealColor,
              //   textColor: Colors.white,
              // );
            },
            child: Image.asset(AssetsManager.bookmarks, fit: BoxFit.contain)),
      ),
      appBar: AppBar(
        toolbarHeight: Helper.maxHeight * 0.15,
        title: Text(
          widget.surah.name,
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white, size: AppFontSize.s34),
      ),
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          // SliverAppBar(
          //   iconTheme:
          //       IconThemeData(color: Colors.white, size: AppFontSize.s34),
          //   title: Text(
          //     widget.surah.name,
          //     style: Theme.of(context)
          //         .textTheme
          //         .headline3!
          //         .copyWith(color: Colors.white),
          //   ),
          //   toolbarHeight: Helper.maxHeight * 0.15,
          // ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(AppSize.s20),
              child: Column(
                children: [
                  // Text('\u06DD${arabicNumber.convert(1)}'),
                  Text(
                    surahContent,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
