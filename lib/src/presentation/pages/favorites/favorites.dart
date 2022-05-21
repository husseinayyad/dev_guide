import 'package:dev_guide/src/core/appLocalizations.dart';
import 'package:dev_guide/src/core/helper/valueHolder.dart';
import 'package:dev_guide/src/core/responsiveUi.dart';
import 'package:dev_guide/src/core/routesName.dart';
import 'package:dev_guide/src/domain/bloc/FavAction/fav_action_cubit.dart';
import 'package:dev_guide/src/domain/bloc/app/app_cubit.dart';
import 'package:dev_guide/src/domain/bloc/favorites/favorites_cubit.dart';

import 'package:dev_guide/src/domain/model/course.dart';
import 'package:dev_guide/src/presentation/pages/login/login.dart';
import 'package:dev_guide/src/presentation/resources/assetsManager.dart';
import 'package:dev_guide/src/presentation/resources/colorManager.dart';
import 'package:dev_guide/src/presentation/resources/stylesManager.dart';
import 'package:dev_guide/src/presentation/resources/valuesManager.dart';
import 'package:dev_guide/src/presentation/widgets/error_fetch_data.dart';
import 'package:dev_guide/src/presentation/widgets/image_view.dart';
import 'package:dev_guide/src/presentation/widgets/no_results_found.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage>     with AutomaticKeepAliveClientMixin {
  late bool _isDarkMode;
  late double _width, _pixelRatio;

  late bool _xlarge;
  late ThemeData _theme;

  @override
  void initState() {
    // get data from server
    BlocProvider.of<FavoritesCubit>(context)
        .getFavCourses(ValueHolder.userIdToVerify!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    _isDarkMode = AppCubit.getThemeType == "dark";
    _width = MediaQuery
        .of(context)
        .size
        .width;

    _pixelRatio = MediaQuery
        .of(context)
        .devicePixelRatio;

    _xlarge = ResponsiveWidget.isScreenXLarge(_width, _pixelRatio);
    _theme = Theme.of(context);
    return Scaffold(
      body: ValueHolder.userIdToVerify!.isEmpty?Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Center(
          child: Text(AppLocalizations.of(context)!.translate("loginToViewCourses")!
            , style: _theme.textTheme.headline3,
          textAlign: TextAlign.center,
          maxLines: 2,),
        ),
      ):Column(
        children:  [
           Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Text(
                  AppLocalizations.of(context)!.translate("favorites")!,
                  style: _theme.textTheme.headline3,
                ),
                const SizedBox(
                  width: AppSize.s8,
                ),
                const Icon(Icons.favorite)
              ],
            ),
          ),
          BlocBuilder<FavActionCubit, FavActionState>(
            builder: (context, state) {
              // get data from server
              BlocProvider.of<FavoritesCubit>(context)
                  .getFavCourses(ValueHolder.userIdToVerify!);
              return _coursesView();
            },
          ),
        ],
      ),
    );
  }

  Widget _coursesView() {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        if (state is FavoritesLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is FavoritesError) {
          return const Padding(
            padding: EdgeInsets.only(top: AppPadding.p60),
            child: ErrorFetchData(),
          );
        }
        if (state is FavoritesLoaded) {
          if (state.courses.isEmpty) {
            return Padding(
              padding: const EdgeInsets.only(top: AppSize.s130),
              child: NoResultsFound(
                  text:
                  AppLocalizations.of(context)!.translate("noResultFound")!,
                  icon: FontAwesomeIcons.sadCry),
            );
          }
          return Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) =>
                  _courseItemView(state.courses[index]),
              itemCount: state.courses.length,
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(top: AppPadding.p60),
            child: Image.asset(ImageAssets.searchLogo),
          );
        }
      },
    );
  }

  Widget _courseItemView(Course course,) {
    return InkWell(
      onTap: () {
        if (course.state!.trim().isEmpty) {
          Navigator.pushNamed(context, RoutesName.course,
              arguments: {"course": course});
        }
      },
      child: ListTile(
        leading: ImageView(
          url: course.image!,
          width: AppSize.s28,
          height: AppSize.s28,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                child: Text(
                  course.name!,
                  style: _theme.textTheme.labelMedium,
                )),
            const SizedBox(
              width: AppSize.s8,
            ),
            Text(
              course.state!,
              style: getLightStyle(
                color: ColorManager.grey,
              ),
            ),
          ],
        ),
        trailing: Icon(
          Icons.arrow_forward,
          color: _isDarkMode ? ColorManager.white : ColorManager.black,
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
