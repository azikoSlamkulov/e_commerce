import 'package:e_commerce/lib.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'shipping_address_state.dart';

class ShippingAddressCubit extends Cubit<ShippingAddressState> {
  final AddShippingAddress addAddress;
  final GetAllShippingAddress getAllShippingAddress;
  ShippingAddressCubit({
    required this.addAddress,
    required this.getAllShippingAddress,
  }) : super(LoadingShippingAddresState());

  void getShippingAddress({required String userId}) async {
    final allShippingaddress = await getAllShippingAddress(
        GetAllShippingAddressParams(userId: userId));
    allShippingaddress.fold(
      (error) => emit(const ShippingAddresFailureState('')),
      (allShippingaddress) =>
          emit(LoadedShippingAddressState(allShippingaddress)),
    );
  }

  void addShippingAddress({required AddressEntity address}) async {
    final isCreated =
        await addAddress(AddShippingAddressParams(address: address));
    isCreated.fold(
      (error) => emit(const ShippingAddresFailureState('')),
      (_isCreated) => emit(AddedShippingAddresState(_isCreated)),
    );
  }
}
