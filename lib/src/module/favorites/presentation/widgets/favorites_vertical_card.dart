import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FavoritesVerticalCard extends StatelessWidget {
  const FavoritesVerticalCard({
    required this.userID,
    required this.product,
    //required this.isSale,
    required this.onTap,
    //required this.sizedHeight,
    this.sizedWidth = 140,
    super.key,
  });

  final String userID;
  final FavoriteEntity product;
  //final bool isSale;
  final VoidCallback onTap;
  final double sizedWidth;
  //final double sizedHeight;

  @override
  Widget build(BuildContext context) {
    double sumRating = 0;
    int totalUser = 0;

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

    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 220,
            child: Stack(
              children: [
                ///Image
                Container(
                  height: 192.h,
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
                  child: product.isSale! // || product.isNew!
                      ? Container(
                          padding: REdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: product.isSale! ? Colors.red : Colors.black,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text(
                            product.isSale! ? '-${product.sale}%' : 'New',
                            style: AppTextStyles.white11,
                          ),
                        )
                      : const SizedBox(),
                ),

                /// Add to cart button
                Positioned(
                  bottom: 15.h,
                  right: -10.5.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: REdgeInsets.all(10),
                      shape: const CircleBorder(),
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {
                      // BlocProvider.of<BagBloc>(context).add(
                      //   SetProductToCartEvent(
                      //     BagEntity(
                      //       productID: product.id,
                      //       userID: userID,
                      //       name: product.categoryName,
                      //       color: product.color,
                      //       size: product.size,
                      //       price: product.price,
                      //       productImgUrl: product.imgUrl,
                      //     ),
                      //   ),
                      // );
                    },
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.white,
                      size: 25.h,
                    ),
                  ),
                ),

                /// close button
                Positioned(
                  top: -8.h,
                  right: -8.h,
                  child: IconButton(
                    onPressed: () {
                      BlocProvider.of<FavoritesBloc>(context).add(
                        DeleteProductFromFavoritesEvent(
                          userID: userID,
                          productID: product.productID!,
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.close,
                      color: AppColors.grey,
                      size: 20.h,
                    ),
                  ),
                ),

                /// Rating
                Positioned(
                  bottom: 00.h,
                  left: -1.h,
                  // TODO Переделать totalRating и totalUser
                  child: AppRatingBarIndicator(
                    totalRating: 0,
                    totalUser: 0,
                    itemSize: 16.h,
                    textStyle: AppTextStyles.grey10,
                  ),
                  // child: Row(
                  //   children: [
                  //     RatingBarIndicator(
                  //       rating: sumRating,
                  //       //rating: product.rating!,
                  //       itemBuilder: (context, index) => const Icon(
                  //         Icons.star,
                  //         color: Colors.amber,
                  //       ),
                  //       unratedColor: Colors.black12,
                  //       itemCount: 5,
                  //       itemSize: 16.0.h,
                  //       direction: Axis.horizontal,
                  //     ),
                  //     5.horizontalSpace,
                  //     Text(
                  //       '($totalUser)',
                  //       //'(105)',

                  //       style: AppTextStyles.grey10,
                  //     )
                  //   ],
                  // ),
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
            product.categoryName!,
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
                //'color',
                style: AppTextStyles.black11,
              ),
              25.horizontalSpace,
              Text(
                'Size: ',
                style: AppTextStyles.grey11,
              ),
              Text(
                product.size!,
                //'size',
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
    );
  }
}
