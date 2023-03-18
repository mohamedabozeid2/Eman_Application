import 'package:dartz/dartz.dart';
import 'package:eman_application/core/error/failure.dart';
import 'package:eman_application/core/hive/hive_helper.dart';
import 'package:eman_application/core/hive/hive_keys.dart';
import 'package:eman_application/core/network/check_connection.dart';
import 'package:eman_application/core/utils/colors.dart';
import 'package:eman_application/core/utils/components.dart';
import 'package:eman_application/core/utils/constants.dart';
import 'package:eman_application/core/utils/strings.dart';
import 'package:eman_application/features/domain/entities/quran_model.dart';
import 'package:eman_application/features/presentation/controller/main_cubit/main_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/surah_bookmark_model.dart';
import '../../../domain/entities/surah_model.dart';
import '../../../domain/use_cases/get_quran.dart';

class MainCubit extends Cubit<MainStates> {
  final GetQuranUseCase getQuranUseCase;

  MainCubit(
    this.getQuranUseCase,
  ) : super(MainInitialState());

  static MainCubit get(context) => BlocProvider.of(context);

  void getQuran() {
    emit(MainGetQuranLoadingState());
    CheckConnection.checkConnection().then((value) {
      internetConnection = value;
      if (value) {
        Future.wait([
          callQuran().then((quranValue) {
            quranValue.fold((l) {
              emit(MainGetQuranErrorState());
            }, (r) {
              quranData = r.quranDataModel;
            });
          })
        ]).then((value) {
          HiveHelper.putQuran(
            box: HiveHelper.surahs!,
            key: HiveKeys.surahs,
            quran: quranData!,
          );
          HiveHelper.putIsQuranDownloaded(
            box: HiveHelper.isQuranDownloaded,
            key: HiveKeys.isQuranDownloaded,
            isQuranDownloaded: true,
          );
          isQuranDownloaded = true;
          Components.showSnackBar(
            title: AppStrings.appName,
            message: AppStrings.quranDownloaded,
            backgroundColor: AppColors.mainColor,
            textColor: Colors.white,
          );
          emit(MainGetQuranSuccessState());
        });
      }
    });
  }

  Future<Either<Failure, Quran>> callQuran() async {
    return await getQuranUseCase.execute();
  }

  void saveLastRead({
  required ScrollController scrollController,
    required Surah surah,
}){
    HiveHelper.putSurahLastRead(
      model: SurahBookmarkModel(
          scrollPosition: scrollController.position.pixels,
          surah: surah),
    );
    lastRead = SurahBookmarkModel(
      scrollPosition: scrollController.position.pixels,
      surah: surah,
    );
    emit(AddToLastReadSuccessState());
  }
}
