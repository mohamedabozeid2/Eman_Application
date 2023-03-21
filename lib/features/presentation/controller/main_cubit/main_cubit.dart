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
import 'package:intl/intl.dart';

import '../../../domain/entities/radio.dart';
import '../../../domain/entities/surah_audio.dart';
import '../../../domain/entities/surah_bookmark_model.dart';
import '../../../domain/entities/surah_model.dart';
import '../../../domain/use_cases/get_quran.dart';
import '../../../domain/use_cases/get_radio.dart';
import '../../../domain/use_cases/get_surah_audio.dart';

class MainCubit extends Cubit<MainStates> {
  final GetQuranUseCase getQuranUseCase;
  final GetSurahAudioUseCase getSurahAudioUseCase;
  final GetRadioUseCase getRadioUseCase;

  MainCubit(
    this.getQuranUseCase,
    this.getSurahAudioUseCase,
    this.getRadioUseCase,
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

  String? surahAudioUrl;

  Future<void> getSurahAudio({
    required int surahIndex,
  }) async {
    emit(MainGetSurahAudioLoadingState());
    CheckConnection.checkConnection().then((value) async {
      internetConnection = value;
      if (value) {
        await callSurahAudio(surahIndex: surahIndex).then((surahAudio) {
          surahAudio.fold((l) {
            emit(MainGetSurahAudioErrorState());
          }, (r) {
            surahAudioUrl = r.audioUrl;
            emit(MainGetSurahAudioSuccessState());
          });
        });
      } else {
        Components.showSnackBar(
          title: AppStrings.appName,
          message: AppStrings.noInternetForAudio,
          backgroundColor: Colors.white,
          textColor: AppColors.tealColor,
          durationWithMilliSeconds: 2000,
        );
        emit(MainGetSurahAudioErrorState());
      }
    });
  }

  Future<Either<Failure, SurahAudio>> callSurahAudio({
    required int surahIndex,
  }) async {
    return await getSurahAudioUseCase.execute(surahIndex: surahIndex);
  }

  Future<void> getRadio() async {
    emit(MainGetRadioLoadingState());
    CheckConnection.checkConnection().then((value) {
      internetConnection = value;
      if (value) {
        callRadio().then((value) {
          value.fold((l) {
            emit(MainGetRadioErrorState());
          }, (r) {
            radioModel = r;
            emit(MainGetRadioSuccessState());
          });
        });
      }/* else {
        Components.showSnackBar(
          title: AppStrings.appName,
          message: AppStrings.checkInternet,
          backgroundColor: Colors.white,
          textColor: AppColors.tealColor,
        );
      }*/
    });
  }

  Future<Either<Failure, RadioEntity>> callRadio() async {
    return await getRadioUseCase.execute();
  }

  void saveLastRead({
    required ScrollController scrollController,
    required Surah surah,
  }) {
    HiveHelper.putSurahLastRead(
      model: SurahBookmarkModel(
        scrollPosition: scrollController.position.pixels,
        surah: surah,
        date: DateFormat.yMMMMd().format(DateTime.now()),
      ),
    );
    lastRead = SurahBookmarkModel(
      scrollPosition: scrollController.position.pixels,
      surah: surah,
      date: DateFormat.yMMMMd().format(DateTime.now()),
    );
    emit(AddToLastReadSuccessState());
  }

  void addToBookmark({
    required ScrollController scrollController,
    required Surah surah,
  }) {
    bookmarks.add(
      SurahBookmarkModel(
          scrollPosition: scrollController.position.pixels,
          surah: surah,
          date: DateFormat.yMMMMd().format(DateTime.now())),
    );
    HiveHelper.putInBookmarksList(model: bookmarks);
    emit(AddToBookmarksSuccessState());
  }

  void removeFromBookmarks({
    required SurahBookmarkModel bookmarkModel,
  }) {
    emit(MainRemoveBookmarkLoadingState());
    if (bookmarks.contains(bookmarkModel)) {
      bookmarks.remove(bookmarkModel);
      HiveHelper.putInBookmarksList(model: bookmarks);
      emit(MainRemoveBookmarkSuccessState());
    } else {
      emit(MainRemoveBookmarkErrorState());
    }
  }
}
