import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';

class ProductRepoImpl implements ProductRepo {
  ProductRepoImpl({
    required this.remoteProduct,
  });

  final RemoteProduct remoteProduct;

  // @override
  // Future<Either<Failure, ProductEntity>> getProductDatails(
  //     {required String productID}) async {
  //   try {
  //     final product =
  //         await remoteProduct.getProductDatails(productID: productID);
  //     return Right(product);
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }

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
    required ProductEntity product,
  }) async {
    try {
      final productID = await remoteProduct.getProductID();
      final isCreated = await remoteProduct.setProduct(
        product: ProductModel(
          productID: productID,
          category: product.category,
          brand: product.brand,
          colors: product.colors,
          sizes: product.sizes,
          //isNew: product.isNew,
          // isSale: product.isSale,
          // sale: product.sale,
          price: product.price,
          //newPrice: product.newPrice,
          quantity: product.quantity,
          description: product.description,

          imgUrl: product.imgUrl,
        ),
      );
      return Right(isCreated);
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
