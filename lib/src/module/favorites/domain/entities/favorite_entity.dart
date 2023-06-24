import 'package:equatable/equatable.dart';

class FavoriteEntity extends Equatable {
  final String? productID;
  final String? userID;
  final String? productSize;
  // final String? categoryName;
  // final String? brand;
  // final String? color;
  // final String? size;
  // final double? price;
  // final double? newPrice;
  // final bool? isSale;
  // final int? sale;
  // final String? productImgUrl;
  // final String? createdDate;

  const FavoriteEntity({
    this.productID,
    this.userID,
    this.productSize,
    // this.categoryName,
    // this.brand,
    // this.color,
    // this.size,
    // this.price,
    // this.newPrice,
    // this.isSale,
    // this.sale,
    // this.productImgUrl,
    // this.createdDate,
  });

  @override
  List<Object?> get props => [
        productID,
        userID,
        productSize,
        // categoryName,
        // brand,
        // color,
        // size,
        // price,
        // newPrice,
        // isSale,
        // sale,
        // productImgUrl,
        // createdDate,
      ];
}
