import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dev_guide/src/core/helper/valueHolder.dart';
import 'package:dev_guide/src/data/exception.dart';
import 'package:dev_guide/src/domain/model/category.dart';
import 'package:dev_guide/src/domain/model/course.dart';
import 'package:dev_guide/src/domain/model/slider.dart';
import 'package:dev_guide/src/domain/model/sub_category.dart';
import 'package:dev_guide/src/domain/model/user.dart' as u;
import 'package:firebase_auth/firebase_auth.dart';

abstract class RemoteDataSource {
  Future<u.User> signUp(Map jsonMap);

  Future<u.User> login(String email, password);

  Future<List<Slider>> getSlider();

  Future<List<Category>> getCategory();

  Future<List<SubCategory>> getSubCategory(String catgId);

  Future<List<Course>> getCourses(String subCatgId);

  Future<List<Course>> getCoursesByName(String name);
  Future<List<Course>> getFavCourses(String userId);
  Future<void> favAction(bool add, String id, List favList);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<u.User> signUp(Map<dynamic, dynamic> jsonMap) async {
    var result = await _firebaseAuth
        .createUserWithEmailAndPassword(
            email: jsonMap["email"], password: jsonMap["password"])
        .then((onValue) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(onValue.user!.uid)
          .set({
        'fullName': jsonMap["fullName"],
        'userId': onValue.user!.uid,
        "email": onValue.user!.email
      });
      return u.User().fromMap({
        "fullName": jsonMap["fullName"],
        "email": jsonMap["email"],
        "password": jsonMap["password"],
        "userId": onValue.user!.uid
      });
    }).catchError((error) {
      throw ServerException(error.toString());
    });
    if (result != null) {
      return u.User().fromMap({
        "fullName": jsonMap["fullName"],
        "email": jsonMap["email"],
        "password": jsonMap["password"],
        "userId": result.userId
      });
    } else {
      throw ServerException("");
    }
  }

  @override
  Future<u.User> login(String email, password) async {
    String fullName = "", userId = "";
    await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      final query = FirebaseFirestore.instance
          .collection('users')
          .doc(value.user!.uid)
          .get();
      await query.then((data) {
        fullName = data["fullName"];
        userId = value.user!.uid;
        return u.User().fromMap({
          "fullName": fullName,
          "email": value.user!.email,
          // "password":jsonMap["password"],
          "userId": value.user!.uid
        });
      });
    }).catchError((error) {
      throw ServerException(error.toString());
    });

    if (fullName.isNotEmpty) {
      return u.User().fromMap({
        "fullName": fullName,
        "email": email,
        "password": password,
        "userId": userId
      });
    } else {
      throw ServerException("");
    }
  }

  @override
  Future<List<Slider>> getSlider() async {
    List data = [];
    await FirebaseFirestore.instance.collection('slider').get().then((value) {
      data = value.docs;
    }).catchError((error) {
      throw ServerException(error.toString());
    });
    if (data.isNotEmpty) {
      return Slider().fromMapList(data);
    } else {
      throw ServerException("");
    }
  }

  @override
  Future<List<Category>> getCategory() async {
    List data = [];
    await FirebaseFirestore.instance.collection('category').get().then((value) {
      data = value.docs;
    }).catchError((error) {
      throw ServerException(error.toString());
    });
    if (data.isNotEmpty) {
      return Category().fromMapList(data);
    } else {
      throw ServerException("");
    }
  }

  @override
  Future<List<SubCategory>> getSubCategory(String catgId) async {
    List data = [];
    await FirebaseFirestore.instance
        .collection('subCategory')
        .where("catgId", isEqualTo: catgId)
        .get()
        .then((value) {
      data = value.docs;
    }).catchError((error) {
      throw ServerException(error.toString());
    });
    if (data.isNotEmpty) {
      return SubCategory().fromMapList(data);
    } else {
      throw ServerException("");
    }
  }

  @override
  Future<List<Course>> getCourses(String subCatgId) async {
    List data = [];
    await FirebaseFirestore.instance
        .collection('courses')
        .where("subCatgId", isEqualTo: subCatgId)
        .get()
        .then((value) {
      data = value.docs;
    }).catchError((error) {
      throw ServerException(error.toString());
    });
    if (data.isNotEmpty) {
      return Course().fromMapList(data);
    } else {
      throw ServerException("");
    }
  }

  @override
  Future<List<Course>> getCoursesByName(String name) async {
    List data = [];
    await FirebaseFirestore.instance.collection('courses').get().then((value) {
      data = value.docs;
    }).catchError((error) {
      throw ServerException(error.toString());
    });
    if (data.isNotEmpty) {
      return Course().fromMapList(data
          .where((element) => element["name"]
              .toString()
              .toLowerCase()
              .contains(name.toLowerCase()))
          .toList());
    } else {
      throw ServerException("");
    }
  }

  @override
  Future<void> favAction(bool add, String id, List favList) async {
    if (add) {
      favList.add(ValueHolder.userIdToVerify!);
    } else {
      favList.removeWhere((element) => element == ValueHolder.userIdToVerify!);
    }
    await FirebaseFirestore.instance
        .collection('courses')
        .doc(id)
        .update({"favList": favList}).then((value) => print("done")).catchError((error) {
          print(error);
      throw ServerException(error.toString());
    });
  }

  @override
  Future<List<Course>> getFavCourses(String userId) async {
    List data = [];
    await FirebaseFirestore.instance.collection('courses').get().then((value) {
      data = value.docs;
    }).catchError((error) {
      throw ServerException(error.toString());
    });
    if (data.isNotEmpty) {
      return Course().fromMapList(data
          .where((element) => element["favList"]

          .contains(userId))
          .toList());
    } else {
      throw ServerException("");
    }
  }
}
