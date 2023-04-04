import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/product_entity.dart';

abstract class ProductRepo {
  Future<Either<Failure, ProductEntity>> getProduct(
      {required String productID});

  Future<Either<Failure, List<ProductEntity>>> getAllProducts();

  Future<Either<Failure, List<ProductEntity>>> getAllSortedProductsByQuery({
    required String fieldName,
    required dynamic query,
  });

  Future<Either<Failure, List<ProductEntity>>>
      getSortedListByQueryWithTwoValues({
    required dynamic firstQuery,
    required dynamic secondQuery,
  });

  Future<Either<Failure, List<ProductEntity>>>
      getSortedListByQueryWithThreeValues({
    required dynamic firstQuery,
    required dynamic secondQuery,
    required dynamic thirdQuery,
  });

  Future<Either<Failure, bool?>> checkProductExist({required String productID});
}
