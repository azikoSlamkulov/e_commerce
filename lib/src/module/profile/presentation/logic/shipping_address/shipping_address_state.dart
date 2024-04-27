part of 'shipping_address_cubit.dart';

abstract class ShippingAddressState extends Equatable {
  const ShippingAddressState();

  @override
  List<Object> get props => [];
}

class LoadingShippingAddresState extends ShippingAddressState {}

class LoadedShippingAddressState extends ShippingAddressState {
  final List<AddressEntity> addressList;
  const LoadedShippingAddressState(this.addressList);
  @override
  List<Object> get props => [addressList];
}

class AddedShippingAddresState extends ShippingAddressState {
  final bool isCreated;
  const AddedShippingAddresState(this.isCreated);
  @override
  List<Object> get props => [isCreated];
}

class ShippingAddresFailureState extends ShippingAddressState {
  final String message;
  const ShippingAddresFailureState(this.message);
  @override
  List<Object> get props => [message];
}
