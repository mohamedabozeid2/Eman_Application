import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../../../../../core/utils/app_values.dart';
import '../../../../../core/utils/components.dart';
import '../../../../domain/entities/surah_model.dart';
import '../surah_screen.dart';

class SurahItemBuilder extends StatelessWidget {
  final Surah surah;
  final ArabicNumbers arabicNumber = ArabicNumbers();

  SurahItemBuilder({
    Key? key,
    required this.surah,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: AppSize.s15, vertical: AppSize.s10),
      child: GestureDetector(
        onTap: () {
          Components.navigateTo(
            context,
            SurahScreen(
              surah: surah,
            ),
          );
        },
        child: Row(
          children: [
            SizedBox(
              height: AppSize.s50,
              width: AppSize.s50,
              child: ClipPath(
                clipper: StarClipper(15),
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      surah.number.toString(),
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: AppSize.s10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  surah.englishName,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  surah.englishNameTranslation,
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
            const Spacer(),
            Text(
              surah.name,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
