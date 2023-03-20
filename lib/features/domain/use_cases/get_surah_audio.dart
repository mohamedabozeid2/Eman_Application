import 'package:dartz/dartz.dart';
import 'package:eman_application/core/error/failure.dart';
import 'package:eman_application/features/domain/entities/surah_audio.dart';

import '../repositories/base_eman_repository.dart';

class GetSurahAudioUseCase {
  final BaseEmanRepository baseEmanRepository;

  GetSurahAudioUseCase(this.baseEmanRepository);

  Future<Either<Failure, SurahAudio>> execute({
  required int surahIndex,
}) async {
    return await baseEmanRepository.getSurahAudio(surahIndex: surahIndex);
  }
}
