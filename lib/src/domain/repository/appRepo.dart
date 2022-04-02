
import 'package:dev_guide/src/core/constant.dart';
import 'package:dev_guide/src/core/preference.dart';

class AppRepo{
  void setUserInfo(
      {String? userId,
        String? userName,
        String? userEmail,
        String? userPhoto,
        String? userPhone,
        bool?loginBySocialMedia}) {
    Preference.load().then((value) {
      Preference.setString(Constant.userID, userId!);
      Preference.setString(Constant.userEmail, userEmail!);
      Preference.setString(Constant.userName, userName!);
      Preference.setString(Constant.userPhoto, userPhoto!);
      Preference.setString(Constant.userPhone, userPhone!);
      Preference.setBool(Constant.loginBySocialMedia, loginBySocialMedia!);
    });
  }
}