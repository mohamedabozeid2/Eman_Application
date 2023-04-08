import 'package:dartz/dartz.dart';
import 'package:eman_application/core/error/failure.dart';

import '../entities/azkar.dart';
import '../repositories/base_eman_repository.dart';

class GetAzkarUseCase {
  final BaseEmanRepository baseEmanRepository;

  GetAzkarUseCase(
    this.baseEmanRepository,
  );

  Future<Either<Failure, AzkarEntity>> execute() async {
    return await baseEmanRepository.getAzkar();
  }
}
