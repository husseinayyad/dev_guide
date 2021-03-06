import 'package:dev_guide/src/core/appLocalizations.dart';
import 'package:dev_guide/src/core/responsiveUi.dart';
import 'package:dev_guide/src/core/routesName.dart';
import 'package:dev_guide/src/domain/bloc/app/app_cubit.dart';
import 'package:dev_guide/src/domain/bloc/courses/courses_cubit.dart';
import 'package:dev_guide/src/domain/model/course.dart';
import 'package:dev_guide/src/domain/model/sub_category.dart';
import 'package:dev_guide/src/presentation/resources/colorManager.dart';
import 'package:dev_guide/src/presentation/resources/fontManager.dart';
import 'package:dev_guide/src/presentation/resources/stylesManager.dart';
import 'package:dev_guide/src/presentation/resources/valuesManager.dart';
import 'package:dev_guide/src/presentation/widgets/back_icon.dart';
import 'package:dev_guide/src/presentation/widgets/error_fetch_data.dart';
import 'package:dev_guide/src/presentation/widgets/image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({Key? key, required this.subCategory}) : super(key: key);
  final SubCategory subCategory;

  @override
  _CoursesPageState createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  late double _width, _pixelRatio;

  late bool _xlarge;
  late ThemeData _theme;
  final List<Map> _coursesDemoData = [
    {
      "name": "Html",
      "image":
          "https://cdn.icon-icons.com/icons2/2110/PNG/512/development_icon_131032.png",
      "state": ""
    },
    {
      "name": "CSS",
      "image":
          "https://cdn.icon-icons.com/icons2/1859/PNG/512/codinghtml_117947.png",
      "state": ""
    },
    {
      "name": "Vue Js",
      "image":
          "https://cdn.icon-icons.com/icons2/664/PNG/512/construction_project_plan_building_architect_design_develop-62_icon-icons.com_60212.png",
      "state": "Upcoming"
    },
  ];
  late bool _isDarkMode;
  @override
  void initState() {
    // get data from server
    BlocProvider.of<CoursesCubit>(context).getCourses(widget.subCategory.id!);
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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: AppSize.s16,
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(AppPadding.p8),
                  child: BackIcon(),
                ),
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p12),
                  child: Text(
                    widget.subCategory.name!,
                    style: _theme.textTheme.headline5,
                  ),
                ),
              ],
            ),
            _coursesView()
          ],
        ),
      ),
    );
  }

  Widget _coursesView() {
  return BlocBuilder<CoursesCubit, CoursesState>(
      builder: (context, state) {
        if (state is CoursesLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is CoursesError) {
          return const Padding(
            padding: EdgeInsets.only(top: AppPadding.p60),
            child: ErrorFetchData(),
          );
        }
        if (state is CoursesLoaded) {
          return Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) =>
                  _courseItemView(state.courses[index]),
              itemCount: state.courses.length,
            ),
          );
        } else {
          return const Text("");
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
          Navigator.pushNamed(context, RoutesName.course, arguments: {
            "course":course
          });
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
