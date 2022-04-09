import 'package:dev_guide/src/core/appLocalizations.dart';
import 'package:dev_guide/src/core/responsiveUi.dart';
import 'package:dev_guide/src/presentation/resources/colorManager.dart';
import 'package:dev_guide/src/presentation/resources/fontManager.dart';
import 'package:dev_guide/src/presentation/resources/stylesManager.dart';
import 'package:dev_guide/src/presentation/resources/valuesManager.dart';
import 'package:dev_guide/src/presentation/widgets/imageView.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> with AutomaticKeepAliveClientMixin {
  late double _width, _pixelRatio;

  late bool _xlarge;
  late ThemeData _theme;
  final List<Map> _categoryDemoData = [
    {"name": "Development", "image": "https://cdn.icon-icons.com/icons2/2110/PNG/512/development_icon_131032.png", "state": ""},
    {"name": "IT and Software", "image": "https://cdn.icon-icons.com/icons2/1859/PNG/512/codinghtml_117947.png", "state": ""},
    {"name": "Design", "image": "https://cdn.icon-icons.com/icons2/664/PNG/512/construction_project_plan_building_architect_design_develop-62_icon-icons.com_60212.png", "state": ""},
    {"name": "E-Business", "image": "https://cdn.icon-icons.com/icons2/1153/PNG/512/1486564180-finance-financial-report_81493.png", "state": ""},
    {"name": "Marketing", "image": "https://cdn.icon-icons.com/icons2/1881/PNG/512/iconfinder-social-media-work-4341270_120574.png", "state": "Upcoming"},
    {"name": "Development", "image": "https://cdn.icon-icons.com/icons2/1537/PNG/512/1562687-code-computer-creative-html-process-technology-web-development_107058.png", "state": "Upcoming"},
    {"name": "Photography and Video", "image": "https://cdn.icon-icons.com/icons2/1461/PNG/512/2998131-camera-photo-photography_99870.png", "state": "Upcoming"}
  ];

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;

    _pixelRatio = MediaQuery.of(context).devicePixelRatio;

    _xlarge = ResponsiveWidget.isScreenXLarge(_width, _pixelRatio);
    _theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppPadding.p12),
          child: Text(
            AppLocalizations.of(context)!.translate("category")!,
            style: _theme.textTheme.headline5,
          ),
        ),
        _categoryView()
      ],
    );
  }

  Widget _categoryView() {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) => _categoryItemView(
          image: _categoryDemoData[index]["image"],
          name: _categoryDemoData[index]["name"],
          state: _categoryDemoData[index]["state"],
        ),
        itemCount: _categoryDemoData.length,
      ),
    );
  }

  Widget _categoryItemView(
      {required String image, required String name, required String state}) {
    return ListTile(
      leading: ImageView(
        url: image,
        width: AppSize.s28,
        height: AppSize.s28,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(child: Text(name,style: _theme.textTheme.labelMedium,)),
          const SizedBox(width: AppSize.s8,),
          Text(state,style: getLightStyle(
            color: ColorManager.grey,

          ),),
        ],
      ),
      trailing: Icon(
        Icons.arrow_forward,
        color: ColorManager.black,
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
