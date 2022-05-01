import 'package:dev_guide/src/domain/bloc/category/category_cubit.dart';
import 'package:dev_guide/src/domain/bloc/courses/courses_cubit.dart';
import 'package:dev_guide/src/domain/bloc/login/login_bloc.dart';
import 'package:dev_guide/src/domain/bloc/signUp/sign_up_bloc.dart';
import 'package:dev_guide/src/domain/bloc/sliders/sliders_cubit.dart';
import 'package:dev_guide/src/domain/bloc/sub_category/sub_category_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';

import 'package:dev_guide/src/domain/bloc/app/app_cubit.dart';


class ListOfProviders {
  static List<BlocProviderSingleChildWidget> providers = [
    BlocProvider<AppCubit>(create: (BuildContext context) => AppCubit()),
    BlocProvider<SignUpBloc>(create: (BuildContext context) => SignUpBloc()),
    BlocProvider<LoginBloc>(create: (BuildContext context) => LoginBloc()),
    BlocProvider<SlidersCubit>(create: (BuildContext context) => SlidersCubit()),
    BlocProvider<CategoryCubit>(create: (BuildContext context) => CategoryCubit()),
    BlocProvider<SubCategoryCubit>(create: (BuildContext context) => SubCategoryCubit()),
    BlocProvider<CoursesCubit>(create: (BuildContext context) => CoursesCubit()),
  ];
}
