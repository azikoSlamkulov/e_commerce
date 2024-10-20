part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class InitialUserInfoEvent extends ProfileEvent {}

class GetUserInfoEvent extends ProfileEvent {
  final String userId;
  const GetUserInfoEvent(this.userId);
}

class UpdateUserEvent extends ProfileEvent {
  final UserEntity user;
  const UpdateUserEvent(this.user);
}

class GetAllShippingAddressEvent extends ProfileEvent {
  final String userId;
  const GetAllShippingAddressEvent(this.userId);
}

class AddShippingAddressEvent extends ProfileEvent {
  final ShippingAddressEntity address;
  const AddShippingAddressEvent(this.address);
}

class UpdateShippingAddressEvent extends ProfileEvent {
  final ShippingAddressEntity address;
  const UpdateShippingAddressEvent(this.address);
}

class SelectShippingAddressEvent extends ProfileEvent {
  final String userId;
  final String addressId;
  const SelectShippingAddressEvent(this.userId, this.addressId);
}
