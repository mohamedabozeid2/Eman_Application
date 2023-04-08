import 'package:dartz/dartz.dart';
import 'package:eman_application/core/error/failure.dart';
import 'package:eman_application/core/hive/hive_helper.dart';
import 'package:eman_application/core/network/check_connection.dart';
import 'package:eman_application/core/utils/colors.dart';
import 'package:eman_application/core/utils/components.dart';
import 'package:eman_application/core/utils/constants.dart';
import 'package:eman_application/core/utils/strings.dart';
import 'package:eman_application/features/domain/entities/azkar.dart';
import 'package:eman_application/features/domain/entities/quran_model.dart';
import 'package:eman_application/features/presentation/controller/main_cubit/main_status.dart';
import 'package:eman_application/features/presentation/screens/no_internet_screen/no_internet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../core/utils/app_fonts.dart';
import '../../../domain/entities/radio.dart';
import '../../../domain/entities/surah_audio.dart';
import '../../../domain/entities/surah_bookmark_model.dart';
import '../../../domain/entities/surah_model.dart';
import '../../../domain/use_cases/get_azkar.dart';
import '../../../domain/use_cases/get_quran.dart';
import '../../../domain/use_cases/get_radio.dart';
import '../../../domain/use_cases/get_surah_audio.dart';

class MainCubit extends Cubit<MainStates> {
  final GetQuranUseCase getQuranUseCase;
  final GetSurahAudioUseCase getSurahAudioUseCase;
  final GetRadioUseCase getRadioUseCase;
  final GetAzkarUseCase getAzkarUseCase;

  MainCubit(
    this.getQuranUseCase,
    this.getSurahAudioUseCase,
    this.getRadioUseCase,
    this.getAzkarUseCase,
  ) : super(MainInitialState());

  static MainCubit get(context) => BlocProvider.of(context);

  Future<void> getAllData({
    required BuildContext context,
  }) async {
    emit(MainGetAllDataLoadingState());
    await Future.wait([
      getQuran(context: context).then((value) {
        emit(MainGetAllDataSuccessState());
      }),
      getRadio(),
    ]).then((value) {}).catchError((error) {
      emit(MainGetAllDataErrorState(error));
    });
  }

  Future<void> getQuran({
    required BuildContext context,
  }) async {
    if (!isQuranDownloaded) {
      emit(MainGetQuranLoadingState());
      CheckConnection.checkConnection().then((value) async {
        internetConnection = value;
        if (value) {
          await callQuran().then((quranValue) {
            quranValue.fold((l) {
              emit(MainGetQuranErrorState());
            }, (r) {
              quranData = r.quranDataModel;
            });
          }).then((value) {
            HiveHelper.putQuran(
              quran: quranData!,
            );
            HiveHelper.putIsQuranDownloaded(
              isQuranDownloadedValue: true,
            );
            isQuranDownloaded = true;

            getAzkar();
            Components.showSnackBar(
              title: AppStrings.appName,
              message: AppStrings.quranDownloaded,
              backgroundColor: AppColors.mainColor,
              textColor: Colors.white,
            );
            emit(MainGetQuranSuccessState());
          }).catchError((error){
            emit(MainGetQuranServerErrorState());
          });
        }else{
          Components.navigateAndFinish(context: context, widget: const NoInternetScreen());
          emit(MainGetQuranErrorState());
        }
      });
    }
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

  Future<void> startSurahAudio(
    AudioPlayer audioPlayer,
  ) async {
    emit(MainStartSurahAudioLoadingState());
    await CheckConnection.checkConnection().then((value) {
      internetConnection = value;
      if (value) {
        audioPlayer.setAudioSource(
          AudioSource.uri(
            Uri.parse(surahAudioUrl!),
          ),
        );
        emit(MainStartSurahAudioSuccessState());
      } else {
        Components.showSnackBar(
          title: AppStrings.appName,
          message: AppStrings.noInternetForAudio,
          backgroundColor: Colors.white,
          textColor: AppColors.tealColor,
          durationWithMilliSeconds: 2000,
        );
        emit(MainStartSurahAudioErrorState());
      }
    });
  }

  void stopSurahAudio(
    AudioPlayer audioPlayer,
  ) {
    emit(MainStopSurahAudioLoadingState());
    audioPlayer.pause();
    emit(MainStopSurahAudioSuccessState());
  }

  Future<Either<Failure, SurahAudio>> callSurahAudio({
    required int surahIndex,
  }) async {
    return await getSurahAudioUseCase.execute(surahIndex: surahIndex);
  }

  Future<void> getAzkar({
    bool fromAzkarScreen = false,
  }) async {
    // print(isAzkarDownloaded);
    if (fromAzkarScreen) {
      emit(MainGetAzkarLoadingState());
    }
    if (!isAzkarDownloaded) {
      CheckConnection.checkConnection().then((value) async {
        internetConnection = value;
        if (value) {
          await callAzkar().then((azkarValue) {
            azkarValue.fold((l) {
              emit(MainGetAzkarErrorState());
            }, (r) {
              azkar = r;
            });
          }).then((value) {
            HiveHelper.putInAzkar(model: azkar!);
            HiveHelper.putIsAzkarDownloaded(isAzkarDownloadedValue: true);
            isAzkarDownloaded = true;
            if (fromAzkarScreen) {
              emit(MainGetAzkarSuccessState());
            }
          });
        }
      });
    }
  }

  Future<Either<Failure, AzkarEntity>> callAzkar() async {
    return await getAzkarUseCase.execute();
  }

  Future<void> getRadio() async {
    // emit(MainGetRadioLoadingState());
    CheckConnection.checkConnection().then((value) async {
      internetConnection = value;
      if (value) {
        await callRadio().then((value) {
          value.fold((l) {
            emit(MainGetRadioErrorState());
          }, (r) {
            radioModel = r;
            // emit(MainGetRadioSuccessState());
          });
        }).catchError((error) {
          emit(MainGetRadioErrorState());
        });
      } /* else {
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
    Components.showToast(
      msg: AppStrings.addedToBookmarks,
      fontSize: AppFontSize.s15,
      textColor: AppColors.tealColor,
      color: Colors.white,
    );
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

  void clearBookmarks() {
    emit(MainRemoveBookmarkLoadingState());
    bookmarks.clear();
    HiveHelper.putInBookmarksList(model: bookmarks);
    emit(MainRemoveBookmarkSuccessState());
  }

  bool taspehCount({required int counter}) {
    emit(MainTaspehLoadingState());
    counter++;
    if (counter == 34) {
      emit(MainTaspehSuccessState());
      return true;
    } else {
      emit(MainTaspehSuccessState());
      return false;
    }
  }



}
