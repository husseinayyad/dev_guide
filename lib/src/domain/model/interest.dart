import 'dart:ui';

import '../../data/network/apiObject.dart';

class Interest extends ApiObject<Interest> {
  Interest(
      {this.id,

        this.name,


      });
  String? id;

  String ?name;



  @override
  bool operator ==(dynamic other) => other is Interest && id == other.id;

  @override
  int get hashCode {
    return hashValues(id.hashCode, id.hashCode);
  }

  @override
  String? getPrimaryKey() {
    return id;
  }

  @override
  Interest fromMap(dynamic dynamicData) {

    return Interest(
      id: dynamicData['id'],

      name: dynamicData['name'],


    );

  }


  @override
  Map<String, dynamic> toMap(Interest object) {

    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = object.id;

    data['name'] = object.name;


    return data;

  }

  @override
  List<Interest> fromMapList(List<dynamic> dynamicDataList) {
    final List<Interest> subUserList = <Interest>[];

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
  List<Map<String, dynamic>> toMapList(List<Interest> objectList) {
    final List<Map<String, dynamic>> mapList = <Map<String, dynamic>>[];
    if (objectList != null) {
      for (Interest data in objectList) {
        if (data != null) {
          mapList.add(toMap(data));
        }
      }
    }

    return mapList;
  }
}
