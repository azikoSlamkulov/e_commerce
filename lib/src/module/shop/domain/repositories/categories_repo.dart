import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';

abstract class CategoriesRepo {
  Future<Either<Failure, List<CategoryEntity>>> getCategories({
    required String type,
    required String collection,
  });
}
