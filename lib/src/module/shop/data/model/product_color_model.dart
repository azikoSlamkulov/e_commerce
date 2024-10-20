import 'dart:convert';
import 'package:e_commerce/lib.dart';

ProductColorModel productColorFromJson(Map docMap) =>
    ProductColorModel.fromJson(docMap as Map<String, dynamic>);

String productColorToJson(ProductColorModel data) => json.encode(data.toJson());

// totalQuantity(List<ProductSizeModel> sizes) {
//   for (var size in sizes) {
//      size.quantity * sizes.length;
//   }
// }

class ProductColorModel extends ProductColorEntity {
  const ProductColorModel({
    final String? color,
    // final List<dynamic>? sizes,
    final SizeModel? colorSizes,
    final List<String>? colorImages,
  }) : super(
          color: color,
          colorSizes: colorSizes,
          colorImages: colorImages,
        );

  factory ProductColorModel.fromJson(Map<String, dynamic> json) =>
      ProductColorModel(
        color: json['color'] as String,
        // sizes: (json['sizes'] as List<dynamic>)
        //     .map((e) => ProductSizeModel.fromJson(e))
        //     .toList(),
        colorSizes: json['colorSizes'] != null
            ? SizeModel.fromJson(json['colorSizes'])
            : const SizeModel(),
        colorImages: (json['colorImages'] as List<dynamic>)
            .map((e) => e as String)
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "color": color ?? '',
        // "sizes": sizes!
        //     .map((item) => ProductSizeModel(
        //           quantity: item.quantity,
        //           size: item.size,
        //         ).toJson())
        //     .toList(),
        "colorSizes": SizeModel(
          xs: colorSizes!.xs,
          s: colorSizes!.s,
          l: colorSizes!.l,
          m: colorSizes!.m,
          xl: colorSizes!.xl,
          totalSizes: colorSizes!.totalSizes,
        ).toJson(),
        "colorImages": colorImages ?? [],
      };
}
