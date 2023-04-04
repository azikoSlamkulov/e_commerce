import 'package:e_commerce/src/core/error/exception.dart';
import 'package:e_commerce/src/module/shop/data/data_source/remote/remote_categories.dart';
import 'package:e_commerce/src/module/shop/domain/entities/category_entity.dart';
import 'package:e_commerce/src/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/src/module/shop/domain/repositories/categories_repo.dart';

class CategoriesRepoImpl implements CategoriesRepo {
  CategoriesRepoImpl({
    required this.remoteCategories,
  });

  final RemoteCategories remoteCategories;

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories({
    required String type,
    required String collection,
  }) async {
    try {
      final allCategories = await remoteCategories.getCategories(
        type: type,
        collection: collection,
      );
      return Right(allCategories);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
