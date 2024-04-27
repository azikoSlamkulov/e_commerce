import 'package:equatable/equatable.dart';

class ReviewEntity extends Equatable {
  final String? reviewID;
  final String? productID;
  final String? userID;
  final double? rate;
  final String? reviewText;
  final String? userImg;
  final String? userName;
  final List<String>? imgUrlList;
  final String? createdDate;

  const ReviewEntity({
    this.reviewID,
    this.productID,
    this.userID,
    this.rate,
    this.reviewText,
    this.userImg,
    this.userName,
    this.imgUrlList,
    this.createdDate,
  });

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
