import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';

class ShippingAddressRepoImpl implements ShippingAddressRepo {
  ShippingAddressRepoImpl({
    required this.remoteShippingAddress,
  });

  final RemoteShippingAddress remoteShippingAddress;

  @override
  Future<Either<Failure, bool>> addShippingAddress({
    required AddressEntity address,
  }) async {
    try {
      final addresID = await remoteShippingAddress.getShippingAddresID(
          userID: address.userId!);
      final isCreated = await remoteShippingAddress.addShippingAddress(
        address: AddressModel(
          id: addresID,
          userId: address.userId!,
          name: address.name!,
          address: address.address!,
          city: address.city,
          isCheked: address.isCheked!,
        ),
      );
      return Right(isCreated);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<AddressEntity>>> getAllShippingAddress({
    required String userId,
  }) async {
    try {
      final allShippingaddress =
          await remoteShippingAddress.getAllShippingAddress(
        userId: userId,
      );
      //log('====>>>>>>>  $allProducts');
      return Right(allShippingaddress);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
