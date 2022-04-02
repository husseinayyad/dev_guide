import 'dart:ui';

import '../../data/network/apiObject.dart';

class User extends ApiObject<User> {
  User(
      {this.userId,

        this.userName,
        this.userEmail,
        this.userPhone,
        this.userPassword,
        this.userAboutMe,
        this.userCoverPhoto,
        this.userProfilePhoto,
        this.roleId,
        this.status,

      });
  String? userId;

  String ?userName;
  String ?userEmail;
  String ?userPhone;
  String ?userPassword;
  String ?userAboutMe;
  String ?userCoverPhoto;
  String ?userProfilePhoto;
  String ?roleId;
  String? status;


  @override
  bool operator ==(dynamic other) => other is User && userId == other.userId;

  @override
  int get hashCode {
    return hashValues(userId.hashCode, userId.hashCode);
  }

  @override
  String? getPrimaryKey() {
    return userId;
  }

  @override
  User fromMap(dynamic dynamicData) {

    return User(
      userId: dynamicData['user_id'],

      userName: dynamicData['user_name'],
      userEmail: dynamicData['user_email'],
      userPhone: dynamicData['user_phone'],
      userPassword: dynamicData['user_password'],
      userAboutMe: dynamicData['user_about_me'],
      userCoverPhoto: dynamicData['user_cover_photo'],
      userProfilePhoto: dynamicData['user_profile_photo'],
      roleId: dynamicData['role_id'],
      status: dynamicData['status'],

    );

  }


  @override
  Map<String, dynamic> toMap(User object) {

    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = object.userId;

    data['user_name'] = object.userName;
    data['user_email'] = object.userEmail;
    data['user_phone'] = object.userPhone;
    data['user_password'] = object.userPassword;

    data['user_cover_photo'] = object.userCoverPhoto;
    data['user_profile_photo'] = object.userProfilePhoto;
    data['role_id'] = object.roleId;
    data['status'] = object.status;

    return data;

  }

  @override
  List<User> fromMapList(List<dynamic> dynamicDataList) {
    final List<User> subUserList = <User>[];

    if (dynamicDataList != null) {
      for (dynamic dynamicData in dynamicDataList) {
        if (dynamicData != null) {
          subUserList.add(fromMap(dynamicData));
        }
      }
    }
    return subUserList;
  }

  @override
  List<Map<String, dynamic>> toMapList(List<User> objectList) {
    final List<Map<String, dynamic>> mapList = <Map<String, dynamic>>[];
    if (objectList != null) {
      for (User data in objectList) {
        if (data != null) {
          mapList.add(toMap(data));
        }
      }
    }

    return mapList;
  }
}
