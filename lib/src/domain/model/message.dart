import 'dart:ui';

import '../../data/network/apiObject.dart';

class Message extends ApiObject<Message> {
  Message(
      {this.id,

        this.name,


      });
  String? id;

  String ?name;



  @override
  bool operator ==(dynamic other) => other is Message && id == other.id;

  @override
  int get hashCode {
    return hashValues(id.hashCode, id.hashCode);
  }

  @override
  String? getPrimaryKey() {
    return id;
  }

  @override
  Message fromMap(dynamic dynamicData) {

    return Message(
      id: dynamicData['id'],

      name: dynamicData['name'],


    );

  }


  @override
  Map<String, dynamic> toMap(Message object) {

    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = object.id;

    data['name'] = object.name;


    return data;

  }

  @override
  List<Message> fromMapList(List<dynamic> dynamicDataList) {
    final List<Message> subUserList = <Message>[];

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
  List<Map<String, dynamic>> toMapList(List<Message> objectList) {
    final List<Map<String, dynamic>> mapList = <Map<String, dynamic>>[];
    if (objectList != null) {
      for (Message data in objectList) {
        if (data != null) {
          mapList.add(toMap(data));
        }
      }
    }

    return mapList;
  }
}
