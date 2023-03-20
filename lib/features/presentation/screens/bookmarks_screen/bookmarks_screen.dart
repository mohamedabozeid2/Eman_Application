import 'package:eman_application/core/utils/constants.dart';
import 'package:eman_application/core/widgets/divider.dart';
import 'package:eman_application/features/presentation/controller/main_cubit/main_cubit.dart';
import 'package:eman_application/features/presentation/controller/main_cubit/main_status.dart';
import 'package:eman_application/features/presentation/screens/bookmarks_screen/widgets/bookmarks_item_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/helper.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bookmarks"),
        toolbarHeight: Helper.maxHeight * 0.15,
      ),
      body: BlocConsumer<MainCubit, MainStates>(
        buildWhen: (previous, current) =>
            current is MainRemoveBookmarkSuccessState ||
            current is MainRemoveBookmarkErrorState ||
            current is MainRemoveBookmarkLoadingState,
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
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
                    return MyDivider(
                      color: Colors.white,
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
