import 'dart:convert';

import '../../../../../lib.dart';

UserModel authFromJson(Map docMap) =>
    UserModel.fromJson(docMap as Map<String, dynamic>);

String authToJson(UserModel data) => json.encode(data.toJson());

UserModel userToModel(String id, UserEntity entity) => UserModel(
      userID: id,
      name: entity.name,
      phoneNumber: entity.phoneNumber,
      email: entity.email,
      orders: entity.orders,
      shippingAddresses: entity.shippingAddresses,
      paymentMethods: entity.paymentMethods,
      //promocodes: entity.promocodes,
      reviews: entity.reviews,
      photoURL: entity.photoURL,
      role: entity.role,
    );

//Map<String, dynamic> authToJson(AuthModel data) => AuthModel.toJson();

class UserModel extends UserEntity {
  const UserModel({
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
  }) : super(
          userID: userID,
          name: name,
          phoneNumber: phoneNumber,
          email: email,
          orders: orders,
          shippingAddresses: shippingAddresses,
          paymentMethods: paymentMethods,
          //promocodes: promocodes,
          reviews: reviews,
          photoURL: photoURL,
          role: role,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userID: json['userID'] as String,
        name: json['name'] as String,
        phoneNumber: json['phoneNumber'] as String,
        email: json['email'] as String,
        orders: (json['orders'] as List<dynamic>)
            .map((e) => OrderModel.fromJson(e))
            .toList(),
        shippingAddresses: (json['shippingAddresses'] as List<dynamic>)
            .map((e) => ShippingAddressModel.fromJson(e))
            .toList(),
        paymentMethods: (json['paymentMethods'] as List<dynamic>)
            .map((e) => PaymentCardModel.fromJson(e))
            .toList(),
        // promocodes: (json['promocodes'] as List<dynamic>)
        //     .map((e) => ProductReviewModel.fromJson(e))
        //     .toList(),
        reviews: (json['reviews'] as List<dynamic>)
            .map((e) => ProductReviewModel.fromJson(e))
            .toList(),
        photoURL: json['photoURL'] as String,
        role: json['role'] as String,
      );

  Map<String, dynamic> toJson() => {
        "userID": userID,
        "name": name ?? '',
        "phoneNumber": phoneNumber ?? '',
        "email": email ?? '',
        "orders": orders!
            .map((item) => OrderModel(
                  id: item.id,
                  userID: userID,
                  userName: item.userName,
                  orderNumber: item.orderNumber,
                  trackingNumber: item.trackingNumber,
                  status: item.status,
                  items: item.items,
                  shippingAddress: item.shippingAddress,
                  paymentMethod: item.paymentMethod,
                  deliveryMethod: item.deliveryMethod,
                  discount: item.discount,
                  totalAmount: item.totalAmount,
                  createdDate: item.createdDate,
                ).toJson())
            .toList(),
        "shippingAddresses": shippingAddresses!
            .map((item) => ShippingAddressModel(
                  id: item.id,
                  userId: item.userId,
                  userName: item.userName,
                  address: item.address,
                  city: item.city,
                  country: item.country,
                  isCheked: item.isCheked,
                ).toJson())
            .toList(),
        "paymentMethods": paymentMethods!
            .map((item) => PaymentCardModel(
                    id: item.id,
                    userId: item.userId,
                    name: item.name,
                    cardNumber: item.cardNumber,
                    expireDate: item.expireDate,
                    cvv: item.cvv,
                    isCheked: item.isCheked,
                    createdDate: item.createdDate)
                .toJson())
            .toList(),
        "reviews": reviews!
            .map((item) => ProductReviewModel(
                  reviewId: item.reviewId,
                  productId: item.productId,
                  userId: item.userId,
                  userName: item.userName,
                  rate: item.rate,
                  reviewText: item.reviewText,
                  userPhotoUrl: item.userPhotoUrl,
                  imgUrlList: item.imgUrlList,
                  createdDate: item.createdDate,
                ).toJson())
            .toList(),
        "photoURL": photoURL ?? '',
        "role": role ?? '',
      };

  factory UserModel.fromCacheJson(Map<String, dynamic> json) => UserModel(
        userID: json['userID'] as String,
        name: json['name'] as String,
        phoneNumber: json['phoneNumber'] as String,
        email: json['email'] as String,
        photoURL: json['photoURL'] as String,
        role: json['role'] as String,
      );

  Map<String, dynamic> toCacheJson() => {
        "userID": userID,
        "name": name ?? '',
        "phoneNumber": phoneNumber ?? '',
        "email": email ?? '',
        "photoURL": photoURL ?? '',
        "role": role ?? '',
      };
}
