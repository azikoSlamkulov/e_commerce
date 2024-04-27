// import 'package:dartz/dartz.dart';
// import 'package:e_commerce/lib.dart';

// class ProfileRepoImpl implements ProfileRepo {
//   ProfileRepoImpl({
//     required this.remoteShippingAddress,
//   });

//   final RemoteShippingAddress remoteShippingAddress;

//   @override
//   Future<Either<Failure, bool>> addShippingAddress({
//     required AddressEntity address,
//   }) async {
//     try {
//       final addresID = await remoteShippingAddress.getShippingAddresID(
//           userID: address.userId!);
//       final isCreated = await remoteShippingAddress.addShippingAddress(
//         address: AddressModel(
//           id: address.id!,
//           userId: address.userId!,
//           name: address.name!,
//           address: address.address!,
//           isCheked: address.isCheked!,
//         ),
//       );
//       return Right(isCreated);
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   @override
//   Future<Either<Failure, List<AddressEntity>>> getAllShippingAddress() {
//     // TODO: implement getAllShippingAddress
//     throw UnimplementedError();
//   }
// }
