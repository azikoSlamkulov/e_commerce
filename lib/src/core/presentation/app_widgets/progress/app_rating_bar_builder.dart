import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AppRatingBarBuilder extends StatefulWidget {
  const AppRatingBarBuilder({
    //required this.product,
    required this.itemSize,
    required this.callback,
    this.textStyle,
    super.key,
  });

  //final dynamic product;
  final double itemSize;
  final TextStyle? textStyle;
  final ValueSetter<double> callback;

  @override
  State<AppRatingBarBuilder> createState() => _AppRatingBarBuilderState();
}

class _AppRatingBarBuilderState extends State<AppRatingBarBuilder> {
  @override
  Widget build(BuildContext context) {
    // double sumRating = 0;
    // int totalUser = 0;

    // sumRating = (product.rating!.one!.toDouble() +
    //         product.rating!.two!.toDouble() +
    //         product.rating!.three!.toDouble() +
    //         product.rating!.four!.toDouble() +
    //         product.rating!.five!.toDouble()) /
    //     5;

    // totalUser = (product.rating!.one! +
    //     product.rating!.two! +
    //     product.rating!.three! +
    //     product.rating!.four! +
    //     product.rating!.five!);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RatingBar.builder(
          unratedColor: Colors.black12,
          itemCount: 5,
          itemSize: widget.itemSize,
          direction: Axis.horizontal,
          itemBuilder: (context, index) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (value) {
            widget.callback(value);
          },
        ),
        // RatingBarIndicator(
        //   rating: sumRating,
        //   itemBuilder: (context, index) => const Icon(
        //     Icons.star,
        //     color: Colors.amber,
        //   ),
        //   unratedColor: Colors.black12,
        //   itemCount: 5,
        //   itemSize: itemSize,
        //   direction: Axis.horizontal,
        // ),
        // 5.horizontalSpace,
        // Text(
        //   '($totalUser)',
        //   style: textStyle ?? AppTextStyles.grey11,
        // )
      ],
    );
  }
}
