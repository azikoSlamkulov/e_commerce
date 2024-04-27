import 'dart:convert';
import 'package:e_commerce/lib.dart';

AddressModel addressFromJson(Map docMap) =>
    AddressModel.fromJson(docMap as Map<String, dynamic>);

String addressToJson(AddressModel data) => json.encode(data.toJson());

class AddressModel extends AddressEntity {
  AddressModel({
    id,
    userId,
    name,
    address,
    city,
    isCheked,
  }) : super(
          id: id,
          userId: userId,
          name: name,
          address: address,
          city: city,
          isCheked: isCheked,
        );

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        id: json['id'] as String,
        userId: json['userId'] as String,
        name: json['name'] as String,
        address: json['address'] as String,
        city: json['city'] as String,
        isCheked: json['isCheked'] as bool,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? '',
        "userId": userId ?? '',
        "name": name ?? '',
        "address": address ?? '',
        "city": city ?? '',
        "isCheked": isCheked ?? false,
      };
}
