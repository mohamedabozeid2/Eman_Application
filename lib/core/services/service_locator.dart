import 'package:eman_application/features/presentation/controller/main_cubit/main_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    // Cubit
      sl.registerLazySingleton(() => MainCubit());
    // Use Cases

    // Repositories

    //Data Source
  }
}
