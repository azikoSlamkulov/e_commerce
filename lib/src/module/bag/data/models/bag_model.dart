import 'dart:convert';

import '../../domain/entities/bag_entity.dart';

BagModel bagProductFromJson(Map docMap) =>
    BagModel.fromJson(docMap as Map<String, dynamic>);

String bagProductToJson(BagModel data) => json.encode(data.toJson());

class BagModel extends BagEntity {
  BagModel({
    final String? productID,
    final String? userID,
    final String? name,
    final String? color,
    final String? size,
    final double? price,
    final int? quantity,
    final String? productImgUrl,
  }) : super(
          productID: productID,
          userID: userID,
          name: name,
          color: color,
          size: size,
          price: price,
          quantity: quantity,
          productImgUrl: productImgUrl,
        );

  factory BagModel.fromJson(Map<String, dynamic> json) => BagModel(
        productID: json['productID'] as String,
        userID: json['userID'] as String,
        name: json['name'] as String,
        color: json['color'] as String,
        size: json['size'] as String,
        price: json['price'] as double,
        quantity: json['quantity'] as int,
        productImgUrl: json['productImgUrl'] as String,
      );

  Map<String, dynamic> toJson() => {
        "productID": productID ?? '',
        "userID": userID ?? '',
        "name": name ?? '',
        "color": color ?? '',
        "size": size ?? '',
        "price": price ?? 0.0,
        "quantity": quantity ?? 1,
        "productImgUrl": productImgUrl ?? '',
      };
}
