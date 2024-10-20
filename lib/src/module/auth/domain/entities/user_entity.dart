import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? userID;
  final String? name;
  final String? phoneNumber;
  final String? email;
  final List<dynamic>? orders;
  final List<dynamic>? shippingAddresses;
  final List<dynamic>? paymentMethods;
  //final List<dynamic>? promocodes;
  final List<dynamic>? reviews;
  final String? photoURL;
  final String? role;

  const UserEntity({
    this.userID,
    this.name,
    this.phoneNumber,
    this.email,
    this.orders,
    this.shippingAddresses,
    this.paymentMethods,
    //this.promocodes,
    this.reviews,
    this.photoURL,
    this.role,
  });

  @override
  List<Object?> get props => [
        userID,
        name,
        phoneNumber,
        email,
        orders,
        shippingAddresses,
        paymentMethods,
        //promocodes,
        reviews,
        photoURL,
        role,
      ];
}
