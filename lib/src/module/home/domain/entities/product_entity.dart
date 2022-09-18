import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String? productID;
  final String? brand;
  final String? item;
  final double? rating;
  final int? totalUser;
  final double? price;
  final double? newPrice;
  final bool? isFavorite;
  final bool? isSale;
  final int? sale;
  final bool? isNew;
  final String? photoURL;

  const ProductEntity({
    this.productID,
    this.brand,
    this.item,
    this.rating,
    this.totalUser,
    this.price,
    this.newPrice,
    this.isFavorite,
    this.isSale,
    this.sale,
    this.isNew,
    this.photoURL,
  });

  @override
  List<Object?> get props => [
        productID,
        brand,
        item,
        rating,
        totalUser,
        price,
        newPrice,
        isFavorite,
        isSale,
        sale,
        isNew,
        photoURL,
      ];
}
