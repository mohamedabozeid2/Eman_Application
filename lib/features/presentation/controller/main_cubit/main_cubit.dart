import 'package:eman_application/features/presentation/controller/main_cubit/main_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainCubit extends Cubit<MainStates>{
  MainCubit(): super(MainInitialState());

  static MainCubit get(context) => BlocProvider.of(context);


}