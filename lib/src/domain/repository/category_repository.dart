import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dev_guide/src/data/datasources/remote_data_source.dart';
import 'package:dev_guide/src/data/exception.dart';
import 'package:dev_guide/src/data/failure.dart';
import 'package:dev_guide/src/domain/model/category.dart';

class CategoryRepository {
  final RemoteDataSourceImpl remoteDataSource = RemoteDataSourceImpl();

  Future<Either<Failure, List<Category>>> getCategoryList() async {
    try {
      final result = await remoteDataSource.getCategory();
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
