import 'package:dartz/dartz.dart';
import 'package:eman_application/core/error/failure.dart';
import 'package:eman_application/features/domain/entities/quran_model.dart';

abstract class BaseEmanRepository{
  Future<Either<Failure, Quran>> getQuran();
}