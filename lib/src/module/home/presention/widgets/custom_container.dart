import 'package:e_commerce/src/module/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../util/app_widgets/buttons/toggle_icon_button.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.product,
    required this.isSale,
  });

  final ProductEntity product;
  final bool isSale;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: Container(
        width: 140,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 220.h,
              child: Stack(
                children: [
                  //Image
                  Container(
                    height: 195.h,
                    decoration: BoxDecoration(
                      //color: Colors.greenAccent,
                      image: DecorationImage(
                        image: NetworkImage(product.photoURL!),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  //Round text
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      padding: REdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: isSale ? Colors.red : Colors.black,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        isSale ? '-${product.sale}%' : 'New',
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  // Favorite button
                  Positioned(
                    bottom: 10,
                    right: -13,
                    child: ToggleIconBtn(isFavorite: product.isFavorite!),
                  ),
                  // Rating
                  Positioned(
                    bottom: 0.h,
                    left: -1.w,
                    child: Row(
                      children: [
                        RatingBarIndicator(
                          rating: product.rating!,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 16.0,
                          direction: Axis.horizontal,
                        ),
                        5.horizontalSpace,
                        Text(
                          '(${product.totalUser})',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //Brand
            5.verticalSpace,
            Text(
              product.brand!,
              style: TextStyle(fontSize: 11.sp, color: Colors.grey),
            ),
            //Item
            5.verticalSpace,
            Text(
              product.item!,
              style: TextStyle(fontSize: 16.sp),
            ),
            //Prise
            5.verticalSpace,
            !isSale
                ? Text(
                    '\$${product.price}',
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                  )
                : Row(
                    children: [
                      Text(
                        '\$${product.price}',
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough),
                      ),
                      10.horizontalSpace,
                      Text(
                        '\$${product.newPrice}',
                        style: TextStyle(fontSize: 14.sp, color: Colors.red),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
