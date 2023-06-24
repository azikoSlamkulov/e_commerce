import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';

abstract class ProductRepo {
  Future<Either<Failure, ProductEntity>> getProductDatails({
    required String productID,
  });

  Future<Either<Failure, List<ProductEntity>>> getAllProducts();

  Future<Either<Failure, List<ProductSizeEntity>>> getProductSizesList({
    required String productID,
  });

  Future<Either<Failure, ProductSizeEntity>> getProductQuantity({
    required String productID,
    required String productSize,
  });

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
