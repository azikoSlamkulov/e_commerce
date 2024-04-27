import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';
import 'package:equatable/equatable.dart';

class AddShippingAddress extends UseCase<bool, AddShippingAddressParams> {
  final ShippingAddressRepo shippingAddressRepo;
  AddShippingAddress(this.shippingAddressRepo);

  @override
  Future<Either<Failure, bool>> call(AddShippingAddressParams params) async {
    return await shippingAddressRepo.addShippingAddress(
        address: params.address);
  }
}

class AddShippingAddressParams extends Equatable {
  final AddressEntity address;
  const AddShippingAddressParams({required this.address});

  @override
  List<Object?> get props => [
        address,
      ];
}
