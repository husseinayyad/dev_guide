import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dev_guide/src/data/exception.dart';
import 'package:dev_guide/src/domain/model/user.dart' as u;
import 'package:firebase_auth/firebase_auth.dart';

abstract class RemoteDataSource {
  Future<u.User> signUp(Map jsonMap);

  Future<u.User> login(String email, password);
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
  Future<u.User> login(String email, password) async{
    String fullName="",userId="";
    var result= await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) async{
      final query =  FirebaseFirestore.instance
          .collection('users')
          .doc(value.user!.uid).get();
    await query.then((data) {
       fullName=data["fullName"];
       userId=value.user!.uid;
       return u.User().fromMap({
         "fullName": fullName,
         "email": value.user!.email,
         // "password":jsonMap["password"],
         "userId": value.user!.uid
       });
     }
     );

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

}
