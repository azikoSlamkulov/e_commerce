import 'package:e_commerce/lib.dart';

class ProductRatingModel extends ProductRatingEntity {
  const ProductRatingModel({
    totalRating,
    totalUser,
    one,
    two,
    three,
    four,
    five,
  }) : super(
          totalRating: totalRating,
          totalUser: totalUser,
          one: one,
          two: two,
          three: three,
          four: four,
          five: five,
        );

  factory ProductRatingModel.fromJson(Map<String, dynamic> json) =>
      ProductRatingModel(
        totalRating: json['totalRating'] as int,
        totalUser: json['totalUser'] as int,
        one: json['one'] as int,
        two: json['two'] as int,
        three: json['three'] as int,
        four: json['four'] as int,
        five: json['five'] as int,
      );

  Map<String, dynamic> toJson() => {
        "totalRating": totalRating ?? 0.0,
        "totalUser": totalUser ?? 0,
        "one": one ?? 0,
        "two": two ?? 0,
        "three": three ?? 0,
        "four": four ?? 0,
        "five": five ?? 0,
      };

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
