import 'package:dartz/dartz.dart';

import '../../../../../lib.dart';

class BagRepoImpl implements BagRepo {
  BagRepoImpl({
    required this.remoteProductsFromCart,
  });

  final RemoteProductsFromCart remoteProductsFromCart;

  @override
  Future<Either<Failure, List<BagEntity>>> getAllProductsFromCart(
      {required String userID}) async {
    try {
      final allProducts =
          await remoteProductsFromCart.getAllProductsFromCart(userID: userID);
      return Right(allProducts);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> setProductToCart({
    required BagEntity product,
  }) async {
    try {
      final isCreated = await remoteProductsFromCart.setProductToCart(
        product: BagModel(
          productID: product.productID,
          userID: product.userID,
          name: product.name,
          color: product.color,
          size: product.size,
          price: product.price,
          productImgUrl: product.productImgUrl,
        ),
      );
      return Right(isCreated);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteProductFromCart({
    required String userID,
    required String productID,
  }) async {
    try {
      final isDeleted = await remoteProductsFromCart.deleteProductFromCart(
        userID: userID,
        productID: productID,
      );
      return Right(isDeleted);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
