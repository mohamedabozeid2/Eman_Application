import 'package:dartz/dartz.dart';
import 'package:eman_application/core/error/exception.dart';
import 'package:eman_application/core/error/failure.dart';
import 'package:eman_application/features/data/data_sources/eman_data_source.dart';
import 'package:eman_application/features/domain/entities/quran_model.dart';
import 'package:eman_application/features/domain/entities/surah_audio.dart';
import 'package:eman_application/features/domain/repositories/base_eman_repository.dart';

class EmanRepository extends BaseEmanRepository {
  final BaseEmanRemoteDataSource baseEmanRemoteDataSource;

  EmanRepository(this.baseEmanRemoteDataSource);

  @override
  Future<Either<Failure, Quran>> getQuran() async {
    try {
      final result = await baseEmanRemoteDataSource.getQuran();
      return Right(result);
    } on EmanServerException catch (failure) {
      return Left(
        ServerFailure(failure.emanErrorMessageModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, SurahAudio>> getSurahAudio(
      {required int surahIndex}) async {
    try {
      final result =
          await baseEmanRemoteDataSource.getSurahAudio(surahIndex: surahIndex);
      return Right(result);
    } on EmanServerException catch (failure) {
      return Left(
        ServerFailure(
          failure.emanErrorMessageModel.statusMessage,
        ),
      );
    }
  }
}
