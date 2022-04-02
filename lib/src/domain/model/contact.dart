import 'dart:ui';

import '../../data/network/apiObject.dart';

class Contact extends ApiObject<Contact> {
  Contact(
      {this.id,

        this.name,


      });
  String? id;

  String ?name;



  @override
  bool operator ==(dynamic other) => other is Contact && id == other.id;

  @override
  int get hashCode {
    return hashValues(id.hashCode, id.hashCode);
  }

  @override
  String? getPrimaryKey() {
    return id;
  }

  @override
  Contact fromMap(dynamic dynamicData) {

    return Contact(
      id: dynamicData['id'],

      name: dynamicData['name'],


    );

  }


  @override
  Map<String, dynamic> toMap(Contact object) {

    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = object.id;

    data['name'] = object.name;


    return data;

  }

  @override
  List<Contact> fromMapList(List<dynamic> dynamicDataList) {
    final List<Contact> subUserList = <Contact>[];

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
  List<Map<String, dynamic>> toMapList(List<Contact> objectList) {
    final List<Map<String, dynamic>> mapList = <Map<String, dynamic>>[];
    if (objectList != null) {
      for (Contact data in objectList) {
        if (data != null) {
          mapList.add(toMap(data));
        }
      }
    }

    return mapList;
  }
}
