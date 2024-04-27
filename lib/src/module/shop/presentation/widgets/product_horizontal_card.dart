import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductHorizontalCard extends StatelessWidget {
  const ProductHorizontalCard({
    super.key,
    required this.product,
    this.allProducts,
    this.favoriteOnTap,
    this.isFavorite = false,
  });

  final ProductEntity product;
  final List<ProductEntity>? allProducts;
  final VoidCallback? favoriteOnTap;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    //final bool isNew = DateTimeFormatter().isNew(product.createdDate!);

    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MobileProductDatailView(
            product: product,
            allProducts: allProducts,
          ),
        ),
      ),
      child: Stack(
        children: [
          Card(
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    /// Image
                    CachedNetworkImageWidget(
                      imageUrl: product.imgUrl!,
                      height: 120.h,
                      width: 135.h,
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

                /// Product info
                Padding(
                  padding: REdgeInsets.all(11),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///Item
                      Text(
                        product.category!.categoryName!,
                        style: AppTextStyles.black16Bold,
                      ),
                      10.verticalSpace,

                      ///Brand
                      Text(
                        product.brand!,
                        style: AppTextStyles.grey11,
                      ),
                      10.verticalSpace,

                      /// Rating
                      AppRatingBarIndicator(product: product, itemSize: 20.h),
                      10.verticalSpace,

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
          !isFavorite
              ? Positioned(
                  bottom: -5.h,
                  right: -14.h,
                  // child: FavoriteToggleIconBtn(
                  //     //isFavorite: product.isFavorite!),
                  //     isFavorite: false);

                  child: FavoriteButtonWidget(product: product),
                )
              : Positioned(
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
        ],
      ),
    );
  }
}
