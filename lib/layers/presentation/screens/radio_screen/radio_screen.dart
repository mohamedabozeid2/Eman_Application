import 'package:eman_application/core/utils/app_values.dart';
import 'package:eman_application/core/utils/assets_manager.dart';
import 'package:eman_application/core/utils/colors.dart';
import 'package:eman_application/core/utils/components.dart';
import 'package:eman_application/core/utils/constants.dart';
import 'package:eman_application/core/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/helper.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({Key? key}) : super(key: key);

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isRadioPlaying = false;

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Helper.maxHeight * 0.1,
        title: const Text(
          AppStrings.radio,
        ),
      ),
      body: Column(
        children: [
          const Image(image: AssetImage(AssetsManager.radio)),
          SizedBox(
            height: AppSize.s30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  if (radioModel != null) {
                    if (!isRadioPlaying) {
                      audioPlayer.setAudioSource(
                          AudioSource.uri(Uri.parse(radioModel!.url)));
                      audioPlayer.play();
                      isRadioPlaying = true;
                    } else {
                      Components.showToast(
                        msg: AppStrings.radioIsAlreadyPlaying,
                        fontSize: AppFontSize.s15,
                        textColor: AppColors.tealColor,
                        color: Colors.white,
                      );
                    }
                  } else {
                    Components.showSnackBar(
                      title: AppStrings.appName,
                      message: AppStrings.radioIsNotAvailable,
                      backgroundColor: Colors.white,
                      textColor: AppColors.tealColor,
                    );
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(AppSize.s10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.mainColor,
                        AppColors.tealColor,
                      ],
                      stops: const [
                        0.3,
                        1.0,
                      ],
                    ),
                  ),
                  child: Icon(
                    Icons.play_arrow_rounded,
                    color: Colors.white,
                    size: AppFontSize.s34,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (isRadioPlaying) {
                    audioPlayer.pause();
                    isRadioPlaying = false;
                  } else {
                    Components.showToast(
                      msg: AppStrings.noThingToPause,
                      fontSize: AppFontSize.s15,
                      textColor: AppColors.tealColor,
                      color: Colors.white,
                    );
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(AppSize.s10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.redErrorColor,
                        AppColors.tealColor,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [
                        0.3,
                        1.0,
                      ],
                    ),
                  ),
                  child: Icon(
                    Icons.pause,
                    color: Colors.white,
                    size: AppFontSize.s34,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
