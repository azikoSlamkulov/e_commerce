import 'dart:convert';
import 'package:e_commerce/lib.dart';

ReviewModel reviewsFromJson(Map docMap) =>
    ReviewModel.fromJson(docMap as Map<String, dynamic>);

String reviewsToJson(ReviewModel data) => json.encode(data.toJson());

class ReviewModel extends ReviewEntity {
  const ReviewModel({
    reviewID,
    productID,
    userID,
    rate,
    reviewText,
    userImg,
    userName,
    imgUrlList,
    createdDate,
  }) : super(
          reviewID: reviewID,
          productID: productID,
          userID: userID,
          rate: rate,
          reviewText: reviewText,
          userImg: userImg,
          userName: userName,
          imgUrlList: imgUrlList,
          createdDate: createdDate,
        );

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        reviewID: json['reviewID'] as String,
        productID: json['productID'] as String,
        userID: json['userID'] as String,
        rate: json['rate'] as double,
        reviewText: json['reviewText'] as String,
        userImg: json['userImg'] as String,
        userName: json['userName'] as String,
        imgUrlList: (json['imgUrlList'] as List<dynamic>)
            .map((e) => e as String)
            .toList(),
        createdDate: json['createdDate'] as String,
      );

  Map<String, dynamic> toJson() => {
        "reviewID": reviewID ?? '',
        "productID": productID ?? '',
        "userID": userID ?? '',
        "rate": rate ?? 0.0,
        "reviewText": reviewText ?? '',
        "userImg": userImg ?? '',
        "userName": userName ?? '',
        "imgUrlList": imgUrlList ?? [],
        "createdDate": createdDate ?? DateTime.now().toString(),
      };

  @override
  List<Object?> get props => [
        reviewID,
        productID,
        userID,
        rate,
        reviewText,
        userImg,
        userName,
        imgUrlList,
        createdDate,
      ];
}
