import 'package:dartz/dartz.dart';
import 'package:eman_application/core/error/failure.dart';
import 'package:eman_application/features/domain/repositories/base_eman_repository.dart';

import '../entities/quran_model.dart';

class GetQuranUseCase {
  final BaseEmanRepository baseEmanRepository;

  GetQuranUseCase(this.baseEmanRepository);

  Future<Either<Failure, Quran>> execute() async {
    return await baseEmanRepository.getQuran();
  }
}
