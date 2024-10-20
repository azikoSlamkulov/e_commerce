import 'package:e_commerce/src/module/shop/domain/entities/entities.dart';
import 'package:equatable/equatable.dart';

class ProductRatingAndReviewsEntity extends Equatable {
  final String? productId;
  final ProductRatingEntity? rating;
  final List<ProductReviewEntity>? reviews;

  const ProductRatingAndReviewsEntity({
    this.productId,
    this.rating,
    this.reviews,
  });

  @override
  List<Object?> get props => [
        productId,
        rating,
        reviews,
      ];
}
