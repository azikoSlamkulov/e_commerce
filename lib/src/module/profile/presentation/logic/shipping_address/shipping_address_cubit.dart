import 'package:e_commerce/lib.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'shipping_address_state.dart';

class ShippingAddressCubit extends Cubit<ShippingAddressState> {
  final AddShippingAddress addAddress;
  final GetAllShippingAddress getAllAddresses;
  final UpdateShippingAddress updateAddress;
  final SelectDefaultShippingAddress selectDefaultAddress;
  ShippingAddressCubit({
    required this.addAddress,
    required this.getAllAddresses,
    required this.updateAddress,
    required this.selectDefaultAddress,
  }) : super(InitialShippingAddresState());

  void getShippingAddress({required String userId}) async {
    emit(LoadingShippingAddresState());
    final allShippingAddresses =
        await getAllAddresses(GetAllShippingAddressParams(userId: userId));
    allShippingAddresses.fold(
      (error) => emit(const ShippingAddresFailureState('')),
      (allShippingaddress) =>
          emit(LoadedShippingAddressState(allShippingaddress)),
    );
  }

  void addShippingAddress({required ShippingAddressEntity address}) async {
    emit(LoadingShippingAddresState());
    final isCreated = await addAddress(AddShippingAddressParams(
      address: address,
    ));
    isCreated.fold(
      (error) => emit(const ShippingAddresFailureState('')),
      (_isCreated) => emit(AddedShippingAddresState(_isCreated)),
    );
  }

  void updateShippingAddress(
      {required ShippingAddressEntity newAddress}) async {
    emit(LoadingShippingAddresState());
    final isUpdated = await updateAddress(UpdateShippngAddressParams(
      address: newAddress,
    ));
    isUpdated.fold(
      (error) => emit(const ShippingAddresFailureState('')),
      (isUpdated) => emit(UpdatedShippingAddresState(isUpdated)),
    );
  }

  void selectDefaultShippingAddress({
    required String userId,
    required String addressId,
  }) async {
    emit(LoadingShippingAddresState());
    final isSelected = await selectDefaultAddress(SelectDefaultAddressParams(
      userId: userId,
      addressId: addressId,
    ));
    isSelected.fold(
      (error) => emit(const ShippingAddresFailureState('')),
      (isSelected) => emit(UpdatedShippingAddresState(isSelected)),
    );
  }
}
