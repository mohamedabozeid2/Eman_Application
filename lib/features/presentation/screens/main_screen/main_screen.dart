import 'package:eman_application/core/utils/colors.dart';
import 'package:eman_application/core/utils/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/adaptive_indicator.dart';
import '../../controller/main_cubit/main_cubit.dart';
import '../../controller/main_cubit/main_status.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
      buildWhen: (previous, current) =>
          current is MainGetQuranLoadingState ||
          current is MainGetQuranSuccessState,
      listener: (context, state) {},
      builder: (context, state) {
        return state is MainGetQuranLoadingState
            ? Center(
              child: AdaptiveIndicator(
                  os: Components.getOS(),
                  color: AppColors.mainColor,
                ),
            )
            : Column(
                children: [
                  Text('TEST'),
                ],
              );
      },
    );
  }
}
