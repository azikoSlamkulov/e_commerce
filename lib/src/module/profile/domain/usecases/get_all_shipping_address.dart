import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';
import 'package:equatable/equatable.dart';

class GetAllShippingAddress
    extends UseCase<List<AddressEntity>, GetAllShippingAddressParams> {
  final ShippingAddressRepo shippingAddressRepo;
  GetAllShippingAddress(this.shippingAddressRepo);

  @override
  Future<Either<Failure, List<AddressEntity>>> call(
      GetAllShippingAddressParams params) async {
    return await shippingAddressRepo.getAllShippingAddress(
      userId: params.userId,
    );
  }
}

class GetAllShippingAddressParams extends Equatable {
  final String userId;
  const GetAllShippingAddressParams({
    required this.userId,
  });

  @override
  List<Object?> get props => [
        userId,
      ];
}
