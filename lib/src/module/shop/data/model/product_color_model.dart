import 'dart:convert';
import 'package:e_commerce/lib.dart';

ProductColorModel productColorFromJson(Map docMap) =>
    ProductColorModel.fromJson(docMap as Map<String, dynamic>);

String productColorToJson(ProductSizeModel data) => json.encode(data.toJson());

class ProductColorModel extends ProductColorEntity {
  const ProductColorModel({
    final int? quantity,
    final String? color,
  }) : super(
          quantity: quantity,
          color: color,
        );

  factory ProductColorModel.fromJson(Map<String, dynamic> json) =>
      ProductColorModel(
        quantity: json['quantity'] as int,
        color: json['color'] as String,
      );

  Map<String, dynamic> toJson() => {
        "quantity": quantity ?? 0,
        "color": color ?? '',
      };
}
