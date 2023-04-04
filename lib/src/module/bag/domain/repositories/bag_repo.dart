import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/bag_entity.dart';

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
