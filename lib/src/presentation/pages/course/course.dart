import 'package:dev_guide/src/core/appLocalizations.dart';
import 'package:dev_guide/src/core/helper/valueHolder.dart';
import 'package:dev_guide/src/core/responsiveUi.dart';
import 'package:dev_guide/src/core/routesName.dart';
import 'package:dev_guide/src/domain/bloc/FavAction/fav_action_cubit.dart';
import 'package:dev_guide/src/domain/bloc/app/app_cubit.dart';
import 'package:dev_guide/src/domain/model/course.dart';
import 'package:dev_guide/src/presentation/resources/colorManager.dart';
import 'package:dev_guide/src/presentation/resources/valuesManager.dart';
import 'package:dev_guide/src/presentation/widgets/back_icon.dart';
import 'package:dev_guide/src/presentation/widgets/image_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({Key? key, required this.course}) : super(key: key);
  final Course course;

  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  late double _width, _pixelRatio;

  late bool _xlarge;
  late ThemeData _theme;

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
        child: SingleChildScrollView(
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
                      widget.course.name!,
                      style: _theme.textTheme.headline5,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: AppSize.s28,
              ),
              _courseDetails()
            ],
          ),
        ),
      ),
    );
  }

  Widget _courseDetails() {
    return Column(
      children: [
        Center(
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            margin: const EdgeInsets.only(
                left: AppMargin.m40, right: AppMargin.m40),
            child: ImageView(
              url: widget.course.image!,
              height: AppSize.s120,
              width: _width,
            ),
          ),
        ),
        const SizedBox(
          height: AppSize.s28,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.translate("description")!,
                style: _theme.textTheme.headline3,
              ),
              if(ValueHolder.userIdToVerify!.isNotEmpty)
              BlocBuilder<FavActionCubit, FavActionState>(
                builder: (context, state) {
                  return InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      BlocProvider.of<FavActionCubit>(context)
                          .favAction(
                              !widget.course.favList!
                                  .contains(ValueHolder.userIdToVerify),
                              widget.course.id!,
                              widget.course.favList!)
                          .whenComplete(() {
                        Fluttertoast.showToast(
                            msg: widget.course.favList!
                                    .contains(ValueHolder.userIdToVerify)
                                ? AppLocalizations.of(context)!
                                    .translate("addedToFavorites")!
                                : AppLocalizations.of(context)!
                                    .translate("removedFromFavorites")!,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: _theme.primaryColor,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      });
                    },
                    child: state is FavActionLoading
                        ? const Center(
                            child: Padding(
                            padding: EdgeInsets.all(AppPadding.p8),
                            child: SizedBox(
                                height: AppSize.s20,
                                width: AppSize.s20,
                                child: CircularProgressIndicator()),
                          ))
                        : Icon(
                            widget.course.favList!
                                    .contains(ValueHolder.userIdToVerify)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: ColorManager.error,
                          ),
                  );
                },
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            widget.course.desc!,
            style: TextStyle(
                color: _isDarkMode ? ColorManager.white : ColorManager.black),
          ),
        ),
        _courses()
      ],
    );
  }

  Widget _courses() {
    List courses = widget.course.courses!;
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.translate("courses")!,
            style: _theme.textTheme.headline3,
          ),
          ListView.builder(
            itemBuilder: (context, index) => _courseView(courses[index]),
            itemCount: courses.length,
            shrinkWrap: true,
          )
        ],
      ),
    );
  }

  Widget _courseView(course) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RoutesName.webView,
            arguments: {"link": course["link"]});
      },
      child: Container(
        decoration: BoxDecoration(
            color: ColorManager.background,
            borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.all(AppPadding.p8),
        margin: const EdgeInsets.all(AppMargin.m8),
        child: ListTile(
          leading: Icon(
            Icons.video_collection,
            color: ColorManager.primary,
          ),
          title: Text(course["name"]),
          trailing: Text(
            AppLocalizations.of(context)!.translate("view")!,
            style: _theme.textTheme.headline3,
          ),
        ),
      ),
    );
  }
}
