import 'dart:convert';
import 'package:e_commerce/lib.dart';

ProductSizeModel productSizeFromJson(Map docMap) =>
    ProductSizeModel.fromJson(docMap as Map<String, dynamic>);

String productSizeToJson(ProductSizeModel data) => json.encode(data.toJson());

class ProductSizeModel extends ProductSizeEntity {
  const ProductSizeModel({
    final int? quantity,
    final String? size,
  }) : super(
          quantity: quantity,
          size: size,
        );

  factory ProductSizeModel.fromJson(Map<String, dynamic> json) =>
      ProductSizeModel(
        quantity: json['quantity'] as int,
        size: json['size'] as String,
      );

  Map<String, dynamic> toJson() => {
        "quantity": quantity ?? 0,
        "size": size ?? '',
      };
}
