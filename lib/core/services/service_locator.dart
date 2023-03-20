import 'package:eman_application/features/data/data_sources/eman_data_source.dart';
import 'package:eman_application/features/domain/repositories/base_eman_repository.dart';
import 'package:eman_application/features/domain/use_cases/get_quran.dart';
import 'package:eman_application/features/domain/use_cases/get_surah_audio.dart';
import 'package:eman_application/features/presentation/controller/main_cubit/main_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../features/data/repositories/eman_repository.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    // Cubit
    sl.registerLazySingleton(() => MainCubit(
          sl(),
          sl(),
        ));
    // Use Cases
    sl.registerLazySingleton(() => GetQuranUseCase(sl()));
    sl.registerLazySingleton(() => GetSurahAudioUseCase(sl()));
    // Repositories
    sl.registerLazySingleton<BaseEmanRepository>(() => EmanRepository(sl()));

    //Data Source
    sl.registerLazySingleton<BaseEmanRemoteDataSource>(
        () => EmanRemoteDataSource());
  }
}
