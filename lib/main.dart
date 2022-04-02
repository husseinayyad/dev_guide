import 'package:dev_guide/src/core/appLocalizations.dart';
import 'package:dev_guide/src/core/constant.dart';
import 'package:dev_guide/src/core/route.dart';
import 'package:dev_guide/src/presentation/resources/themeManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'src/domain/bloc/app/app_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();

  await SharedPreferences.getInstance();

  await AppCubit().fetchLocale();
  await AppCubit().checkTheme();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  _MyAppState();

  late SharedPreferences prefs;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  //static GlobalKey<State<StatefulWidget>> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      bloc: AppCubit(),

      builder: (context, state) {
        return MaterialApp(
          locale: AppCubit().appLocal,
          supportedLocales: [AppCubit().appLocal],
          navigatorKey: Constant.navigatorKey,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          title: Constant.appName,
          theme: getLightTheme(),
          darkTheme: getDarkTheme(),
          themeMode:
              AppCubit.themeType == "dark" ? ThemeMode.dark : ThemeMode.light,
          builder: (context, child) {
            final MediaQueryData data = MediaQuery.of(context);
            return MediaQuery(
              data: data.copyWith(
                textScaleFactor: 1.0,
              ),
              child: child!,
            );
          },
          initialRoute: '/',
          onGenerateRoute: Routes.generateRoute,
        );
      },
    );
  }

// Future<ThemeData> getTheme() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   if (prefs.getString("theme") == "dark") {
//     _appTheme = AppTheme.darkTheme;
//   } else {
//     _appTheme = AppTheme.lightTheme;
//   }
//   return _appTheme;
// }
}
