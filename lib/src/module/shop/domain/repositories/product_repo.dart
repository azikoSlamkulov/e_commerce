import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';

abstract class ProductRepo {
  Future<Either<Failure, List<ProductEntity>>> getAllProducts();

  Future<Either<Failure, ProductDatailEntity>> getProductDatails({
    required String productId,
  });

  Future<Either<Failure, List<ProductEntity>>> getProductsOfTheCollection({
    required String typeName,
    required String collectionName,
  });

  Future<Either<Failure, List<ProductEntity>>> getProductsOfTheCategory({
    required String typeName,
    required String collectionName,
    required String categoryName,
  });

  Future<Either<Failure, List<ProductEntity>>> getNewAndSaleProducts();

  Future<Either<Failure, List<ProductEntity>>> getSortedProductsByQuery({
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

  Future<Either<Failure, List<ProductEntity>>> getFiltiredProducts({
    required List<String> priceRange,
    required List<String> colors,
    required List<String> sizes,
    required List<String> categories,
    required List<String> brands,
  });

  Future<Either<Failure, bool>> setProduct(
      {required ProductDatailEntity product});

  Future<Either<Failure, bool?>> checkProductExist({required String productID});

  Future<Either<Failure, ProductRatingAndReviewsEntity>> getRatingAndReviews({
    required String productId,
  });

  Future<Either<Failure, bool>> setRatingAndReviews({
    required String productId,
    required int rating,
    required ProductReviewEntity review,
  });
}
