import 'package:eman_application/core/api/audio_dio_helper.dart';
import 'package:eman_application/core/api/eman_dio_helper.dart';
import 'package:eman_application/core/api/end_points.dart';
import 'package:eman_application/core/api/radio_dio_helper.dart';
import 'package:eman_application/core/error/exception.dart';
import 'package:eman_application/core/network/eman_error_message_model.dart';

import '../../../core/api/azkar_dio_helper.dart';
import '../models/azkar_model.dart';
import '../models/quran_model.dart';
import '../models/radio_model.dart';
import '../models/surah_audio_model.dart';

abstract class BaseEmanRemoteDataSource {
  Future<QuranModel> getQuran();

  Future<SurahAudioModel> getSurahAudio({
    required int surahIndex,
  });

  Future<RadioModel> getRadio();

  Future<AzkarModel> getAzkar();
}

class EmanRemoteDataSource extends BaseEmanRemoteDataSource {
  @override
  Future<QuranModel> getQuran() async {
    final response = await EmanDioHelper.getData(url: EndPoints.quran);
    if (response.statusCode == 200) {
      return QuranModel.fromJson(response.data);
    } else {
      throw EmanServerException(
        emanErrorMessageModel: EmanErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<SurahAudioModel> getSurahAudio({
    required int surahIndex,
  }) async {
    final response =
        await AudioDioHelper.getData(url: EndPoints.surahAudio, query: {
      "language": "en",
    });
    if (response.statusCode == 200) {
      return SurahAudioModel.fromJson(
          response.data['audio_files'][surahIndex - 1]);
    } else {
      throw EmanServerException(
        emanErrorMessageModel: EmanErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<RadioModel> getRadio() async {
    final response =
        await RadioDioHelper.getData(url: EndPoints.radios, query: {
      "language": "eng",
    });
    if (response.statusCode == 200) {
      return RadioModel.fromJson(response.data['radios'][1]);
    } else {
      throw EmanServerException(
        emanErrorMessageModel: EmanErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<AzkarModel> getAzkar() async {
    final response = await AzkarDioHelper.getData(url: EndPoints.azkar);
    if (response.statusCode == 200) {
      return AzkarModel.fromJson(response.data);
    } else {
      throw EmanServerException(
        emanErrorMessageModel: EmanErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
