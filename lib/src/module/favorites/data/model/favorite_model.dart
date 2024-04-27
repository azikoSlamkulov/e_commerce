import 'dart:convert';

import '../../../../../lib.dart';

FavoriteModel favoriteProductFromJson(Map docMap) =>
    FavoriteModel.fromJson(docMap as Map<String, dynamic>);

String favoriteProductToJson(FavoriteModel data) => json.encode(data.toJson());

class FavoriteModel extends FavoriteEntity {
  const FavoriteModel({
    productID,
    userID,
    size,
    color,
    categoryName,
    brand,
    price,
    newPrice,
    isSale,
    sale,
    imgUrl,
    createdDate,
  }) : super(
          productID: productID,
          userID: userID,
          size: size,
          color: color,
          categoryName: categoryName,
          brand: brand,
          price: price,
          newPrice: newPrice,
          isSale: isSale,
          sale: sale,
          imgUrl: imgUrl,
          createdDate: createdDate,
        );

  factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
        productID: json['productID'] as String,
        userID: json['userID'] as String,
        size: json['size'] as String,
        color: json['color'] as String,
        categoryName: json['categoryName'] as String,
        brand: json['brand'] as String,
        price: json['price'] as double,
        newPrice: json['newPrice'] as double,
        isSale: json['isSale'] as bool,
        sale: json['sale'] as int,
        imgUrl: json['imgUrl'] as String,
        createdDate: json['createdDate'] as String,
      );

  Map<String, dynamic> toJson() => {
        "productID": productID ?? '',
        "userID": userID ?? '',
        "size": size ?? '',
        "color": color ?? '',
        "categoryName": categoryName ?? '',
        "brand": brand ?? '',
        "price": price ?? 0.0,
        "newPrice": newPrice ?? 0,
        "isSale": isSale ?? false,
        "sale": sale ?? 0,
        "imgUrl": imgUrl ?? '',
        "createdDate": createdDate ?? '',
      };
}
