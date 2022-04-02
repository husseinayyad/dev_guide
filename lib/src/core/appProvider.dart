// import 'package:bella/src/config/preference.dart';
// import 'package:bella/src/themes/theme.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class AppProvider extends ChangeNotifier {
//
//
//   static  Locale _appLocale = Locale('en');
//   static ThemeData theme = AppTheme.lightTheme;
//   Locale get appLocal => _appLocale ;
//   Future<void> fetchLocale() async {
//     var prefs = await SharedPreferences.getInstance();
//     if (prefs.getString('language_code') == null) {
//       _appLocale = Locale('en');
//       return;
//     }
//     _appLocale = Locale(prefs.getString('language_code')!);
//     print(appLocal.countryCode);
//     return;
//   }
//   Future<bool> isDarkMood() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString("theme")=="dark"?true:false;
//   }
//
// Future<void> checkTheme() async{
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     ThemeData theme;
//     String getTheme = (prefs.getString(
//         "theme") ?? "light")!;
//
//     if(getTheme == "light"){
//       theme = AppTheme.lightTheme;
//
//       setTheme(AppTheme.lightTheme, "light");
//     }else{
//       theme = AppTheme.darkTheme;
//
//       setTheme(AppTheme.darkTheme, "dark");
//     }
// return null;
//
//
//   }
//
//   void setTheme(ThemeData value, String themeType)async {
//
//   theme=value;
//   Preference.load().then((prefs) {
//
//   prefs!.setString("theme", themeType).then((val){
//       SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
//       SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//         statusBarColor: themeType == "dark" ? AppTheme.darkTheme.primaryColor : AppTheme.lightTheme.primaryColor,
//         statusBarIconBrightness: themeType == "dark" ? Brightness.light:Brightness.dark,
//       ));
//
//
//
//     });
//   });
//
//
//   notifyListeners();
//
//   }
//   void changeLanguage(Locale type) async {
//     var prefs = await SharedPreferences.getInstance();
//     if (_appLocale == type) {
//       return;
//     }
//     if (type == Locale("ar")) {
//       _appLocale = Locale("ar");
//       await prefs.setString('language_code', 'ar');
//       await prefs.setString('countryCode', '');
//     } else {
//       _appLocale = Locale("en");
//       await prefs.setString('language_code', 'en');
//       await prefs.setString('countryCode', 'US');
//     }
//     notifyListeners();
//   }
// }