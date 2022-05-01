import 'dart:ui';

import 'package:dev_guide/src/domain/model/course_details.dart';

class Course {
  String? id;

  String? name;

  String? image;
  String? desc;
  List? courses;
  String? catgId;
  String? subCatgId;
  String? state;
  Course(
      {this.id,
      this.name,
      this.image,
      this.desc,
      this.courses,
      this.catgId,
      this.subCatgId,
      this.state});

  @override
  bool operator ==(dynamic other) => other is Course && id == other.id;

  @override
  int get hashCode {
    return hashValues(id.hashCode, id.hashCode);
  }

  String? getPrimaryKey() {
    return id;
  }

  Course fromMap(dynamic dynamicData) {
    return Course(
        id: dynamicData['id'],
        name: dynamicData['name'],
        image: dynamicData['image'],
        desc: dynamicData['desc'],
        courses: dynamicData['courses'],
        catgId: dynamicData['catgId'],
        subCatgId: dynamicData['subCatgId'],
        state: dynamicData['state']);
  }

  Map<String, dynamic> toMap(Course object) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = object.id;

    data['name'] = object.name;

    data['image'] = object.image;
    data['desc'] = object.desc;
    data['courses'] = object.courses;
    data['catgId'] = object.catgId;
    data['subCatgId'] = object.subCatgId;
    data['state'] = object.state;
    return data;
  }

  List<Course> fromMapList(List<dynamic> dynamicDataList) {
    final List<Course> sliderList = <Course>[];

    for (dynamic dynamicData in dynamicDataList) {
      if (dynamicData != null) {
        sliderList.add(fromMap(dynamicData));
      }
    }
    return sliderList;
  }

  List<Map<String, dynamic>> toMapList(List<Course> objectList) {
    final List<Map<String, dynamic>> mapList = <Map<String, dynamic>>[];
    for (Course data in objectList) {
      mapList.add(toMap(data));
    }

    return mapList;
  }
}
