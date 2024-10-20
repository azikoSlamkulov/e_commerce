import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';

abstract class ShippingAddressRepo {
  Future<Either<Failure, List<ShippingAddressEntity>>> getAllShippingAddress({
    required String userId,
  });
  Future<Either<Failure, bool>> addShippingAddress({
    required ShippingAddressEntity address,
  });

  Future<Either<Failure, bool>> updateShippingAddress({
    required ShippingAddressEntity address,
  });
}
