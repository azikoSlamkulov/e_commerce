import 'package:e_commerce/lib.dart';
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String? id;
  final CategoryEntity? category;
  final String? brand;
  final String? color;
  final bool? isNew;
  final bool? isSale;
  final int? sale;
  final double? price;
  final double? newPrice;
  final double? totalRating;
  final int? totalUser;
  final String? mainImgUrl;
  final String? createdDate;

  const ProductEntity({
    this.id,
    this.category,
    this.brand,
    this.color,
    this.isNew,
    this.isSale,
    this.sale,
    this.price,
    this.newPrice,
    this.totalRating,
    this.totalUser,
    this.mainImgUrl,
    this.createdDate,
  });

  @override
  List<Object?> get props => [
        id,
        category,
        brand,
        color,
        price,
        brand,
        isNew,
        isSale,
        sale,
        price,
        newPrice,
        totalRating,
        totalUser,
        mainImgUrl,
        createdDate,
      ];
}
