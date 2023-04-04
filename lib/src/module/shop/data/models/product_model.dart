import 'dart:convert';

import '../../domain/entities/product_entity.dart';

ProductModel productFromJson(Map docMap) =>
    ProductModel.fromJson(docMap as Map<String, dynamic>);

String productToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel extends ProductEntity {
  ProductModel({
    final String? id,
    //final String? name,
    final String? type,
    final String? collection,
    final String? category,
    final String? brand,
    final String? color,
    final String? size,
    final bool? isNew,
    final bool? isSale,
    final int? sale,
    final double? price,
    final double? newPrice,
    final int? quantity,
    final String? description,
    //final double? rating,
    final String? imgUrl,
    final String? createdDate,
  }) : super(
          id: id,
          //name: name,
          type: type,
          collection: collection,
          category: category,
          brand: brand,
          color: color,
          size: size,
          isNew: isNew,
          isSale: isSale,
          sale: sale,
          price: price,
          newPrice: newPrice,
          quantity: quantity,
          description: description,
          //rating: rating,
          imgUrl: imgUrl,
          createdDate: createdDate,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'] as String,
        //name: json['name'] as String,
        type: json['type'] as String,
        collection: json['collection'] as String,
        category: json['category'] as String,
        brand: json['brand'] as String,
        color: json['color'] as String,
        size: json['size'] as String,
        isNew: json['isNew'] as bool,
        isSale: json['isSale'] as bool,
        sale: json['sale'] as int,
        price: json['price'] as double,
        newPrice: json['newPrice'] as double,
        quantity: json['quantity'] as int,
        description: json['description'] as String,
        //rating: json['rating'] as double,
        imgUrl: json['imgUrl'] as String,
        createdDate: json['createdDate'] as String,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? '',
        //"name": name ?? '',
        "type": type ?? '',
        "collection": collection ?? '',
        "category": category ?? '',
        "brand": brand ?? '',
        "color": color ?? '',
        "size": size ?? '',
        "isNew": isNew ?? false,
        "isSale": isSale ?? false,
        "sale": sale ?? 0,
        "price": price ?? 0.0,
        "newPrice": newPrice ?? 0.0,
        "quantity": quantity ?? 0,
        "description": description ?? '',
        //"rating": rating ?? 0.0,
        "imgUrl": imgUrl ?? '',
        "createdDate": createdDate ?? DateTime.now().toString(),
      };
}
