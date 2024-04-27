import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FavoritesHorizontalCard extends StatelessWidget {
  const FavoritesHorizontalCard({
    required this.userID,
    required this.product,
    required this.onTap,
    super.key,
    //required this.isSale,
    //this.sizedWidth = 140,
  });

  final String userID;
  final FavoriteEntity product;
  final VoidCallback onTap;

  //final bool isSale;
  //final double sizedWidth;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Card(
            //color: Colors.blue,
            clipBehavior: Clip.hardEdge,
            //elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0.r),
            ),
            //margin: REdgeInsets.only(top: 0, left: 16, right: 16, bottom: 20),
            //color: Colors.redAccent.shade100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    /// Image
                    Container(
                      height: 130.h,
                      width: 135.h,
                      decoration: BoxDecoration(
                        //color: Colors.greenAccent,
                        image: DecorationImage(
                          image: NetworkImage(product.imgUrl!),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.r),
                          bottomLeft: Radius.circular(10.r),
                        ),
                      ),
                    ),
                    // Image.network(
                    //   product.photoURL!,
                    //   fit: BoxFit.fill,
                    //   width: 140.h,
                    //   height: 155.h,
                    // ),

                    ///Round text
                    Positioned(
                      top: 10.h,
                      left: 10.h,
                      child: product.isSale! // || product.isNew!
                          ? Container(
                              padding: REdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color:
                                    product.isSale! ? Colors.red : Colors.black,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Text(
                                product.isSale! ? '-${product.sale}%' : 'New',
                                style: AppTextStyles.white8,
                              ),
                            )
                          : const SizedBox(),
                    ),
                  ],
                ),
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 20, vertical: 11),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///Brand
                      Text(
                        product.brand!,
                        style: AppTextStyles.grey11,
                      ),
                      5.verticalSpace,

                      ///Item
                      Text(
                        product.categoryName!,
                        style: AppTextStyles.black16Bold,
                      ),
                      5.verticalSpace,

                      /// Color and size
                      //5.verticalSpace,
                      Row(
                        children: [
                          Text(
                            'Color: ',
                            style: AppTextStyles.grey11,
                          ),
                          Text(
                            //product.color!,
                            'color',
                            style: AppTextStyles.black11,
                          ),
                          25.horizontalSpace,
                          Text(
                            'Size: ',
                            style: AppTextStyles.grey11,
                          ),
                          Text(
                            //product.size!,
                            'size',
                            style: AppTextStyles.black11,
                          ),
                        ],
                      ),

                      /// Rating
                      5.verticalSpace,
                      Row(
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
                            style: AppTextStyles.grey11,
                          )
                        ],
                      ),
                      5.verticalSpace,

                      ///Prise
                      !product.isSale!
                          ? Text(
                              '\$${product.price}',
                              style: AppTextStyles.black14Bold,
                            )
                          : Row(
                              children: [
                                Text(
                                  '\$${product.price}',
                                  style: AppTextStyles.specGrey14,
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
              ],
            ),
          ),

          /// Favorite button
          Positioned(
            bottom: -3.h,
            right: -10.h,
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

          /// close button
          Positioned(
            top: -5.h,
            right: -5.h,
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
        ],
      ),
    );
  }
}
