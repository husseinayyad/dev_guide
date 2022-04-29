import 'package:dev_guide/src/core/constant.dart';
import 'package:dev_guide/src/core/helper/valueHolder.dart';
import 'package:dev_guide/src/core/preference.dart';

class AppRepo {
  void setUserInfo({
    String? userId,
    String? userName,
    String? userEmail,
  }) {
    Preference.load().then((value) {
      Preference.setString(Constant.userID, userId!);
      Preference.setString(Constant.userEmail, userEmail!);
      Preference.setString(Constant.userName, userName!);
    });
    ValueHolder.userIdToVerify = userId;
    ValueHolder.userNameToVerify = userName;
    ValueHolder.userEmailToVerify = userEmail;
  }



  Future<bool> getUserInfo() async {
    await Preference.load().then((value) {
      ValueHolder.userIdToVerify = Preference.getString(Constant.userID, def: "");
      ValueHolder.userEmailToVerify =
          Preference.getString(Constant.userEmail, def: "");
      ValueHolder.userNameToVerify =
          Preference.getString(Constant.userName, def: "");
    });
    return true;
  }
  void userLogOut() {
    Preference.load().then((value) {
      Preference.setString(Constant.userID, "");
      Preference.setString(Constant.userEmail, "");
      Preference.setString(Constant.userName, "");
    });

    ValueHolder.userIdToVerify = "";
    ValueHolder.userNameToVerify = "";
  }
}




