abstract class MainStates{}

class MainInitialState extends MainStates{}

class MainGetQuranLoadingState extends MainStates{}
class MainGetQuranSuccessState extends MainStates{}
class MainGetQuranErrorState extends MainStates{}

class MainGetSurahAudioLoadingState extends MainStates{}
class MainGetSurahAudioSuccessState extends MainStates{}
class MainGetSurahAudioErrorState extends MainStates{}

class MainRemoveBookmarkLoadingState extends MainStates{}
class MainRemoveBookmarkSuccessState extends MainStates{}
class MainRemoveBookmarkErrorState extends MainStates{}

class MainGetRadioLoadingState extends MainStates{}
class MainGetRadioSuccessState extends MainStates{}
class MainGetRadioErrorState extends MainStates{}

class AddToLastReadSuccessState extends MainStates{}
class AddToBookmarksSuccessState extends MainStates{}