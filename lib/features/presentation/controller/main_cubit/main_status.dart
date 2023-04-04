abstract class MainStates {}

class MainInitialState extends MainStates {}

class MainGetAllDataLoadingState extends MainStates {}

class MainGetAllDataSuccessState extends MainStates {}

class MainGetAllDataErrorState extends MainStates {
  final String error;

  MainGetAllDataErrorState(this.error);
}

class MainGetQuranLoadingState extends MainStates {}

class MainGetQuranSuccessState extends MainStates {}

class MainGetQuranErrorState extends MainStates {}

class MainGetSurahAudioLoadingState extends MainStates {}

class MainGetSurahAudioSuccessState extends MainStates {}

class MainGetSurahAudioErrorState extends MainStates {}

class MainStartSurahAudioLoadingState extends MainStates{}
class MainStartSurahAudioSuccessState extends MainStates{}
class MainStartSurahAudioErrorState extends MainStates{}

class MainStopSurahAudioLoadingState extends MainStates{}
class MainStopSurahAudioSuccessState extends MainStates{}

class MainRemoveBookmarkLoadingState extends MainStates {}

class MainRemoveBookmarkSuccessState extends MainStates {}

class MainRemoveBookmarkErrorState extends MainStates {}

class MainGetRadioLoadingState extends MainStates {}

class MainGetRadioSuccessState extends MainStates {}

class MainGetRadioErrorState extends MainStates {}

class AddToLastReadSuccessState extends MainStates {}

class AddToBookmarksSuccessState extends MainStates {}

class MainGetAzkarLoadingState extends MainStates{}
class MainGetAzkarSuccessState extends MainStates{}
class MainGetAzkarErrorState extends MainStates{}

class MainTaspehLoadingState extends MainStates{}
class MainTaspehSuccessState extends MainStates{}
class MainTaspehErrorState extends MainStates{}
