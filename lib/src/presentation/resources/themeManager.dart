import 'package:dev_guide/src/presentation/resources/colorManager.dart';
import 'package:dev_guide/src/presentation/resources/valuesManager.dart';
import 'package:flutter/material.dart';

import 'fontManager.dart';
import 'stylesManager.dart';

ThemeData getLightTheme() {
  return ThemeData(

      // main colors of the app
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.primary,
      primaryColorDark: ColorManager.darkPrimary,
      disabledColor: ColorManager.grey1,
      scaffoldBackgroundColor: ColorManager.scaffoldBackgroundColor,
      backgroundColor: ColorManager.background,
      iconTheme: IconThemeData(color: ColorManager.primary, size: AppSize.s28),
      // ripple color
      splashColor: ColorManager.primary,
      // card view theme
      cardTheme: CardTheme(
          color: ColorManager.white,
          shadowColor: ColorManager.grey,
          elevation: AppSize.s4),
      // Bottom Navigation BarTheme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorManager.secondary,
        selectedItemColor: ColorManager.white,

        unselectedItemColor: ColorManager.lightGrey

      ),
      // App bar theme
      appBarTheme: AppBarTheme(
          centerTitle: true,
          color: ColorManager.primary,
          elevation: AppSize.s4,
          toolbarHeight: AppSize.s90,
          iconTheme:
              const IconThemeData(size: AppSize.s28),
          titleTextStyle: getRegularStyle(
              color: ColorManager.white, fontSize: FontSize.s12)),
      // Button theme
      buttonTheme: ButtonThemeData(
          shape: const StadiumBorder(),
          disabledColor: ColorManager.grey1,
          buttonColor: ColorManager.primary,
          splashColor: ColorManager.primary),

      // elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: getRegularStyle(color: ColorManager.white),
              primary: ColorManager.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s12)))),

      // Text theme
      textTheme: TextTheme(
          headline1: getSemiBoldStyle(
              color: ColorManager.black, fontSize: FontSize.s16),
          headline2: getRegularStyle(
              color: ColorManager.black, fontSize: FontSize.s16),
          headline3:
              getBoldStyle(color: ColorManager.primary, fontSize: FontSize.s16),
          headline4: getRegularStyle(
              color: ColorManager.primary, fontSize: FontSize.s14),
          headline5: getRegularStyle(color: ColorManager.primary, fontSize: FontSize.s40),
          subtitle1:
              getMediumStyle(color: ColorManager.black, fontSize: FontSize.s14),
          subtitle2: getMediumStyle(
              color: ColorManager.primary, fontSize: FontSize.s14),
          labelMedium: getBoldStyle(color: ColorManager.primary,fontSize: FontSize.s16),
          bodyText2: getMediumStyle(color: ColorManager.black),
          caption: getRegularStyle(
              color: ColorManager.black, fontSize: FontSize.s12),
          bodyText1: getRegularStyle(
              color: ColorManager.black, fontSize: FontSize.s12)),
      // input decoration theme (text form field)

      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        fillColor: ColorManager.white,
        prefixStyle: getMediumStyle(
            color: ColorManager.darkGrey, fontSize: FontSize.s12),

        // hint style
        hintStyle: getMediumStyle(
            color: ColorManager.primary, fontSize: FontSize.s12),

        // label style
        labelStyle: getMediumStyle(
            color: ColorManager.primary, fontSize: FontSize.s12),
        // error style
        errorStyle:
            getRegularStyle(color: ColorManager.error, fontSize: FontSize.s12),

        // // enabled border
        // enabledBorder: OutlineInputBorder(
        //     borderSide:
        //         BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
        //     borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        //
        // // focused border
        // focusedBorder: OutlineInputBorder(
        //     borderSide:
        //         BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        //     borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        //
        // // error border
        // errorBorder: OutlineInputBorder(
        //     borderSide:
        //         BorderSide(color: ColorManager.error, width: AppSize.s1_5),
        //     borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        // // focused error border
        // focusedErrorBorder: OutlineInputBorder(
        //     borderSide:
        //         BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        //     borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        border: InputBorder.none
      ),
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: ColorManager.grey));
}

ThemeData getDarkTheme() {
  return ThemeData(

      // main colors of the app
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.primary,
      primaryColorDark: ColorManager.darkPrimary,
      disabledColor: ColorManager.grey1,
      scaffoldBackgroundColor: ColorManager.scaffoldBackgroundColorDark,
      backgroundColor: ColorManager.background,
      iconTheme: IconThemeData(color: ColorManager.primary, size: AppSize.s28),
      // ripple color
      splashColor: ColorManager.primary,
      // card view theme
      cardTheme: CardTheme(
          color: ColorManager.white,
          shadowColor: ColorManager.grey,
          elevation: AppSize.s4),
      // Bottom Navigation BarTheme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: ColorManager.secondary,
          selectedItemColor: ColorManager.white,
          unselectedItemColor: ColorManager.lightGrey

      ),
      // App bar theme
      appBarTheme: AppBarTheme(
          centerTitle: true,
          color: ColorManager.primary,
          elevation: AppSize.s4,
          toolbarHeight: AppSize.s90,
          iconTheme:
              const IconThemeData(size: AppSize.s28),
          titleTextStyle: getRegularStyle(
              color: ColorManager.white, fontSize: FontSize.s12)),
      // Button theme
      buttonTheme: ButtonThemeData(
          shape: const StadiumBorder(),
          disabledColor: ColorManager.grey1,
          buttonColor: ColorManager.primary,
          splashColor: ColorManager.primary),

      // elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: getRegularStyle(color: ColorManager.white),
              primary: ColorManager.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s8)))),

      // Text theme
      textTheme: TextTheme(
          headline1: getSemiBoldStyle(
              color: ColorManager.black, fontSize: FontSize.s14),
          headline2: getRegularStyle(
              color: ColorManager.black, fontSize: FontSize.s14),
          headline3:
              getBoldStyle(color: ColorManager.primary, fontSize: FontSize.s14),
          headline4: getRegularStyle(
              color: ColorManager.primary, fontSize: FontSize.s12),
          headline5: getRegularStyle(color: ColorManager.primary, fontSize: FontSize.s40),
          subtitle1:
              getMediumStyle(color: ColorManager.white, fontSize: FontSize.s12),
          subtitle2: getMediumStyle(
              color: ColorManager.primary, fontSize: FontSize.s14),
          bodyText2: getMediumStyle(color: ColorManager.black),
          labelMedium: getBoldStyle(color: ColorManager.primary,fontSize: FontSize.s16),
          caption: getRegularStyle(color: ColorManager.black),

          bodyText1: getRegularStyle(color: ColorManager.black)),

      // input decoration theme (text form field)

      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        // hint style
        hintStyle: getRegularStyle(color: ColorManager.primary),

        // label style
        labelStyle: getMediumStyle(color: ColorManager.primary),

        // error style
        errorStyle: getRegularStyle(color: ColorManager.error),
        //
        // // enabled border
        // enabledBorder: OutlineInputBorder(
        //     borderSide:
        //         BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
        //     borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        //
        // // focused border
        // focusedBorder: OutlineInputBorder(
        //     borderSide:
        //         BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        //     borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        //
        // // error border
        // errorBorder: OutlineInputBorder(
        //     borderSide:
        //         BorderSide(color: ColorManager.error, width: AppSize.s1_5),
        //     borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        // // focused error border
        // focusedErrorBorder: OutlineInputBorder(
        //     borderSide:
        //         BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        //     borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        border: InputBorder.none
      ),
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: ColorManager.white));
}
