import 'package:dev_guide/src/core/appLocalizations.dart';
import 'package:dev_guide/src/core/responsiveUi.dart';
import 'package:dev_guide/src/presentation/pages/home/home.dart';

import 'package:dev_guide/src/presentation/resources/colorManager.dart';
import 'package:dev_guide/src/presentation/resources/valuesManager.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late ThemeData _theme;

  int _pageIndex = 0;
  late PageController _pageController;

  List<Widget> tabPages = [
    const HomePage(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold()
  ];
  late double _width, _pixelRatio;

  late bool _xlarge;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;

    _pixelRatio = MediaQuery.of(context).devicePixelRatio;

    _xlarge = ResponsiveWidget.isScreenXLarge(_width, _pixelRatio);
    _theme = Theme.of(context);
    // get domain  to check if user is logged in
    return SafeArea(
      child: Scaffold(
        backgroundColor: _theme.scaffoldBackgroundColor,
        key: _scaffoldKey,
        appBar: AppBar(
            title: Text(
              "Dev Guide",
              style: _theme.textTheme.headline3,
            ),
            centerTitle: false,
            backgroundColor: _theme.scaffoldBackgroundColor,
            elevation: 0,
            actions: [
              Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: Icon(
                  Icons.account_circle,
                  size: AppSize.s40,
                  color: ColorManager.secondary,
                ),
              ),
            ]),
        body: PageView(
          children: tabPages,
          //physics: const NeverScrollableScrollPhysics(),
          onPageChanged: onPageChanged,
          controller: _pageController,
        ),
        bottomNavigationBar: _bottomNavigationBar(),
      ),
    );
  }

  ///[page] current page
// when page is Changed
  void onPageChanged(int page) {
    setState(() {
      _pageIndex = page;
    });
  }

  ///[index] current page  index
  //jump to next page when page is tapped
  void onTabTapped(int index) {
    _pageController.jumpToPage(index);

    // _pageController.animateToPage(index,
    //     duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

  Widget _bottomNavigationBar() {
    // get page state
    return BottomNavigationBar(
      currentIndex: _pageIndex,
      onTap: onTabTapped,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: AppLocalizations.of(context)!.translate("home")!),
        BottomNavigationBarItem(
            icon: const Icon(Icons.dashboard),
            label: AppLocalizations.of(context)!.translate("categories")!),
        BottomNavigationBarItem(
            icon: const Icon(Icons.search),
            label: AppLocalizations.of(context)!.translate("search")!),
        BottomNavigationBarItem(
            icon: const Icon(Icons.favorite),
            label: AppLocalizations.of(context)!.translate("favorites")!),
      ],
    );
  }
}
