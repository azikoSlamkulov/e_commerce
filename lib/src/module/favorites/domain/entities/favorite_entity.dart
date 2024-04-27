import 'package:equatable/equatable.dart';

class FavoriteEntity extends Equatable {
  final String? productID;
  final String? userID;
  final String? size;
  final String? color;
  final String? categoryName;
  final String? brand;
  final double? price;
  final double? newPrice;
  final bool? isSale;
  final int? sale;
  final String? imgUrl;
  final String? createdDate;

  const FavoriteEntity({
    this.productID,
    this.userID,
    this.size,
    this.color,
    this.categoryName,
    this.brand,
    this.price,
    this.newPrice,
    this.isSale,
    this.sale,
    this.imgUrl,
    this.createdDate,
  });

  @override
  List<Object?> get props => [
        productID,
        userID,
        size,
        color,
        categoryName,
        brand,
        price,
        newPrice,
        isSale,
        sale,
        imgUrl,
        createdDate,
      ];
}
