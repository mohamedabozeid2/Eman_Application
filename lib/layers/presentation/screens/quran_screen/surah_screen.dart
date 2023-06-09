import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:eman_application/core/utils/assets_manager.dart';
import 'package:eman_application/core/utils/colors.dart';
import 'package:eman_application/core/utils/components.dart';
import 'package:eman_application/core/widgets/adaptive_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/app_values.dart';
import '../../../../core/utils/helper.dart';
import '../../../domain/entities/surah_model.dart';
import '../../controller/main_cubit/main_cubit.dart';
import '../../controller/main_cubit/main_status.dart';

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
  Color audioPlayerColor = Colors.red;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
      //
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
      key: _scaffoldKey,
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
        toolbarHeight: Helper.maxHeight * 0.1,
        title: Row(
          children: [
            Expanded(
              child: Text(
                widget.surah.name,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.white),
              ),
            ),
            BlocConsumer<MainCubit, MainStates>(
              buildWhen: (previous, current) =>
              current is MainStopSurahAudioSuccessState,
              listener: (context, state) {
                if (state is MainStopSurahAudioSuccessState) {
                  isSurahAudioPlaying = false;
                  audioPlayerColor = Colors.red;
                  setState(() {});
                }
              },
              builder: (context, state) {
                return state is MainStopSurahAudioLoadingState
                    ? Center(
                  child: AdaptiveIndicator(
                    os: Components.getOS(),
                    color: Colors.white,
                  ),
                )
                    : GestureDetector(
                  onTap: () {
                    if (isSurahAudioPlaying) {
                      MainCubit.get(context).stopSurahAudio(
                        audioPlayer,
                      );
                    }
                  },
                  child: Icon(
                    Icons.stop,
                    color: isSurahAudioPlaying
                        ? Colors.white
                        : audioPlayerColor,
                    size: AppFontSize.s34,
                  ),
                );
              },
            ),
            BlocConsumer<MainCubit, MainStates>(
              buildWhen: (previous, current) =>
              current is MainGetSurahAudioLoadingState ||
                  current is MainGetSurahAudioSuccessState ||
                  current is MainGetSurahAudioErrorState ||
                  current is MainStartSurahAudioLoadingState ||
                  current is MainStartSurahAudioSuccessState ||
                  current is MainStartSurahAudioErrorState,
              listener: (context, state) {
                if (state is MainGetSurahAudioSuccessState) {
                  audioPlayer.setAudioSource(AudioSource.uri(
                      Uri.parse(MainCubit.get(context).surahAudioUrl!)));
                  audioPlayer.play();
                  isSurahAudioPlaying = true;
                  audioPlayerColor = AppColors.mainColor;
                  setState(() {});
                } else if (state is MainStartSurahAudioSuccessState) {
                  isSurahAudioPlaying = true;
                  audioPlayerColor = AppColors.mainColor;
                  audioPlayer.play();
                  setState(() {});
                }
              },
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    if (!isSurahAudioPlaying) {
                      if (MainCubit.get(context).surahAudioUrl == null) {
                        MainCubit.get(context)
                            .getSurahAudio(surahIndex: widget.surah.number);
                      } else if (MainCubit.get(context).surahAudioUrl != null) {
                        MainCubit.get(context).startSurahAudio(audioPlayer);
                      }
                    }
                  },
                  child: state is MainGetSurahAudioLoadingState ||
                      state is MainStartSurahAudioLoadingState
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
                      color: isSurahAudioPlaying
                          ? audioPlayerColor
                          : Colors.white,
                      size: AppFontSize.s34,
                    ),
                  ),
                );
              },
            )
          ],
        ),
        iconTheme: IconThemeData(color: Colors.white, size: AppFontSize.s34),
        actions: [

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
