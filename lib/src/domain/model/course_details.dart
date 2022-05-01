import 'dart:ui';

class CourseDetails {
  String? name;

  String? description;
 String? link;

  CourseDetails(
      {this.name,

        this.description,
        this.link
      });


  @override
  bool operator ==(dynamic other) => other is CourseDetails && name == other.name;

  @override
  int get hashCode {
    return hashValues(name.hashCode, name.hashCode);
  }

  String? getPrimaryKey() {
    return name;
  }

  CourseDetails fromMap(dynamic dynamicData) {

    return CourseDetails(
      name: dynamicData['name'],

description:  dynamicData['desc'],
link: dynamicData['link']


    );

  }


  Map<String, dynamic> toMap(CourseDetails object) {

    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = object.name;

    data['desc'] = object.description;


    data['link'] = object.link;

    return data;

  }

  List<CourseDetails> fromMapList(List<dynamic> dynamicDataList) {
    final List<CourseDetails> sliderList = <CourseDetails>[];

    for (dynamic dynamicData in dynamicDataList) {
      if (dynamicData != null) {
        sliderList.add(fromMap(dynamicData));
      }
    }
    return sliderList;
  }

  List<Map<String, dynamic>> toMapList(List<CourseDetails> objectList) {
    final List<Map<String, dynamic>> mapList = <Map<String, dynamic>>[];
    for (CourseDetails data in objectList) {
      mapList.add(toMap(data));
    }

    return mapList;
  }
}