import 'dart:convert';
import 'package:e_commerce/lib.dart';

CategoryModel categoryFromJson(Map docMap) =>
    CategoryModel.fromJson(docMap as Map<String, dynamic>);

String categoryToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel extends CategoryEntity {
  CategoryModel({
    final String? id,
    final String? type,
    final String? collectionName,
    final String? categoryName,
    final String? imageURL,
    bool? isCheked,
  }) : super(
          id: id,
          type: type,
          collectionName: collectionName,
          categoryName: categoryName,
          imageURL: imageURL,
          isCheked: isCheked,
        );

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['id'] as String,
        type: json['type'] as String,
        collectionName: json['collection'] as String,
        categoryName: json['category'] as String,
        imageURL: json['imageURL'] as String,
        isCheked: json['isCheked'] as bool,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? '',
        "type": type ?? '',
        "collection": collectionName ?? '',
        "category": categoryName ?? '',
        "imageURL": imageURL ?? '',
        "isCheked": isCheked ?? false,
      };
}
