import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AppRatingBarIndicator extends StatelessWidget {
  const AppRatingBarIndicator({
    required this.totalRating,
    required this.totalUser,
    required this.itemSize,
    this.textStyle,
    super.key,
  });

  final double totalRating;
  final int totalUser;
  final double itemSize;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBarIndicator(
          rating: totalRating,
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
