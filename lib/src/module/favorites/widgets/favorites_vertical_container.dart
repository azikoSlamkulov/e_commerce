import 'package:e_commerce/src/module/shop/domain/entities/product_entity.dart';
import 'package:e_commerce/src/util/app_constants/text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritesVerticalContainer extends StatelessWidget {
  const FavoritesVerticalContainer({
    super.key,
    required this.product,
    //required this.isSale,
    required this.onTap,
    required this.sizedHeight,
    this.sizedWidth = 140,
  });

  final ProductEntity product;
  //final bool isSale;
  final VoidCallback onTap;
  final double sizedWidth;
  final double sizedHeight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 13),
        child: SizedBox(
          width: 155.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: sizedHeight,
                child: Stack(
                  children: [
                    ///Image
                    Container(
                      height: 195.h,
                      decoration: BoxDecoration(
                        //color: Colors.greenAccent,
                        image: DecorationImage(
                          image: NetworkImage(product.imgUrl!),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),

                    ///Round text
                    Positioned(
                      top: 10.h,
                      left: 10.h,
                      child: product.isSale! || product.isNew!
                          ? Container(
                              padding: REdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color:
                                    product.isSale! ? Colors.red : Colors.black,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Text(
                                product.isSale! ? '-${product.sale}%' : 'New',
                                style: AppTextStyles.white11,
                              ),
                            )
                          : const SizedBox(),
                    ),

                    /// Favorite button
                    Positioned(
                      bottom: 6.h,
                      right: -10.5.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: REdgeInsets.all(10),
                          shape: const CircleBorder(),
                          backgroundColor: Colors.red,
                        ),
                        onPressed: () {},
                        child: Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.white,
                          size: 25.h,
                        ),
                      ),
                    ),

                    /// Rating
                    Positioned(
                      bottom: 0.h,
                      left: -1.h,
                      child: Row(
                        children: [
                          RatingBarIndicator(
                            rating: 3,
                            //rating: product.rating!,
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            unratedColor: Colors.black12,
                            itemCount: 5,
                            itemSize: 16.0.h,
                            direction: Axis.horizontal,
                          ),
                          5.horizontalSpace,
                          Text(
                            // '(${product.totalUser})',
                            '(105)',

                            style: AppTextStyles.grey10,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              ///Brand
              5.verticalSpace,
              Text(
                product.brand!,
                style: AppTextStyles.grey11,
              ),

              ///Item
              5.verticalSpace,
              Text(
                product.category!,
                style: AppTextStyles.black16Bold,
              ),

              /// Color and size
              5.verticalSpace,
              Row(
                children: [
                  Text(
                    'Color: ',
                    style: AppTextStyles.grey11,
                  ),
                  Text(
                    product.color!,
                    style: AppTextStyles.black11,
                  ),
                  25.horizontalSpace,
                  Text(
                    'Size: ',
                    style: AppTextStyles.grey11,
                  ),
                  Text(
                    product.size!,
                    style: AppTextStyles.black11,
                  ),
                ],
              ),

              ///Prise
              5.verticalSpace,
              !product.isSale!
                  ? Text(
                      '\$${product.price}',
                      style: AppTextStyles.black14Bold,
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
                        5.horizontalSpace,
                        Text(
                          '\$${product.newPrice}',
                          style: AppTextStyles.red14Bold,
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
