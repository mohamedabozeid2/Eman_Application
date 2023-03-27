import 'package:dartz/dartz.dart';
import 'package:eman_application/core/error/failure.dart';
import 'package:eman_application/features/domain/entities/azkar.dart';
import 'package:eman_application/features/domain/entities/quran_model.dart';
import 'package:eman_application/features/domain/entities/radio.dart';
import 'package:eman_application/features/domain/entities/surah_audio.dart';

abstract class BaseEmanRepository {
  Future<Either<Failure, Quran>> getQuran();

  Future<Either<Failure, SurahAudio>> getSurahAudio({
    required int surahIndex,
  });

  Future<Either<Failure, RadioEntity>> getRadio();

  Future<Either<Failure, AzkarEntity>> getAzkar();
}
