import 'dart:convert';
import 'package:e_commerce/lib.dart';

CategoryModel categoryFromJson(Map docMap) =>
    CategoryModel.fromJson(docMap as Map<String, dynamic>);

String categoryToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    id,
    typeName,
    collectionName,
    categoryName,
  }) : super(
          id: id,
          typeName: typeName,
          collectionName: collectionName,
          categoryName: categoryName,
        );

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['id'] as String,
        typeName: json['type'] as String,
        collectionName: json['collection'] as String,
        categoryName: json['category'] as String,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? '',
        "type": typeName ?? '',
        "collection": collectionName ?? '',
        "category": categoryName ?? '',
      };
}
