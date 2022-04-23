import 'package:dev_guide/src/core/appLocalizations.dart';
import 'package:dev_guide/src/core/responsiveUi.dart';
import 'package:dev_guide/src/core/routesName.dart';
import 'package:dev_guide/src/domain/bloc/app/app_cubit.dart';
import 'package:dev_guide/src/presentation/resources/colorManager.dart';
import 'package:dev_guide/src/presentation/resources/fontManager.dart';
import 'package:dev_guide/src/presentation/resources/stylesManager.dart';
import 'package:dev_guide/src/presentation/resources/valuesManager.dart';
import 'package:dev_guide/src/presentation/widgets/backIcon.dart';
import 'package:dev_guide/src/presentation/widgets/imageView.dart';
import 'package:flutter/material.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({Key? key, required this.subCategory}) : super(key: key);
  final Map subCategory;

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
                    widget.subCategory["name"],
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
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) =>
            _courseItemView(_coursesDemoData[index]),
        itemCount: _coursesDemoData.length,
      ),
    );
  }

  Widget _courseItemView(
    Map coursesDemoData,
  ) {
    return InkWell(
      onTap: () {
        if (coursesDemoData["state"].toString().isEmpty) {
          Navigator.pushNamed(context, RoutesName.course, arguments: {
            "course": {
              "name": "Flutter",
              // "name":coursesDemoData["name"],
              "image": "https://i.ytimg.com/vi/x0uinJvhNxI/maxresdefault.jpg",
              "desc":
                  "Flutter is an open source framework by Google for building beautiful, natively compiled, multi-platform applications from a single codebase",
              "courses": [
                {
                  "name": "Build Native Mobile Apps with Flutter",
                  "link":
                      "https://www.udacity.com/course/build-native-mobile-apps-with-flutter--ud905",
                  "desc":
                      "In this course, you'll learn how to use Flutter to quickly develop high-quality, interactive mobile applications for iOS and Android devices. Whether you’re just getting started with mobile app development, or experienced with other mobile app frameworks, you’ll enjoy the high-velocity development and quality apps that Flutter enables",
                },
                {
                  "name":
                      "Flutter Crash Course for Beginners 2021 - Build a Flutter App with Google's Flutter & Dart",
                  "link": "https://www.youtube.com/watch?v=x0uinJvhNxI",
                  "desc":
                      "Free Flutter Introduction for Beginners: Get Started with Flutter and learn how to build an iOS and Android app with Flutter!"
                }
              ]
            }
          });
        }
      },
      child: ListTile(
        leading: ImageView(
          url: coursesDemoData["image"],
          width: AppSize.s28,
          height: AppSize.s28,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                child: Text(
              coursesDemoData["name"],
              style: _theme.textTheme.labelMedium,
            )),
            const SizedBox(
              width: AppSize.s8,
            ),
            Text(
              coursesDemoData["state"],
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
