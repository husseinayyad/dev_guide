import 'dart:async';



import 'package:dev_guide/src/core/constant.dart';
import 'package:dev_guide/src/core/preference.dart';
import 'package:dev_guide/src/core/routesName.dart';
import 'package:dev_guide/src/presentation/resources/assetsManager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';



class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  var _visible = true;

  late AnimationController _animationController;
  late Animation<double> _animation;

  startTime() async {
    var _duration = const Duration(seconds: 4);
    return Timer(_duration, _navigationPage);
  }



  void _navigationPage() async {
    Preference.load().then((value) {
      // check if user is logged in by user Id
      if( value!.getString(Constant.userID)!=null ) {

        Navigator.of(context)
            .pushNamedAndRemoveUntil(RoutesName.mainPage, (route) => false);
      }
      else{

        Navigator.of(context)
            .pushNamedAndRemoveUntil(RoutesName.login, (route) => false);
      }

        });

  }

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeOut);

    _animation.addListener(() => setState(() {}));
    _animationController.forward();

    setState(() {
      _visible = !_visible;
    });
startTime();

  }
  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        fit: StackFit.expand,
        children: <Widget>[

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                ImageAssets.appLogo,
                width: _animation.value * 260,
              ),
// Text("cosmetics and beauty products"),
            ],
          )
        ],
      )
    );
  }


}
//
