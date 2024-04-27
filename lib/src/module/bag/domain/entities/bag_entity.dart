import 'package:equatable/equatable.dart';

class BagEntity extends Equatable {
  final String? productID;
  final String? name;
  final String? color;
  final String? size;
  final double? pricePerUnit;
  final double? cardTotalPrice;
  final int? quantity;
  final String? productImgUrl;

  const BagEntity({
    this.productID,
    this.name,
    this.color,
    this.size,
    this.pricePerUnit,
    this.cardTotalPrice,
    this.quantity,
    this.productImgUrl,
  });

  @override
  List<Object?> get props => [
        productID,
        name,
        color,
        size,
        pricePerUnit,
        cardTotalPrice,
        quantity,
        productImgUrl,
      ];
}
