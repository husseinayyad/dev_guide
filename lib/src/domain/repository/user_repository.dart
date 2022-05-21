


import 'dart:io';

import 'package:dev_guide/src/data/datasources/remote_data_source.dart';
import 'package:dev_guide/src/data/exception.dart';
import 'package:dev_guide/src/data/failure.dart';

import 'package:dev_guide/src/domain/model/user.dart';
import 'package:dartz/dartz.dart';
class UserRepository {
   final RemoteDataSourceImpl remoteDataSource=RemoteDataSourceImpl();

  Future<Either<Failure, User>> register(
      Map<dynamic, dynamic> jsonMap) async {

    try {
      final result = await remoteDataSource.signUp(jsonMap);
      return Right(
        result
      );
    } on ServerException  catch(e) {


      return  Left(
        ServerFailure(
            e.msg
        ),
      );

    } on SocketException {
      return const Left(
        ConnectionFailure(
          'Failed to connect to the network',
        ),
      );
    }

  }


  Future<Either<Failure, User>> login(
    String email ,password) async {


      try {
        final result = await remoteDataSource.login(email, password);
        return Right(
            result
        );
      } on ServerException  catch(e) {


        return  Left(
          ServerFailure(
              e.msg
          ),
        );

      } on SocketException {
        return const Left(
          ConnectionFailure(
            'Failed to connect to the network',
          ),
        );
      }
  }

   Future<Either<Failure, void>> favAction( bool add,
       String id,List favList) async {


     try {
       final result = await remoteDataSource.favAction(add, id,favList);
       return Right(
           result
       );
     } on ServerException  catch(e) {


       return  Left(
         ServerFailure(
             e.msg
         ),
       );

     } on SocketException {
       return const Left(
         ConnectionFailure(
           'Failed to connect to the network',
         ),
       );
     }
   }
}
