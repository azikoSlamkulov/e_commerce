import 'dart:developer';

import 'package:e_commerce/src/module/shop/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/product_repo.dart';
import '../data_source/local/local_product_data.dart';
import '../data_source/remote/remote_product.dart';

class ProductRepoImpl implements ProductRepo {
  ProductRepoImpl({
    required this.remoteProduct,
  });

  final RemoteProduct remoteProduct;

  @override
  Future<Either<Failure, ProductEntity>> getProduct(
      {required String productID}) async {
    try {
      final product = await remoteProduct.getProduct(productID: productID);
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
}
