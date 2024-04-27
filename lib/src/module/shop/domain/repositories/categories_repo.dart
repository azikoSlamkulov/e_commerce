import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';

abstract class CategoriesRepo {
  Future<Either<Failure, List<CategoryEntity>>> getCategories({
    required String type,
    required String collection,
  });

  Future<Either<Failure, List<CategoryEntity>>> getAllCategories();

  Future<Either<Failure, bool>> addCategory({
    required String type,
    required String collection,
    required String category,
  });

  Future<Either<Failure, bool>> deleteCategory({
    required String id,
  });
}
