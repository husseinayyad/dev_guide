import 'dart:ui';

import '../../data/network/apiObject.dart';

class Sender extends ApiObject<Sender> {
  Sender(
      {this.id,

        this.name,


      });
  String? id;

  String ?name;



  @override
  bool operator ==(dynamic other) => other is Sender && id == other.id;

  @override
  int get hashCode {
    return hashValues(id.hashCode, id.hashCode);
  }

  @override
  String? getPrimaryKey() {
    return id;
  }

  @override
  Sender fromMap(dynamic dynamicData) {

    return Sender(
      id: dynamicData['id'],

      name: dynamicData['name'],


    );

  }


  @override
  Map<String, dynamic> toMap(Sender object) {

    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = object.id;

    data['name'] = object.name;


    return data;

  }

  @override
  List<Sender> fromMapList(List<dynamic> dynamicDataList) {
    final List<Sender> subUserList = <Sender>[];

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
  List<Map<String, dynamic>> toMapList(List<Sender> objectList) {
    final List<Map<String, dynamic>> mapList = <Map<String, dynamic>>[];
    if (objectList != null) {
      for (Sender data in objectList) {
        if (data != null) {
          mapList.add(toMap(data));
        }
      }
    }

    return mapList;
  }
}
