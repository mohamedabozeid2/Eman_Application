import 'package:eman_application/features/data/data_sources/eman_data_source.dart';
import 'package:eman_application/features/domain/repositories/base_eman_repository.dart';

class EmanRepository extends BaseEmanRepository{
  final BaseEmanRemoteDataSource baseEmanRemoteDataSource;

  EmanRepository(this.baseEmanRemoteDataSource);
}