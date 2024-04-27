import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';

abstract class ShippingAddressRepo {
  Future<Either<Failure, List<AddressEntity>>> getAllShippingAddress({
    required String userId,
  });
  Future<Either<Failure, bool>> addShippingAddress({
    required AddressEntity address,
  });
}
