

import 'dart:ui';

class Category {
  String? id;

  String? name;

String? image;
String? state;
  Category(
      {this.id,

        this.name,
        this.image,
        this.state
      });


  @override
  bool operator ==(dynamic other) => other is Category && id == other.id;

  @override
  int get hashCode {
    return hashValues(id.hashCode, id.hashCode);
  }

  String? getPrimaryKey() {
    return id;
  }

  Category fromMap(dynamic dynamicData) {

    return Category(
      id: dynamicData['id'],

name:  dynamicData['name'],
image:  dynamicData['image'],
state: dynamicData['state'],

    );

  }


  Map<String, dynamic> toMap(Category object) {

    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = object.id;

    data['name'] = object.name;

    data['image'] = object.image;
    data['state'] = object.state;
    return data;

  }

  List<Category> fromMapList(List<dynamic> dynamicDataList) {
    final List<Category> sliderList = <Category>[];

    for (dynamic dynamicData in dynamicDataList) {
      if (dynamicData != null) {
        sliderList.add(fromMap(dynamicData));
      }
    }
    return sliderList;
  }

  List<Map<String, dynamic>> toMapList(List<Category> objectList) {
    final List<Map<String, dynamic>> mapList = <Map<String, dynamic>>[];
    for (Category data in objectList) {
      mapList.add(toMap(data));
    }

    return mapList;
  }
}