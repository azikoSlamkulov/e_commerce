import 'dart:convert';

import '../../domain/entities/product_entity.dart';

ProductModel productFromJson(Map docMap) =>
    ProductModel.fromJson(docMap as Map<String, dynamic>);

String productToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel extends ProductEntity {
  ProductModel({
    final String? productID,
    final String? brand,
    final String? item,
    final double? rating,
    final int? totalUser,
    final double? price,
    final double? newPrice,
    final bool? isFavorite,
    final bool? isSale,
    final int? sale,
    final bool? isNew,
    final String? photoURL,
  }) : super(
          productID: productID,
          brand: brand,
          item: item,
          rating: rating,
          totalUser: totalUser,
          price: price,
          newPrice: newPrice,
          isFavorite: isFavorite,
          isSale: isSale,
          sale: sale,
          isNew: isNew,
          photoURL: photoURL,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        productID: json['productID'] as String,
        brand: json['brand'] as String,
        item: json['item'] as String,
        rating: json['rating'] as double,
        totalUser: json['totalUser'] as int,
        price: json['price'] as double,
        newPrice: json['newPrice'] as double,
        isFavorite: json['isFavorite'] as bool,
        isSale: json['isSale'] as bool,
        sale: json['sale'] as int,
        isNew: json['isNew'] as bool,
        photoURL: json['photoURL'] as String,
      );

  Map<String, dynamic> toJson() => {
        "productID": productID ?? '',
        "brand": brand ?? '',
        "item": item ?? '',
        "rating": rating ?? 0,
        "totalUser": totalUser ?? 0,
        "price": price ?? 0,
        "newPrice": newPrice ?? 0,
        "isFavorite": isFavorite ?? false,
        "isSale": isSale ?? false,
        "sale": sale ?? 0,
        "isNew": isNew ?? false,
        "photoURL": photoURL ?? '',
      };
}
