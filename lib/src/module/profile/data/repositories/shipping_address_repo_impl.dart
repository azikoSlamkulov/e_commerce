import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';

class ShippingAddressRepoImpl implements ShippingAddressRepo {
  ShippingAddressRepoImpl({
    required this.remoteShippingAddress,
  });

  final RemoteShippingAddress remoteShippingAddress;

  @override
  Future<Either<Failure, bool>> addShippingAddress({
    required ShippingAddressEntity address,
  }) async {
    try {
      final addresID = await remoteShippingAddress.getShippingAddresID(
          userID: address.userId!);
      final isCreated = await remoteShippingAddress.addShippingAddress(
        address: ShippingAddressModel(
          id: addresID,
          userId: address.userId!,
          userName: address.userName!,
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
  Future<Either<Failure, List<ShippingAddressEntity>>> getAllShippingAddress({
    required String userId,
  }) async {
    try {
      final allShippingAddresses =
          await remoteShippingAddress.getAllShippingAddress(
        userId: userId,
      );
      //log('====>>>>>>>  $allProducts');
      return Right(allShippingAddresses);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> updateShippingAddress(
      {required ShippingAddressEntity address}) {
    // TODO: implement updateShippingAddress
    throw UnimplementedError();
  }
}
