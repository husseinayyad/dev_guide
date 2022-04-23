import 'package:dev_guide/src/domain/bloc/login/login_bloc.dart';
import 'package:dev_guide/src/domain/bloc/signUp/sign_up_bloc.dart';
import 'package:dev_guide/src/domain/bloc/sliders/slidersCubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';

import 'package:dev_guide/src/domain/bloc/app/app_cubit.dart';


class ListOfProviders {
  static List<BlocProviderSingleChildWidget> providers = [
    BlocProvider<AppCubit>(create: (BuildContext context) => AppCubit()),
    BlocProvider<SignUpBloc>(create: (BuildContext context) => SignUpBloc()),
    BlocProvider<LoginBloc>(create: (BuildContext context) => LoginBloc()),
    BlocProvider<SlidersCubit>(create: (BuildContext context) => SlidersCubit()),
  ];
}
