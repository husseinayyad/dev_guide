import 'package:dev_guide/src/core/appLocalizations.dart';
import 'package:dev_guide/src/core/responsiveUi.dart';
import 'package:dev_guide/src/core/routesName.dart';
import 'package:dev_guide/src/domain/bloc/app/app_cubit.dart';
import 'package:dev_guide/src/domain/model/category.dart';
import 'package:dev_guide/src/presentation/resources/colorManager.dart';
import 'package:dev_guide/src/presentation/resources/fontManager.dart';
import 'package:dev_guide/src/presentation/resources/stylesManager.dart';
import 'package:dev_guide/src/presentation/resources/valuesManager.dart';
import 'package:dev_guide/src/presentation/widgets/back_icon.dart';
import 'package:dev_guide/src/presentation/widgets/image_view.dart';
import 'package:flutter/material.dart';

class SubCategoryPage extends StatefulWidget {
  const SubCategoryPage({Key? key, required this.category}) : super(key: key);
  final Category category;

  @override
  _SubCategoryPageState createState() => _SubCategoryPageState();
}

class _SubCategoryPageState extends State<SubCategoryPage> {
  late double _width, _pixelRatio;

  late bool _xlarge;
  late ThemeData _theme;
  final List<Map> _subCategoryDemoData = [
    {
      "name": "Front End",
      "image":
          "https://cdn.icon-icons.com/icons2/2110/PNG/512/development_icon_131032.png",
      "state": ""
    },
    {
      "name": "Back End",
      "image":
          "https://cdn.icon-icons.com/icons2/1859/PNG/512/codinghtml_117947.png",
      "state": ""
    },
    {
      "name": "React Js",
      "image":
          "https://cdn.icon-icons.com/icons2/664/PNG/512/construction_project_plan_building_architect_design_develop-62_icon-icons.com_60212.png",
      "state": ""
    },
    {
      "name": "Flutter",
      "image":
          "https://cdn.icon-icons.com/icons2/1153/PNG/512/1486564180-finance-financial-report_81493.png",
      "state": ""
    },
    {
      "name": "IOS",
      "image":
          "https://cdn.icon-icons.com/icons2/1881/PNG/512/iconfinder-social-media-work-4341270_120574.png",
      "state": "Upcoming"
    },
    {
      "name": "Data Base",
      "image":
          "https://cdn.icon-icons.com/icons2/1537/PNG/512/1562687-code-computer-creative-html-process-technology-web-development_107058.png",
      "state": "Upcoming"
    },
    {
      "name": "Android",
      "image":
          "https://cdn.icon-icons.com/icons2/1461/PNG/512/2998131-camera-photo-photography_99870.png",
      "state": "Upcoming"
    }
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
                    widget.category.name!,
                    style: _theme.textTheme.headline5,
                  ),
                ),
              ],
            ),
            _subCategoryView()
          ],
        ),
      ),
    );
  }

  Widget _subCategoryView() {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) =>
            _subCategoryItemView(_subCategoryDemoData[index]),
        itemCount: _subCategoryDemoData.length,
      ),
    );
  }

  Widget _subCategoryItemView(
    Map subCategoryDemoData,
  ) {
    return InkWell(
      onTap: () {
        if (subCategoryDemoData["state"].toString().isEmpty) {
          Navigator.pushNamed(context, RoutesName.courses,
              arguments: {"subCategory": subCategoryDemoData});
        }
      },
      child: ListTile(
        leading: ImageView(
          url: subCategoryDemoData["image"],
          width: AppSize.s28,
          height: AppSize.s28,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                child: Text(
              subCategoryDemoData["name"],
              style: _theme.textTheme.labelMedium,
            )),
            const SizedBox(
              width: AppSize.s8,
            ),
            Text(
              subCategoryDemoData["state"],
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
