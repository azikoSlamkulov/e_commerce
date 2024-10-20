import 'dart:convert';
import 'package:e_commerce/lib.dart';

ProductModel productFromJson(Map docMap) =>
    ProductModel.fromJson(docMap as Map<String, dynamic>);

String productToJson(ProductModel data) => json.encode(data.toJson());

ProductModel productToModel(String id, ProductDatailEntity entity) =>
    ProductModel(
      id: id,
      category: entity.category,
      brand: entity.brand,
      color: entity.color,
      isNew: entity.isNew,
      isSale: entity.isSale,
      sale: entity.sale,
      price: entity.price,
      newPrice: entity.newPrice,
      totalRating: entity.totalRating,
      totalUser: entity.totalUser,
      mainImgUrl: entity.mainImgUrl,
    );

class ProductModel extends ProductEntity {
  const ProductModel({
    final id,
    final category,
    final brand,
    final color,
    final isNew,
    final isSale,
    final sale,
    final price,
    final newPrice,
    final totalRating,
    final totalUser,
    final mainImgUrl,
    final createdDate,
  }) : super(
          id: id,
          category: category,
          brand: brand,
          color: color,
          isNew: isNew,
          isSale: isSale,
          sale: sale,
          price: price,
          newPrice: newPrice,
          totalRating: totalRating,
          totalUser: totalUser,
          mainImgUrl: mainImgUrl,
          createdDate: createdDate,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'] as String,
        category: json['category'] != null
            ? CategoryModel.fromJson(json['category'])
            : const CategoryModel(),
        brand: json['brand'] as String,
        color: json['color'] as String,
        isNew: json['isNew'] as bool,
        isSale: json['isSale'] as bool,
        sale: json['sale'] as int,
        price: json['price'] as double,
        newPrice: json['newPrice'] as double,
        totalRating: json['totalRating'] as double,
        totalUser: json['totalUser'] as int,
        mainImgUrl: json['mainImgUrl'] as String,
        createdDate: json['createdDate'] as String,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? '',
        "category": CategoryModel(
          id: '',
          typeName: category!.typeName,
          collectionName: category!.collectionName,
          categoryName: category!.categoryName,
        ).toJson(),
        "brand": brand ?? '',
        "color": color ?? '',
        "isNew": isNew ?? true,
        "isSale": isSale ?? false,
        "sale": sale ?? 0,
        "price": price ?? 0.0,
        "newPrice": newPrice ?? 0.0,
        "totalRating": totalRating ?? 0.0,
        "totalUser": totalUser ?? 0,
        "mainImgUrl": mainImgUrl ?? '',
        "createdDate": createdDate ?? DateTime.now().toString(),
      };
}
