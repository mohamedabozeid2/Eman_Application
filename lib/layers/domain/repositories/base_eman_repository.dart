import 'package:dartz/dartz.dart';
import 'package:eman_application/core/error/failure.dart';

import '../entities/azkar.dart';
import '../entities/quran_model.dart';
import '../entities/radio.dart';
import '../entities/surah_audio.dart';

abstract class BaseEmanRepository {
  Future<Either<Failure, Quran>> getQuran();

  Future<Either<Failure, SurahAudio>> getSurahAudio({
    required int surahIndex,
  });

  Future<Either<Failure, RadioEntity>> getRadio();

  Future<Either<Failure, AzkarEntity>> getAzkar();
}
