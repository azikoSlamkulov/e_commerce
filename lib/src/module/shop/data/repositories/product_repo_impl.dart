import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';

class ProductRepoImpl implements ProductRepo {
  ProductRepoImpl({
    required this.remoteProduct,
  });

  final RemoteProduct remoteProduct;

  @override
  Future<Either<Failure, ProductEntity>> getProductDatails(
      {required String productID}) async {
    try {
      final product =
          await remoteProduct.getProductDatails(productID: productID);
      return Right(product);
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
  Future<Either<Failure, List<ProductEntity>>> getAllSortedProductsByQuery({
    required String fieldName,
    required dynamic query,
  }) async {
    try {
      final allProducts = await remoteProduct.getAllSortedProductsByQuery(
        fieldName: fieldName,
        query: query,
      );
      //log('====>>>>>>>  $allProducts');
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
  Future<Either<Failure, List<ProductSizeEntity>>> getProductSizesList(
      {required String productID}) async {
    try {
      final allSizes = await remoteProduct.getProductSizesList(
        productID: productID,
      );
      //log('====>>>>>>>  $allProducts');
      return Right(allSizes);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ProductSizeEntity>> getProductQuantity({
    required String productID,
    required String productSize,
  }) async {
    try {
      final quantity = await remoteProduct.getProductQuantity(
        productID: productID,
        productSize: productSize,
      );
      //log('====>>>>>>>  $allProducts');
      return Right(quantity);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
