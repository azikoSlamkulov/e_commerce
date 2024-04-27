import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AppRatingBarIndicator extends StatelessWidget {
  const AppRatingBarIndicator({
    required this.product,
    required this.itemSize,
    this.textStyle,
    super.key,
  });

  final ProductEntity product;
  final double itemSize;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    double sumRating = 0;
    int totalUser = 0;

    sumRating = (product.rating!.one!.toDouble() +
            product.rating!.two!.toDouble() +
            product.rating!.three!.toDouble() +
            product.rating!.four!.toDouble() +
            product.rating!.five!.toDouble()) /
        5;

    totalUser = (product.rating!.one! +
        product.rating!.two! +
        product.rating!.three! +
        product.rating!.four! +
        product.rating!.five!);

    return Row(
      children: [
        RatingBarIndicator(
          rating: sumRating,
          itemBuilder: (context, index) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          unratedColor: Colors.black12,
          itemCount: 5,
          itemSize: itemSize,
          direction: Axis.horizontal,
        ),
        5.horizontalSpace,
        Text(
          '($totalUser)',
          style: textStyle ?? AppTextStyles.grey11,
        )
      ],
    );
  }
}
