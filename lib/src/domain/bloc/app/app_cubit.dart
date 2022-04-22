

import 'package:bloc/bloc.dart';
import 'package:dev_guide/src/core/preference.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static  Locale _appLocale = const Locale('en');
  static String getThemeType = "light";
  Locale get appLocal => _appLocale ;
  Future<void> fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('language_code') == null) {
      _appLocale = const Locale('en');
      return;
    }
    _appLocale = Locale(prefs.getString('language_code')!);
    if (kDebugMode) {
      print(appLocal.countryCode);
    }
    return;
  }
  Future<bool> isDarkMood() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("theme")=="dark"?true:false;
  }

  Future<void> checkTheme() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ThemeData theme;
    String getTheme = (prefs.getString(
        "theme") ?? "light");

    if(getTheme == "light"){


      setTheme( "light");
    }else{

      setTheme( "dark");
    }
    return;


  }

  void setTheme( String themeType)async {

    getThemeType=themeType;
    Preference.load().then((prefs) {

      prefs!.setString("theme", themeType);
    });


    emit(ChangeTheme());

  }
  void changeLanguage(Locale type) async {
    var prefs = await SharedPreferences.getInstance();
    if (_appLocale == type) {
      return;
    }
    if (type == const Locale("ar")) {
      _appLocale = const Locale("ar");
      await prefs.setString('language_code', 'ar');
      await prefs.setString('countryCode', '');
    } else {
      _appLocale = const Locale("en");
      await prefs.setString('language_code', 'en');
      await prefs.setString('countryCode', 'US');
    }
    emit(ChangeLanguage());
  }
}
