import 'package:equatable/equatable.dart';

class ProductRatingEntity extends Equatable {
  final double? totalRating;
  final int? totalUser;
  final int? one;
  final int? two;
  final int? three;
  final int? four;
  final int? five;

  const ProductRatingEntity({
    this.totalRating,
    this.totalUser,
    this.one,
    this.two,
    this.three,
    this.four,
    this.five,
  });

  @override
  List<Object?> get props => [
        totalRating,
        totalUser,
        one,
        two,
        three,
        four,
        five,
      ];
}
