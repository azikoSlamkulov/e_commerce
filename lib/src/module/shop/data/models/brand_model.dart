import 'dart:convert';

import 'package:e_commerce/src/module/shop/domain/entities/brand_entity.dart';

BrandModel brandFromJson(Map docMap) =>
    BrandModel.fromJson(docMap as Map<String, dynamic>);

String brandToJson(BrandModel data) => json.encode(data.toJson());

class BrandModel extends BrandEntity {
  BrandModel({
    final String? id,
    final String? name,
    final bool? isCheked,
  }) : super(
          id: id,
          name: name,
          isCheked: isCheked,
        );

  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
        id: json['id'] as String,
        name: json['name'] as String,
        isCheked: json['isCheked'] as bool,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? '',
        "name": name ?? '',
        "isCheked": isCheked ?? false,
      };
}
