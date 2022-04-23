import 'dart:ui';



class User  {
  User(
      {this.userId,

        this.userName,
        this.userEmail,

        this.userPassword,


      });
  String? userId;

  String ?userName;
  String ?userEmail;

  String ?userPassword;



  @override
  bool operator ==(dynamic other) => other is User && userId == other.userId;

  @override
  int get hashCode {
    return hashValues(userId.hashCode, userId.hashCode);
  }

  String? getPrimaryKey() {
    return userId;
  }

  User fromMap(dynamic dynamicData) {

    return User(
      userId: dynamicData['userId'],

      userName: dynamicData['fullName'],
      userEmail: dynamicData['email'],

      userPassword: dynamicData['password'],


    );

  }


  Map<String, dynamic> toMap(User object) {

    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = object.userId;

    data['user_name'] = object.userName;
    data['user_email'] = object.userEmail;

    data['user_password'] = object.userPassword;


    return data;

  }

  List<User> fromMapList(List<dynamic> dynamicDataList) {
    final List<User> subUserList = <User>[];

    for (dynamic dynamicData in dynamicDataList) {
      if (dynamicData != null) {
        subUserList.add(fromMap(dynamicData));
      }
    }
    return subUserList;
  }

  List<Map<String, dynamic>> toMapList(List<User> objectList) {
    final List<Map<String, dynamic>> mapList = <Map<String, dynamic>>[];
    for (User data in objectList) {
      mapList.add(toMap(data));
    }

    return mapList;
  }
}
