import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';

import 'package:dev_guide/src/domain/bloc/app/app_cubit.dart';


class ListOfProviders {
  static List<BlocProviderSingleChildWidget> providers = [
    BlocProvider<AppCubit>(create: (BuildContext context) => AppCubit()),

  ];
}
