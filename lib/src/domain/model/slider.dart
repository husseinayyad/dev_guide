

import 'dart:ui';

class Slider {
  String? id;

  String? description;


  Slider(
      {this.id,

        this.description,
      });


  @override
  bool operator ==(dynamic other) => other is Slider && id == other.id;

  @override
  int get hashCode {
    return hashValues(id.hashCode, id.hashCode);
  }

  String? getPrimaryKey() {
    return id;
  }

  Slider fromMap(dynamic dynamicData) {

    return Slider(
      id: dynamicData['id'],

description:  dynamicData['desc']


    );

  }


  Map<String, dynamic> toMap(Slider object) {

    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = object.id;

    data['desc'] = object.description;



    return data;

  }

  List<Slider> fromMapList(List<dynamic> dynamicDataList) {
    final List<Slider> sliderList = <Slider>[];

    for (dynamic dynamicData in dynamicDataList) {
      if (dynamicData != null) {
        sliderList.add(fromMap(dynamicData));
      }
    }
    return sliderList;
  }

  List<Map<String, dynamic>> toMapList(List<Slider> objectList) {
    final List<Map<String, dynamic>> mapList = <Map<String, dynamic>>[];
    for (Slider data in objectList) {
      mapList.add(toMap(data));
    }

    return mapList;
  }
}