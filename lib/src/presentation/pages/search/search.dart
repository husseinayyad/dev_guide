import 'package:dev_guide/src/core/appLocalizations.dart';
import 'package:dev_guide/src/core/responsiveUi.dart';
import 'package:dev_guide/src/core/routesName.dart';
import 'package:dev_guide/src/domain/bloc/app/app_cubit.dart';

import 'package:dev_guide/src/domain/bloc/search/search_cubit.dart';
import 'package:dev_guide/src/domain/model/course.dart';
import 'package:dev_guide/src/presentation/resources/assetsManager.dart';
import 'package:dev_guide/src/presentation/resources/colorManager.dart';
import 'package:dev_guide/src/presentation/resources/stylesManager.dart';
import 'package:dev_guide/src/presentation/resources/valuesManager.dart';
import 'package:dev_guide/src/presentation/widgets/error_fetch_data.dart';
import 'package:dev_guide/src/presentation/widgets/image_view.dart';
import 'package:dev_guide/src/presentation/widgets/no_results_found.dart';
import 'package:dev_guide/src/presentation/widgets/roundedInputField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late bool _isDarkMode;
  late double _width, _pixelRatio;

  late bool _xlarge;
  late ThemeData _theme;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _isDarkMode = AppCubit.getThemeType == "dark";
    _width = MediaQuery.of(context).size.width;

    _pixelRatio = MediaQuery.of(context).devicePixelRatio;

    _xlarge = ResponsiveWidget.isScreenXLarge(_width, _pixelRatio);
    _theme = Theme.of(context);
    return Scaffold(
      body: Column(children: [
        _search(),
        const SizedBox(
          height: AppSize.s12,
        ),
        _coursesView()
      ]),
    );
  }

  Widget _search() {
    return RoundedInputField(
        hintText: AppLocalizations.of(context)!.translate("search"),
        textInputAction: TextInputAction.search,
        onFieldSubmitted: (name) {
          // get data from server
          BlocProvider.of<SearchCubit>(context).getCoursesByName(name);
        },
        icon: Icons.search);
  }

  Widget _coursesView() {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is SearchError) {
          return const Padding(
            padding: EdgeInsets.only(top: AppPadding.p60),
            child: ErrorFetchData(),
          );
        }
        if (state is SearchLoaded) {
          if (state.courses.isEmpty) {
            return Padding(
              padding: const EdgeInsets.only(top: AppPadding.p60),
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

  Widget _courseItemView(
    Course course,
  ) {
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
}
