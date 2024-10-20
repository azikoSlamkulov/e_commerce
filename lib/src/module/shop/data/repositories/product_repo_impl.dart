import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';

class ProductRepoImpl implements ProductRepo {
  ProductRepoImpl({
    required this.remoteProduct,
  });

  final RemoteProduct remoteProduct;

  @override
  Future<Either<Failure, ProductDatailEntity>> getProductDatails(
      {required String productId}) async {
    try {
      log('productId ===>>>> $productId');
      final productDatails =
          await remoteProduct.getProductDatails(productId: productId);
      return Right(productDatails);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    try {
      final allProducts = await remoteProduct.getAllProducts();
      return Right(allProducts);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductsOfTheCollection({
    required String typeName,
    required String collectionName,
  }) async {
    try {
      final allProducts = await remoteProduct.getProductsOfTheCollection(
        typeName: typeName,
        collectionName: collectionName,
      );
      //log('====>>>>>>>  $allProducts');
      return Right(allProducts);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductsOfTheCategory({
    required String typeName,
    required String collectionName,
    required String categoryName,
  }) async {
    try {
      final allProducts = await remoteProduct.getProductsOfTheCategory(
        typeName: typeName,
        collectionName: collectionName,
        categoryName: categoryName,
      );
      //log('====>>>>>>>  $allProducts');
      return Right(allProducts);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getNewAndSaleProducts() async {
    try {
      final allProducts = await remoteProduct.getNewAndSaleProducts();
      return Right(allProducts);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getSortedProductsByQuery({
    required String fieldName,
    required dynamic query,
  }) async {
    try {
      final allProducts = await remoteProduct.getSortedProductsByQuery(
        fieldName: fieldName,
        query: query,
      );
      return Right(allProducts);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>>
      getSortedListByQueryWithTwoValues({
    required dynamic firstQuery,
    required dynamic secondQuery,
  }) async {
    try {
      final allProducts = await remoteProduct.getSortedListByQueryWithTwoValues(
        firstQuery: firstQuery,
        secondQuery: secondQuery,
      );
      log('====>>>>>>>  $allProducts');
      return Right(allProducts);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>>
      getSortedListByQueryWithThreeValues({
    required dynamic firstQuery,
    required dynamic secondQuery,
    required dynamic thirdQuery,
  }) async {
    try {
      final allProducts =
          await remoteProduct.getSortedListByQueryWithThreeValues(
        firstQuery: firstQuery,
        secondQuery: secondQuery,
        thirdQuery: thirdQuery,
      );
      //log('====>>>>>>>  $allProducts');
      return Right(allProducts);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool?>> checkProductExist(
      {required String productID}) {
    // TODO: implement checkProductExist
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getFiltiredProducts({
    required List<String> priceRange,
    required List<String> colors,
    required List<String> sizes,
    required List<String> categories,
    required List<String> brands,
  }) {
    // TODO: implement getFiltiredProducts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> setProduct({
    required ProductDatailEntity product,
  }) async {
    try {
      final productID = await remoteProduct.getProductID();
      final isCreated = await remoteProduct.setProduct(
        product: productToModel(productID, product),
        productDatail: productDatailToModel(productID, product),
      );
      return Right(isCreated);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ProductRatingAndReviewsEntity>> getRatingAndReviews({
    required String productId,
  }) async {
    try {
      // final remoteRating = await remoteRatingAndReviews.getProductRating(
      //   productID: productID,
      // );
      // final allRemoteReviews = await remoteRatingAndReviews.getProductReviews(
      //   productID: productID,
      // );
      // final allRatingAndreviews = ProductRatingAndReviewsEntity(
      //   productId: productID,
      //   rating: remoteRating,
      //   reviews: allRemoteReviews,
      // );
      final allRatingAndreviews = await remoteProduct.getRatingAndReviews(
        productID: productId,
      );
      return Right(allRatingAndreviews);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> setRatingAndReviews({
    required String productId,
    required int rating,
    required ProductReviewEntity review,
  }) async {
    try {
      final isAdded = await remoteProduct.setRatingAndReviews(
        productId: productId,
        rating: rating,
        review: review != const ProductReviewEntity()
            ? productReviewToModel(review.userId!, review)
            : const ProductReviewModel(),
      );
      //log('====>>>>>>>  $allProducts');
      return Right(isAdded);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  // @override
  // Future<Either<Failure, List<ProductSizeEntity>>> getProductSizesList(
  //     {required String productID}) async {
  //   try {
  //     final allSizes = await remoteProduct.getProductSizesList(
  //       productID: productID,
  //     );
  //     //log('====>>>>>>>  $allProducts');
  //     return Right(allSizes);
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }

  // @override
  // Future<Either<Failure, ProductSizeEntity>> getProductQuantity({
  //   required String productID,
  //   required String productSize,
  // }) async {
  //   try {
  //     final quantity = await remoteProduct.getProductQuantity(
  //       productID: productID,
  //       productSize: productSize,
  //     );
  //     //log('====>>>>>>>  $allProducts');
  //     return Right(quantity);
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }
}
