import 'dart:convert';
import 'package:e_commerce/lib.dart';

ProductReviewModel reviewsFromJson(Map docMap) =>
    ProductReviewModel.fromJson(docMap as Map<String, dynamic>);

String reviewsToJson(ProductReviewModel data) => json.encode(data.toJson());

ProductReviewModel productReviewToModel(
        String id, ProductReviewEntity entity) =>
    ProductReviewModel(
      reviewId: entity.reviewId,
      productId: entity.productId,
      userId: entity.userId,
      rate: entity.rate,
      reviewText: entity.reviewText,
      userPhotoUrl: entity.userPhotoUrl,
      userName: entity.userName,
      imgUrlList: entity.imgUrlList,
      createdDate: entity.createdDate,
    );

class ProductReviewModel extends ProductReviewEntity {
  const ProductReviewModel({
    String? reviewId,
    String? productId,
    String? userId,
    double? rate,
    String? reviewText,
    String? userPhotoUrl,
    String? userName,
    List<String>? imgUrlList,
    String? createdDate,
  }) : super(
          reviewId: reviewId,
          productId: productId,
          userId: userId,
          rate: rate,
          reviewText: reviewText,
          userPhotoUrl: userPhotoUrl,
          userName: userName,
          imgUrlList: imgUrlList,
          createdDate: createdDate,
        );

  factory ProductReviewModel.fromJson(Map<String, dynamic> json) =>
      ProductReviewModel(
        reviewId: json['reviewID'] as String,
        productId: json['productID'] as String,
        userId: json['userID'] as String,
        rate: json['rate'] as double,
        reviewText: json['reviewText'] as String,
        userPhotoUrl: json['userPhotoUrl'] as String,
        userName: json['userName'] as String,
        imgUrlList: (json['imgUrlList'] as List<dynamic>)
            .map((e) => e as String)
            .toList(),
        createdDate: json['createdDate'] as String,
      );

  Map<String, dynamic> toJson() => {
        "reviewID": reviewId ?? '',
        "productID": productId ?? '',
        "userID": userId ?? '',
        "rate": rate ?? 0.0,
        "reviewText": reviewText ?? '',
        "userPhotoUrl": userPhotoUrl ?? '',
        "userName": userName ?? '',
        "imgUrlList": imgUrlList ?? [],
        "createdDate": createdDate ?? DateTime.now().toString(),
      };

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
