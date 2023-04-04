import 'dart:convert';

import 'package:e_commerce/src/module/shop/domain/entities/category_entity.dart';

CategoryModel categoryFromJson(Map docMap) =>
    CategoryModel.fromJson(docMap as Map<String, dynamic>);

String categoryToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel extends CategoryEntity {
  CategoryModel({
    final String? id,
    final String? type,
    final String? collection,
    final String? category,
    final String? imageURL,
    bool? isCheked,
  }) : super(
          id: id,
          type: type,
          collection: collection,
          category: category,
          imageURL: imageURL,
          isCheked: isCheked,
        );

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['id'] as String,
        type: json['type'] as String,
        collection: json['collection'] as String,
        category: json['category'] as String,
        imageURL: json['imageURL'] as String,
        isCheked: json['isCheked'] as bool,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? '',
        "type": type ?? '',
        "collection": collection ?? '',
        "category": category ?? '',
        "imageURL": imageURL ?? '',
        "isCheked": isCheked ?? false,
      };
}
