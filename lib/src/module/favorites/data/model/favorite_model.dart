import 'dart:convert';

import '../../../../../lib.dart';

FavoriteModel favoriteProductFromJson(Map docMap) =>
    FavoriteModel.fromJson(docMap as Map<String, dynamic>);

String favoriteProductToJson(FavoriteModel data) => json.encode(data.toJson());

class FavoriteModel extends FavoriteEntity {
  FavoriteModel({
    final String? productID,
    final String? userID,
    final String? productSize,
    // final String? categoryName,
    // final String? brand,
    // final String? color,
    // final String? size,
    // final double? price,
    // final double? newPrice,
    // final bool? isSale,
    // final int? sale,
    // final String? productImgUrl,
    // final String? createdDate,
  }) : super(
          productID: productID,
          userID: userID,
          productSize: productSize,
          // categoryName: categoryName,
          // brand: brand,
          // color: color,
          // size: size,
          // price: price,
          // newPrice: newPrice,
          // isSale: isSale,
          // sale: sale,
          // productImgUrl: productImgUrl,
          // createdDate: createdDate,
        );

  factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
        productID: json['productID'] as String,
        userID: json['userID'] as String,
        productSize: json['productSize'] as String,
        // categoryName: json['categoryName'] as String,
        // brand: json['brand'] as String,
        // color: json['color'] as String,
        // size: json['size'] as String,
        // price: json['price'] as double,
        // newPrice: json['newPrice'] as double,
        // isSale: json['isSale'] as bool,
        // sale: json['sale'] as int,
        // productImgUrl: json['productImgUrl'] as String,
        // createdDate: json['createdDate'] as String,
      );

  Map<String, dynamic> toJson() => {
        "productID": productID ?? '',
        "userID": userID ?? '',
        "productSize": productSize ?? '',
        // "categoryName": categoryName ?? '',
        // "brand": brand ?? '',
        // "color": color ?? '',
        // "size": size ?? '',
        // "price": price ?? 0.0,
        // "newPrice": newPrice ?? 0,
        // "isSale": isSale ?? false,
        // "sale": sale ?? 0,
        // "productImgUrl": productImgUrl ?? '',
        // "createdDate": createdDate ?? '',
      };
}
