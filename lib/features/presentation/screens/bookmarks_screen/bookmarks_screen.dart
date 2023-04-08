import 'package:eman_application/core/utils/app_fonts.dart';
import 'package:eman_application/core/utils/assets_manager.dart';
import 'package:eman_application/core/utils/constants.dart';
import 'package:eman_application/core/utils/strings.dart';
import 'package:eman_application/features/presentation/controller/main_cubit/main_cubit.dart';
import 'package:eman_application/features/presentation/controller/main_cubit/main_status.dart';
import 'package:eman_application/features/presentation/screens/bookmarks_screen/widgets/bookmarks_item_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/utils/app_values.dart';
import '../../../../core/utils/helper.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.bookmarks),
        toolbarHeight: Helper.maxHeight * 0.15,
        actions: [
          PopupMenuButton(
            color: Colors.white,
            iconSize: AppFontSize.s30,
            position: PopupMenuPosition.under,
            onSelected: (value) {
              if (value == 0) {
                if (bookmarks.isNotEmpty) {
                  MainCubit.get(context).clearBookmarks();
                }
              }
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem(value: 0, child: Text(AppStrings.deleteAll))
              ];
            },
          ),
        ],
      ),
      body: BlocConsumer<MainCubit, MainStates>(
        buildWhen: (previous, current) =>
            current is MainRemoveBookmarkSuccessState ||
            current is MainRemoveBookmarkErrorState ||
            current is MainRemoveBookmarkLoadingState,
        listener: (context, state) {},
        builder: (context, state) {
          return bookmarks.isEmpty
              ? SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(AppSize.s10),
                    child: Column(
                      children: [
                        Lottie.asset(AssetsManager.empty),
                        SizedBox(
                          height: AppSize.s15,
                        ),
                        Text(
                          AppStrings.emptyBookmarks,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return BookmarksItemBuilder(
                            bookmark: bookmarks[index],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: AppSize.s5,
                          );
                        },
                        itemCount: bookmarks.length,
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
