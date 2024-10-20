import 'package:equatable/equatable.dart';

class ProductReviewEntity extends Equatable {
  final String? reviewId;
  final String? productId;
  final String? userId;
  final double? rate;
  final String? reviewText;
  final String? userPhotoUrl;
  final String? userName;
  final List<String>? imgUrlList;
  final String? createdDate;

  const ProductReviewEntity({
    this.reviewId,
    this.productId,
    this.userId,
    this.rate,
    this.reviewText,
    this.userPhotoUrl,
    this.userName,
    this.imgUrlList,
    this.createdDate,
  });

  @override
  List<Object?> get props => [
        reviewId,
        productId,
        userId,
        rate,
        reviewText,
        userPhotoUrl,
        userName,
        imgUrlList,
        createdDate,
      ];
}
