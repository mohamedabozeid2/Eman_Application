
import 'package:get_it/get_it.dart';

import '../../layers/data/data_sources/eman_data_source.dart';
import '../../layers/data/repositories/eman_repository.dart';
import '../../layers/domain/repositories/base_eman_repository.dart';
import '../../layers/domain/use_cases/get_azkar.dart';
import '../../layers/domain/use_cases/get_quran.dart';
import '../../layers/domain/use_cases/get_radio.dart';
import '../../layers/domain/use_cases/get_surah_audio.dart';
import '../../layers/presentation/controller/main_cubit/main_cubit.dart';


final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    // Cubit
    sl.registerLazySingleton(() => MainCubit(
          sl(),
          sl(),
          sl(),
          sl(),
        ));
    // Use Cases
    sl.registerLazySingleton(() => GetQuranUseCase(sl()));
    sl.registerLazySingleton(() => GetSurahAudioUseCase(sl()));
    sl.registerLazySingleton(() => GetRadioUseCase(sl()));
    sl.registerLazySingleton(() => GetAzkarUseCase(sl()));
    // Repositories
    sl.registerLazySingleton<BaseEmanRepository>(() => EmanRepository(sl()));

    //Data Source
    sl.registerLazySingleton<BaseEmanRemoteDataSource>(
        () => EmanRemoteDataSource());
  }
}
