import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';

class ProfileRepoImpl implements ProfileRepo {
  ProfileRepoImpl({
    required this.remoteProfile,
  });

  final RemoteProfile remoteProfile;

  @override
  Future<Either<Failure, UserEntity>> getUserInfo({
    required String userId,
  }) async {
    try {
      final userInfo = await remoteProfile.getUserInfo(userID: userId);
      return Right(userInfo);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> updateUser({
    required UserEntity user,
  }) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> addShippingAddress(
      {required ShippingAddressEntity newAddress}) async {
    try {
      final addresID =
          await remoteProfile.getShippingAddresID(userID: newAddress.userId!);
      final isCreated = await remoteProfile.addShippingAddress(
        newAddress: shippingAddressToModel(addresID, newAddress),
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
      final allShippingaddress = await remoteProfile.getAllShippingAddress(
        userId: userId,
      );
      //log('====>>>>>>>  $allProducts');
      return Right(allShippingaddress);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> updateShippingAddress(
      {required ShippingAddressEntity newAddress}) async {
    try {
      final isUpdated = await remoteProfile.updateShippingAddress(
        newAddress: shippingAddressToModel(newAddress.id!, newAddress),
      );
      return Right(isUpdated);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> selectDefaultShippingAddress({
    required String userId,
    required String addressId,
  }) async {
    try {
      final isSelected = await remoteProfile.selectDefaultShippingAddress(
        userId: userId,
        addressId: addressId,
      );
      return Right(isSelected);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<PaymentCardEntity>>> getAllPaymentCards({
    required String userId,
  }) async {
    try {
      final allPaymentCards = await remoteProfile.getAllPaymentCards(
        userId: userId,
      );
      return Right(allPaymentCards);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> addNewPaymentCard(
      {required PaymentCardEntity newPaymentCard}) async {
    try {
      final addresID = await remoteProfile.getShippingAddresID(
          userID: newPaymentCard.userId!);
      final isCreated = await remoteProfile.addNewPaymentCard(
        newPaymentCard: paymentCardToModel(addresID, newPaymentCard),
      );
      return Right(isCreated);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> selectDefaultPaymentCard({
    required String userId,
    required String paymentCardId,
  }) async {
    try {
      final isSelected = await remoteProfile.selectDefaultPaymentCard(
        userId: userId,
        paymentCardId: paymentCardId,
      );
      return Right(isSelected);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
