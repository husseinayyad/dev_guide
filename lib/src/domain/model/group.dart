import 'dart:ui';

import '../../data/network/apiObject.dart';

class Group extends ApiObject<Group> {
  Group(
      {this.id,

        this.name,


      });
  String? id;

  String ?name;



  @override
  bool operator ==(dynamic other) => other is Group && id == other.id;

  @override
  int get hashCode {
    return hashValues(id.hashCode, id.hashCode);
  }

  @override
  String? getPrimaryKey() {
    return id;
  }

  @override
  Group fromMap(dynamic dynamicData) {

    return Group(
      id: dynamicData['id'],

      name: dynamicData['name'],


    );

  }


  @override
  Map<String, dynamic> toMap(Group object) {

    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = object.id;

    data['name'] = object.name;


    return data;

  }

  @override
  List<Group> fromMapList(List<dynamic> dynamicDataList) {
    final List<Group> subUserList = <Group>[];

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
  List<Map<String, dynamic>> toMapList(List<Group> objectList) {
    final List<Map<String, dynamic>> mapList = <Map<String, dynamic>>[];
    if (objectList != null) {
      for (Group data in objectList) {
        if (data != null) {
          mapList.add(toMap(data));
        }
      }
    }

    return mapList;
  }
}
