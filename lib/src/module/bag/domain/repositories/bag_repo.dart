import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';

abstract class BagRepo {
  Future<Either<Failure, List<BagEntity>>> getAllProductsFromCart({
    required String userID,
  });

  Future<Either<Failure, bool>> setProductToCart({
    required BagEntity product,
  });

  Future<Either<Failure, bool>> setNewQuantity({
    required String productID,
    required int newQuantity,
    required double cardTotalPrice,
  });

  Future<Either<Failure, bool>> deleteProductFromCart({
    required String productID,
  });

  Future<Either<Failure, bool>> setOrder({
    required OrderEntity order,
  });
}
