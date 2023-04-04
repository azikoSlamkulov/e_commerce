import 'package:dartz/dartz.dart';
import 'package:e_commerce/src/core/error/failure.dart';
import 'package:e_commerce/src/module/shop/domain/entities/category_entity.dart';

abstract class CategoriesRepo {
  Future<Either<Failure, List<CategoryEntity>>> getCategories({
    required String type,
    required String collection,
  });
}
