import 'dart:developer';

import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductVerticalCard extends StatelessWidget {
  const ProductVerticalCard({
    super.key,
    required this.product,
    this.allProducts,
    //this.favoriteOnTap,
  });

  final ProductEntity product;
  final List<ProductEntity>? allProducts;
  //final VoidCallback? favoriteOnTap;

  @override
  Widget build(BuildContext context) {
    //final bool isNew = DateTimeFormatter().isNew(product.createdDate!);

    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MobileProductDatailView(
            productId: product.id!,
            allProducts: allProducts,
          ),
        ),
      ),
      child: Stack(
        children: [
          SizedBox(
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ///Image
                      CachedNetworkImageWidget(
                        imageUrl: product.mainImgUrl!,
                        borderRadius: BorderRadius.circular(10),
                        //height: 184.h,
                      ),

                      ///Round text
                      Positioned(
                        top: 10.h,
                        left: 10.h,
                        child: product.isSale! || product.isNew!
                            ? Container(
                                padding: REdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: product.isSale!
                                      ? Colors.red
                                      : Colors.black,
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Text(
                                  product.isSale! ? '-${product.sale}%' : 'New',
                                  style: AppTextStyles.white11,
                                ),
                              )
                            : const SizedBox(),
                      ),
                    ],
                  ),
                  // Container(
                  //   color: Colors.red,
                  //   height: 220.h,
                  //   child: Stack(
                  //     children: [
                  //       ///Image
                  //       CachedNetworkImageWidget(
                  //         imageUrl: product.mainImgUrl!,
                  //         borderRadius: BorderRadius.circular(10),
                  //       ),

                  //       ///Round text
                  //       Positioned(
                  //         top: 10.h,
                  //         left: 10.h,
                  //         child: product.isSale! || product.isNew!
                  //             ? Container(
                  //                 padding: REdgeInsets.all(8),
                  //                 decoration: BoxDecoration(
                  //                   color: product.isSale!
                  //                       ? Colors.red
                  //                       : Colors.black,
                  //                   borderRadius: BorderRadius.circular(12.r),
                  //                 ),
                  //                 child: Text(
                  //                   product.isSale!
                  //                       ? '-${product.sale}%'
                  //                       : 'New',
                  //                   style: AppTextStyles.white11,
                  //                 ),
                  //               )
                  //             : const SizedBox(),
                  //       ),

                  //       // /// Rating
                  //       // Positioned(
                  //       //   bottom: 0.h,
                  //       //   left: -1.h,
                  //       //   child: AppRatingBarIndicator(
                  //       //     totalRating: product.totalRating!,
                  //       //     totalUser: product.totalUser!,
                  //       //     itemSize: 16.h,
                  //       //     textStyle: AppTextStyles.grey10,
                  //       //   ),
                  //       // ),
                  //     ],
                  //   ),
                  // ),

                  /// Rating
                  10.verticalSpace,
                  AppRatingBarIndicator(
                    totalRating: product.totalRating!,
                    totalUser: product.totalUser!,
                    itemSize: 16.h,
                    textStyle: AppTextStyles.grey10,
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
                    product.category!.categoryName!,
                    style: AppTextStyles.black16Bold,
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
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            5.horizontalSpace,
                            Text(
                              '\$${product.newPrice}',
                              style: AppTextStyles.red14Bold,
                            ),
                          ],
                        ),
                  //10.verticalSpace,
                ],
              ),
            ),
          ),

          /// Favorite button
          Positioned(
            bottom: 93.h,
            right: -12.h,
            // child: FavoriteToggleIconBtn(
            //   //isFavorite: product.isFavorite!),
            //   isFavorite: false,
            // ),
            // child: ElevatedButton(
            //   onPressed: () {},
            //   child: Text('Ok'),
            // ),

            child: FavoriteButtonWidget(product: product),
          ),
        ],
      ),
    );
  }
}
