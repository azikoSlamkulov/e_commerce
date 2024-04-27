import 'dart:convert';

import '../../../../../lib.dart';

BagModel bagProductFromJson(Map docMap) =>
    BagModel.fromJson(docMap as Map<String, dynamic>);

String bagProductToJson(BagModel data) => json.encode(data.toJson());

class BagModel extends BagEntity {
  BagModel({
    final String? productID,
    final String? name,
    final String? color,
    final String? size,
    final double? pricePerUnit,
    final double? cardTotalPrice,
    final int? quantity,
    final String? productImgUrl,
  }) : super(
          productID: productID,
          name: name,
          color: color,
          size: size,
          pricePerUnit: pricePerUnit,
          cardTotalPrice: cardTotalPrice,
          quantity: quantity,
          productImgUrl: productImgUrl,
        );

  factory BagModel.fromJson(Map<String, dynamic> json) => BagModel(
        productID: json['productID'] as String,
        name: json['name'] as String,
        color: json['color'] as String,
        size: json['size'] as String,
        pricePerUnit: json['pricePerUnit'] as double,
        cardTotalPrice: json['cardTotalPrice'] as double,
        quantity: json['quantity'] as int,
        productImgUrl: json['productImgUrl'] as String,
      );

  Map<String, dynamic> toJson() => {
        "productID": productID ?? '',
        "name": name ?? '',
        "color": color ?? '',
        "size": size ?? '',
        "pricePerUnit": pricePerUnit ?? 0.0,
        "cardTotalPrice": cardTotalPrice ?? 0.0,
        "quantity": quantity ?? 1,
        "productImgUrl": productImgUrl ?? '',
      };
}
