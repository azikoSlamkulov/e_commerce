import 'dart:convert';
import 'package:e_commerce/lib.dart';

ProductSizeModel productSizeFromJson(Map docMap) =>
    ProductSizeModel.fromJson(docMap as Map<String, dynamic>);

String productSizeToJson(ProductSizeModel data) => json.encode(data.toJson());

class ProductSizeModel extends ProductSizeEntity {
  const ProductSizeModel({
    final String? productID,
    final String? sizeID,
    final int? quantity,
    final String? size,
  }) : super(
          productID: productID,
          sizeID: sizeID,
          quantity: quantity,
          size: size,
        );

  factory ProductSizeModel.fromJson(Map<String, dynamic> json) =>
      ProductSizeModel(
        productID: json['productID'] as String,
        sizeID: json['sizeID'] as String,
        quantity: json['quantity'] as int,
        size: json['size'] as String,
      );

  Map<String, dynamic> toJson() => {
        "productID": productID ?? '',
        "sizeID": sizeID ?? '',
        "quantity": quantity ?? 0,
        "size": size ?? '',
      };
}
