import 'dart:ui';

class SubCategory {
  String? id;

  String? name;

  String? image;
  String? state;
  String? catgId;
  SubCategory({this.id, this.name, this.image, this.state, this.catgId});

  @override
  bool operator ==(dynamic other) => other is SubCategory && id == other.id;

  @override
  int get hashCode {
    return hashValues(id.hashCode, id.hashCode);
  }

  String? getPrimaryKey() {
    return id;
  }

  SubCategory fromMap(dynamic dynamicData) {
    return SubCategory(
        id: dynamicData['id'],
        name: dynamicData['name'],
        image: dynamicData['image'],
        state: dynamicData['state'],
        catgId: dynamicData['catgId']);
  }

  Map<String, dynamic> toMap(SubCategory object) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = object.id;

    data['name'] = object.name;

    data['image'] = object.image;
    data['state'] = object.state;
    data['catgId'] = object.catgId;
    return data;
  }

  List<SubCategory> fromMapList(List<dynamic> dynamicDataList) {
    final List<SubCategory> sliderList = <SubCategory>[];

    for (dynamic dynamicData in dynamicDataList) {
      if (dynamicData != null) {
        sliderList.add(fromMap(dynamicData));
      }
    }
    return sliderList;
  }

  List<Map<String, dynamic>> toMapList(List<SubCategory> objectList) {
    final List<Map<String, dynamic>> mapList = <Map<String, dynamic>>[];
    for (SubCategory data in objectList) {
      mapList.add(toMap(data));
    }

    return mapList;
  }
}
