import 'package:dartz/dartz.dart';
import 'package:eman_application/core/error/failure.dart';
import 'package:eman_application/features/domain/repositories/base_eman_repository.dart';

import '../entities/radio.dart';

class GetRadioUseCase {
  final BaseEmanRepository baseEmanRepository;

  GetRadioUseCase(this.baseEmanRepository);

  Future<Either<Failure, RadioEntity>> execute() async {
    return await baseEmanRepository.getRadio();
  }
}
