import 'dart:convert';
import 'package:e_commerce/lib.dart';

ProductRatingAndReviewsModel productRatingAndReviewsFromJson(Map docMap) =>
    ProductRatingAndReviewsModel.fromJson(docMap as Map<String, dynamic>);

String productRatingAndReviewsToJson(ProductRatingAndReviewsModel data) =>
    json.encode(data.toJson());

class ProductRatingAndReviewsModel extends ProductRatingAndReviewsEntity {
  const ProductRatingAndReviewsModel({
    String? productId,
    ProductRatingModel? rating,
    List<ProductReviewModel>? reviews,
  }) : super(
          productId: productId,
          rating: rating,
          reviews: reviews,
        );

  factory ProductRatingAndReviewsModel.fromJson(Map<String, dynamic> json) =>
      ProductRatingAndReviewsModel(
        productId: json['productId'] as String,
        rating: json['rating'] != null
            ? ProductRatingModel.fromJson(json['rating'])
            : const ProductRatingModel(),
        reviews: (json['reviews'] as List<dynamic>)
            .map((e) => ProductReviewModel.fromJson(e))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "productId": productId ?? '',
        "ratings": ProductRatingModel(
          totalRating: rating!.totalRating,
          totalUser: rating!.totalUser,
          one: rating!.one,
          two: rating!.two,
          three: rating!.three,
          four: rating!.four,
          five: rating!.five,
        ).toJson(),
        "reviews": reviews!
            .map((item) => ProductReviewModel(
                  reviewId: item.reviewId,
                  productId: item.productId,
                  userId: item.userId,
                  rate: item.rate,
                  reviewText: item.reviewText,
                  userPhotoUrl: item.userPhotoUrl,
                  userName: item.userName,
                  imgUrlList: item.imgUrlList,
                  createdDate: item.createdDate,
                ).toJson())
            .toList(),
      };

  @override
  List<Object?> get props => [
        productId,
        rating,
        reviews,
      ];
}
