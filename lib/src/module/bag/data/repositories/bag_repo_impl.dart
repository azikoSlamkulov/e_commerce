import 'package:dartz/dartz.dart';

import '../../../../../lib.dart';

class BagRepoImpl implements BagRepo {
  BagRepoImpl({
    required this.localProductsFromCart,
    required this.remoteProductsFromCart,
  });

  final LocalProductsFromCart localProductsFromCart;
  final RemoteProductsFromCart remoteProductsFromCart;

  @override
  Future<Either<Failure, List<BagEntity>>> getAllProductsFromCart(
      {required String userID}) async {
    try {
      final allProducts = await localProductsFromCart.getAllProductsFromCart();
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
      final isCreated = await localProductsFromCart.setProductToCart(
        product: BagModel(
          productID: product.productID,
          name: product.name,
          color: product.color,
          size: product.size,
          pricePerUnit: product.pricePerUnit,
          cardTotalPrice: product.cardTotalPrice,
          quantity: product.quantity,
          productImgUrl: product.productImgUrl,
        ),
      );
      return Right(isCreated);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> setNewQuantity({
    required String productID,
    required int newQuantity,
    required double cardTotalPrice,
  }) async {
    try {
      final isCreated = await localProductsFromCart.setNewQuantity(
        productID: productID,
        newQuantity: newQuantity,
        cardTotalPrice: cardTotalPrice,
      );
      return Right(isCreated);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteProductFromCart(
      {required String productID}) async {
    try {
      final isDeleted = await localProductsFromCart.deleteProductFromCart(
        productID: productID,
      );
      return Right(isDeleted);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> setOrder({
    required OrderEntity order,
  }) async {
    try {
      final orderID = await remoteProductsFromCart.getOrderID();
      final isCreated = await remoteProductsFromCart.setOrder(
        order: OrderModel(
          id: orderID,
          userID: order.userID,
          userName: order.userName,
          orderNumber: order.orderNumber,
          trackingNumber: order.trackingNumber,
          status: order.status,
          items: order.items,
          shippingAddress: order.shippingAddress,
          paymentMethod: order.paymentMethod,
          deliveryMethod: order.deliveryMethod,
          discount: order.discount,
          totalAmount: order.totalAmount,
          createdDate: order.createdDate,
        ),
      );
      return Right(isCreated);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
