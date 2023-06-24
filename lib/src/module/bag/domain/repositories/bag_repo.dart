import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';

abstract class BagRepo {
  Future<Either<Failure, List<BagEntity>>> getAllProductsFromCart({
    required String userID,
  });

  Future<Either<Failure, bool>> setProductToCart({
    required BagEntity product,
  });

  Future<Either<Failure, bool>> deleteProductFromCart({
    required String userID,
    required String productID,
  });
}
