import 'package:e_commerce/lib.dart';
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String? productID;
  final CategoryEntity? category;
  final String? brand;
  final List<ProductColorEntity>? colors;
  final List<ProductSizeEntity>? sizes;
  final bool? isNew;
  final bool? isSale;
  final int? sale;
  final double? price;
  final double? newPrice;
  final int? quantity;
  final String? description;
  final ProductRatingEntity? rating;
  //final List<ReviewEntity>? review;
  final String? imgUrl;
  final String? createdDate;

  const ProductEntity({
    this.productID,
    this.category,
    this.brand,
    this.colors,
    this.sizes,
    this.isNew,
    this.isSale,
    this.sale,
    this.price,
    this.newPrice,
    this.quantity,
    this.description,
    this.rating,
    //this.review,
    this.imgUrl,
    this.createdDate,
  });

  @override
  List<Object?> get props => [
        productID,
        category,
        brand,
        price,
        brand,
        colors,
        sizes,
        isNew,
        isSale,
        sale,
        price,
        newPrice,
        quantity,
        description,
        rating,
        //review,
        imgUrl,
        createdDate,
      ];
}
