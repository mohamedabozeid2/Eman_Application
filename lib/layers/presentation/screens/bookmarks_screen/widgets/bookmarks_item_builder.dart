import 'package:eman_application/core/utils/app_values.dart';
import 'package:eman_application/core/utils/colors.dart';
import 'package:eman_application/core/utils/components.dart';
import 'package:eman_application/core/widgets/adaptive_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/surah_bookmark_model.dart';
import '../../../controller/main_cubit/main_cubit.dart';
import '../../../controller/main_cubit/main_status.dart';
import '../../quran_screen/surah_screen.dart';

class BookmarksItemBuilder extends StatelessWidget {
  final SurahBookmarkModel bookmark;

  const BookmarksItemBuilder({
    Key? key,
    required this.bookmark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Components.navigateTo(
          context,
          SurahScreen(
            surah: bookmark.surah,
            jumpToPosition: bookmark.scrollPosition,
          ),
        );
      },
      child: Card(
        color: Colors.transparent,
        elevation: 0.0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s10),
            gradient: LinearGradient(colors: [
              AppColors.backgroundColor,
              AppColors.tealColor,
            ], begin: Alignment.centerRight, end: Alignment.centerLeft),
          ),
          child: Padding(
            padding: EdgeInsets.all(AppSize.s10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              bookmark.surah.name,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        bookmark.date,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ],
                  ),
                ),
                BlocConsumer<MainCubit, MainStates>(
                  buildWhen: (previous, current) =>
                      current is MainRemoveBookmarkLoadingState ||
                      current is MainRemoveBookmarkErrorState ||
                      current is MainRemoveBookmarkSuccessState,
                  listener: (context, state) {},
                  builder: (context, state) {
                    return state is MainRemoveBookmarkLoadingState
                        ? AdaptiveIndicator(
                            os: Components.getOS(),
                            color: Colors.white,
                          )
                        : GestureDetector(
                            onTap: () {
                              MainCubit.get(context)
                                  .removeFromBookmarks(bookmarkModel: bookmark);
                            },
                            child: Container(
                              padding: EdgeInsets.all(AppSize.s10),
                              decoration: BoxDecoration(
                                color: AppColors.backgroundColor,
                                borderRadius:
                                    BorderRadius.circular(AppSize.s10),
                              ),
                              child: Text(
                                'Delete',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
