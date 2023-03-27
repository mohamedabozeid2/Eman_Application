import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:eman_application/core/utils/assets_manager.dart';
import 'package:eman_application/core/utils/colors.dart';
import 'package:eman_application/core/utils/components.dart';
import 'package:eman_application/core/utils/constants.dart';
import 'package:eman_application/core/utils/strings.dart';
import 'package:eman_application/core/widgets/adaptive_indicator.dart';
import 'package:eman_application/features/presentation/controller/main_cubit/main_cubit.dart';
import 'package:eman_application/features/presentation/controller/main_cubit/main_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/app_values.dart';
import '../../../../core/utils/helper.dart';
import '../../../domain/entities/surah_model.dart';

class SurahScreen extends StatefulWidget {
  final Surah surah;

  // final bool fromLastRead;
  final double jumpToPosition;

  const SurahScreen({
    Key? key,
    required this.surah,
    // this.fromLastRead = false,
    this.jumpToPosition = 0.0,
  }) : super(key: key);

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  final ArabicNumbers arabicNumber = ArabicNumbers();
  final ScrollController scrollController = ScrollController();
  String surahContent = "";
  bool isSurahAudioPlaying = false;
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  void initState() {
    MainCubit.get(context).surahAudioUrl = null;
    for (int i = 0; i < widget.surah.ayahs.length; i++) {
      surahContent += "${widget.surah.ayahs[i].text} ";
      surahContent +=
          "\u06DD${arabicNumber.convert(widget.surah.ayahs[i].numberInSurah)}";
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      scrollController.jumpTo(widget.jumpToPosition);
      scrollController.position.isScrollingNotifier.addListener(() {
        MainCubit.get(context).saveLastRead(
          scrollController: scrollController,
          surah: widget.surah,
        );
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
            MainCubit.get(context).addToBookmark(
              scrollController: scrollController,
              surah: widget.surah,
            );
          },
          child: Image.asset(
            AssetsManager.bookmarks,
            fit: BoxFit.contain,
          ),
        ),
      ),
      appBar: AppBar(
        toolbarHeight: Helper.maxHeight * 0.15,
        title: Text(
          widget.surah.name,
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white, size: AppFontSize.s34),
        actions: [
          GestureDetector(
            onTap: () {
              if (isSurahAudioPlaying) {
                audioPlayer.pause();
                isSurahAudioPlaying = false;
              } else {
                Components.showToast(
                  msg: AppStrings.noThingToPause,
                  fontSize: AppFontSize.s15,
                  textColor: AppColors.tealColor,
                  color: Colors.white,
                );
              }
            },
            child: Icon(
              Icons.stop,
              color: Colors.white,
              size: AppFontSize.s34,
            ),
          ),
          BlocConsumer<MainCubit, MainStates>(
            buildWhen: (previous, current) =>
                current is MainGetSurahAudioLoadingState ||
                current is MainGetSurahAudioSuccessState ||
                current is MainGetSurahAudioErrorState,
            listener: (context, state) {
              if (state is MainGetSurahAudioSuccessState) {
                audioPlayer.setAudioSource(AudioSource.uri(
                    Uri.parse(MainCubit.get(context).surahAudioUrl!)));
                audioPlayer.play();
              }
            },
            builder: (context, state) {
              return GestureDetector(
                onTap: () {
                  if (!isSurahAudioPlaying && internetConnection) {
                      isSurahAudioPlaying = true;
                    MainCubit.get(context)
                        .getSurahAudio(surahIndex: widget.surah.number);
                  } else {
                    Components.showToast(
                      msg: AppStrings.audioIsAlreadyPlaying,
                      fontSize: AppFontSize.s15,
                      textColor: AppColors.tealColor,
                      color: Colors.white,
                    );
                  }
                },
                child: state is MainGetSurahAudioLoadingState
                    ? Center(
                        child: AdaptiveIndicator(
                          os: Components.getOS(),
                          color: Colors.white,
                        ),
                      )
                    : CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Icon(
                          Icons.play_arrow_rounded,
                          color: Colors.white,
                          size: AppFontSize.s34,
                        ),
                      ),
              );
            },
          )
        ],
      ),
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
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
                        .bodyLarge!
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
