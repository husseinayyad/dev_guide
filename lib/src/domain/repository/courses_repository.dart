import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dev_guide/src/data/datasources/remote_data_source.dart';
import 'package:dev_guide/src/data/exception.dart';
import 'package:dev_guide/src/data/failure.dart';
import 'package:dev_guide/src/domain/model/course.dart';
import 'package:dev_guide/src/domain/model/slider.dart';

class CoursesRepository {
  final RemoteDataSourceImpl remoteDataSource = RemoteDataSourceImpl();

  Future<Either<Failure, List<Course>>> getCoursesList(String subCatgId) async {
    try {
      final result = await remoteDataSource.getCourses(subCatgId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(e.msg),
      );
    } on SocketException {
      return const Left(
        ConnectionFailure(
          'Failed to connect to the network',
        ),
      );
    }
  }
    Future<Either<Failure, List<Course>>> getCoursesByNameList(String name) async {
    try {
      final result = await remoteDataSource.getCoursesByName(name);
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(e.msg),
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
