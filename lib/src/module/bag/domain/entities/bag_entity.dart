import 'package:equatable/equatable.dart';

class BagEntity extends Equatable {
  final String? productID;
  final String? userID;
  final String? name;
  final String? color;
  final String? size;
  final double? price;
  final int? quantity;
  final String? productImgUrl;

  const BagEntity({
    this.productID,
    this.userID,
    this.name,
    this.color,
    this.size,
    this.price,
    this.quantity,
    this.productImgUrl,
  });

  @override
  List<Object?> get props => [
        productID,
        userID,
        name,
        color,
        size,
        price,
        quantity,
        productImgUrl,
      ];
}
