import 'package:dev_guide/src/core/appLocalizations.dart';
import 'package:dev_guide/src/core/constant.dart';
import 'package:dev_guide/src/core/preference.dart';
import 'package:dev_guide/src/core/responsiveUi.dart';
import 'package:dev_guide/src/domain/bloc/app/app_cubit.dart';
import 'package:dev_guide/src/presentation/resources/colorManager.dart';
import 'package:dev_guide/src/presentation/resources/valuesManager.dart';
import 'package:dev_guide/src/presentation/widgets/backIcon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  late double _width, _pixelRatio;

  late bool _xlarge;
  late ThemeData _theme;

  late AppCubit _appProvider;

  bool _switchThemeValue = false;

  @override
  void initState() {
    super.initState();
    _appProvider = BlocProvider.of<AppCubit>(context);
    Preference.load().then((value) {
      _getSettingsData();
    });
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;

    _pixelRatio = MediaQuery.of(context).devicePixelRatio;

    _xlarge = ResponsiveWidget.isScreenXLarge(_width, _pixelRatio);
    _theme = Theme.of(context);
    return Scaffold(
        backgroundColor: _theme.scaffoldBackgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: AppSize.s40,
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
                    "hussein",
                    style: _theme.textTheme.headline5,
                  ),
                ),
              ],
            ),
            _accountInfo(),
            _settings()
          ],
        ));
  }

  Widget _settings() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: AppSize.s40,
              ),
              Text(
                AppLocalizations.of(context)!.translate("settings")!,
                style: _theme.textTheme.headline5,
              ),
              _settingItem(AppLocalizations.of(context)!.translate("aboutUs")!),
              _settingItem(
                  AppLocalizations.of(context)!.translate("helpAndSupport")!),
              _settingThemes(),
              _settingLanguage(),
              _footer()
            ],
          ),
        ),
      ),
    );
  }

  Widget _accountInfo() {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: AppSize.s40,
          ),
          const CircleAvatar(
            radius: 40,
            child: Center(child: Text("H A")),
          ),
          const SizedBox(
            height: AppSize.s12,
          ),
          Text(
            "hussein ayyad",
            style: _theme.textTheme.headline3,
          ),
          const SizedBox(
            height: AppSize.s8,
          ),
          Text("husseinayyad70@gmail.com", style: _theme.textTheme.headline3),
          const SizedBox(
            height: AppSize.s12,
          ),
        ],
      ),
    );
  }

  Widget _settingLanguage() {
    return ListTile(
      title: const Text(
        "English",
      ),
      trailing: Transform.scale(
        scale: 0.9,
        child: Switch(
          onChanged: (bool value) async {
            if (value) {
              _appProvider.changeLanguage(const Locale("en"));
            } else {
              _appProvider.changeLanguage(const Locale("ar"));
            }
          },
          value: _appProvider.appLocal.languageCode == "en",
          activeColor: _theme.colorScheme.secondary,
        ),
      ),
    );
  }

  Widget _settingThemes() {
    return ListTile(
      title: Text(
        AppLocalizations.of(context)!.translate("darkTheme")!,
      ),
      trailing: Transform.scale(
        scale: 0.9,
        child: Switch(
          onChanged: (bool value) async {
            Preference.load().then((value) {});
            if (value) {
              setState(() {
                _switchThemeValue = value;
              });

              _appProvider.setTheme("dark");
            } else {
              setState(() {
                _switchThemeValue = value;
              });

              _appProvider.setTheme("light");
            }
          },
          value: _switchThemeValue,
          activeColor: _theme.colorScheme.secondary,
        ),
      ),
    );
  }

  _getSettingsData() async {
    String isDark = (Preference.getString("theme", def: "light"));

    setState(() {
      _switchThemeValue = isDark == "dark" ? true : false;
    });
  }

  Widget _settingItem(String title) {
    return ListTile(
      title: Text(
        title,
        //  style: _theme.textTheme.labelMedium,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: ColorManager.black,
      ),
    );
  }

  Widget _footer() {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: AppSize.s28,
          ),
          Text(
            AppLocalizations.of(context)!.translate("logout")!,
            style: _theme.textTheme.headline6,
          ),
          const SizedBox(
            height: AppSize.s28,
          ),
          Text(
            "DevGuid v1.0",
            style: _theme.textTheme.headline6,
          ),
        ],
      ),
    );
  }
}
