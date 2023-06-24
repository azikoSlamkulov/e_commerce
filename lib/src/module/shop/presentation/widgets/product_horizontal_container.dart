import 'package:e_commerce/lib.dart';

class ProductHorizontalContainer extends StatelessWidget {
  const ProductHorizontalContainer({
    super.key,
    required this.product,
    required this.onTap,
    this.favoriteOnTap,
    //required this.isSale,
    //this.sizedWidth = 140,
  });

  final ProductEntity product;
  final VoidCallback onTap;
  final VoidCallback? favoriteOnTap;
  //final bool isSale;
  //final double sizedWidth;

  @override
  Widget build(BuildContext context) {
    //final bool isNew = DateTimeFormatter().isNew(product.createdDate!);
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

            //color: Colors.redAccent.shade100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    /// Image
                    Container(
                      height: 120.h,
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
                  //padding: REdgeInsets.symmetric(horizontal: 20, vertical: 11),
                  padding: REdgeInsets.all(11),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///Item
                      Text(
                        product.categoryName!,
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
                            itemSize: 20.0.h,
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
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthenticatedState) {
                return Positioned(
                  bottom: 8.h,
                  right: -14.h,
                  // child: FavoriteToggleIconBtn(
                  //     //isFavorite: product.isFavorite!),
                  //     isFavorite: false);

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () => customBottomSheet.customModalBottomSheet(
                      context: context,
                      content: SizedBox(
                        height: 352.h,
                        child: Column(
                          children: [
                            Center(
                              child: Padding(
                                padding: REdgeInsets.only(top: 36),
                                child: Text(
                                  'Select size',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            22.verticalSpace,

                            /// Size
                            BlocBuilder<SizesToggleBtnCubit,
                                SizesToggleBtnState>(
                              builder: (context, state) {
                                if (state is SizesInitialState) {
                                  return productVerticalSizeBtn(
                                      context, state.isSelected);
                                } else if (state is SizesSelectedState) {
                                  return productVerticalSizeBtn(
                                      context, state.isSelected);
                                }

                                return const Center(child: Text('Error'));
                              },
                            ),
                            //productHorizontalSizeBtn(context, isSelected),
                            30.verticalSpace,
                            productHorizontalSizeInfoBtn(context),
                            //30.verticalSpace,
                            Padding(
                              padding: REdgeInsets.all(16),
                              child: CustomElevatedButton(
                                sizedBoxHeight: 48.h,
                                sizedBoxWidth: double.infinity,
                                borderRadius: 30,
                                bgColor: AppColors.mainColor,
                                text: Text(
                                  'ADD TO CART',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14.sp),
                                ),
                                onPressed: () {
                                  context.pop(context);
                                  BlocProvider.of<FavoritesBloc>(context).add(
                                    AddProductToFavoritesEvent(
                                      product: FavoriteEntity(
                                        productID: product.id,
                                        userID: state.user.userID,
                                        productSize: 'XL',
                                        // categoryName: product.categoryName,
                                        // brand: product.brand,
                                        // color: product.color,
                                        // size: product.size,
                                        // price: product.price,
                                        // newPrice: product.newPrice,
                                        // isSale: product.isSale,
                                        // sale: product.sale,
                                        // productImgUrl: product.imgUrl,
                                        // createdDate: product.createdDate,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    child: Icon(
                      Icons.favorite_outline,
                      color: Colors.grey,
                      size: 15.h,
                    ),
                    // child: isFavorite
                    //     ? Icon(
                    //         Icons.favorite,
                    //         color: Colors.red,
                    //         size: 15.h,
                    //       )
                    //     : Icon(
                    //         Icons.favorite_outline,
                    //         color: Colors.grey,
                    //         size: 15.h,
                    //       ),
                  ),
                );
              } else {
                return Positioned(
                  bottom: 8.h,
                  right: -14.h,
                  // child: FavoriteToggleIconBtn(
                  //     //isFavorite: product.isFavorite!),
                  //     isFavorite: false);

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {},
                    child: Icon(
                      Icons.favorite_outline,
                      color: Colors.grey,
                      size: 15.h,
                    ),
                    // child: isFavorite
                    //     ? Icon(
                    //         Icons.favorite,
                    //         color: Colors.red,
                    //         size: 15.h,
                    //       )
                    //     : Icon(
                    //         Icons.favorite_outline,
                    //         color: Colors.grey,
                    //         size: 15.h,
                    //       ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

productHorizontalSizeBtn(BuildContext context, List<bool> isSelected) {
  return BlocBuilder<SizesToggleBtnCubit, SizesToggleBtnState>(
    builder: (context, state) {
      if (state is SizesSelectedState) {
        return Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: Container(
            height: 100.h,
            // padding: REdgeInsets.symmetric(
            //   horizontal: 16,
            //   vertical: 24,
            // ),
            //color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomToggleButton(
                      sizedBoxHeight: 40.h,
                      sizedBoxWidth: 122.h,
                      isActivity: isSelected[0],
                      text: 'XS',
                      onPressed: () {
                        BlocProvider.of<SizesToggleBtnCubit>(context)
                            .selected(0);
                      },
                    ),
                    CustomToggleButton(
                      sizedBoxHeight: 40.h,
                      sizedBoxWidth: 122.h,
                      isActivity: isSelected[1],
                      text: 'L',
                      onPressed: () {
                        BlocProvider.of<SizesToggleBtnCubit>(context)
                            .selected(1);
                      },
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomToggleButton(
                      sizedBoxHeight: 40.h,
                      sizedBoxWidth: 122.h,
                      text: 'S',
                      isActivity: isSelected[2],
                      onPressed: () {
                        BlocProvider.of<SizesToggleBtnCubit>(context)
                            .selected(2);
                      },
                    ),
                    CustomToggleButton(
                      sizedBoxHeight: 40.h,
                      sizedBoxWidth: 122.h,
                      isActivity: isSelected[3],
                      text: 'XL',
                      onPressed: () {
                        BlocProvider.of<SizesToggleBtnCubit>(context)
                            .selected(3);
                      },
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomToggleButton(
                      sizedBoxHeight: 40.h,
                      sizedBoxWidth: 122.h,
                      isActivity: isSelected[4],
                      text: 'M',
                      onPressed: () {
                        BlocProvider.of<SizesToggleBtnCubit>(context)
                            .selected(4);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }
      return Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Container(
          height: 100.h,
          // padding: REdgeInsets.symmetric(
          //   horizontal: 16,
          //   vertical: 24,
          // ),
          //color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomToggleButton(
                    sizedBoxHeight: 40.h,
                    sizedBoxWidth: 122.h,
                    isActivity: isSelected[0],
                    text: 'XS',
                    onPressed: () {
                      BlocProvider.of<SizesToggleBtnCubit>(context).selected(0);
                    },
                  ),
                  CustomToggleButton(
                    sizedBoxHeight: 40.h,
                    sizedBoxWidth: 122.h,
                    isActivity: isSelected[1],
                    text: 'L',
                    onPressed: () {
                      BlocProvider.of<SizesToggleBtnCubit>(context).selected(1);
                    },
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomToggleButton(
                    sizedBoxHeight: 40.h,
                    sizedBoxWidth: 122.h,
                    text: 'S',
                    isActivity: isSelected[2],
                    onPressed: () {
                      BlocProvider.of<SizesToggleBtnCubit>(context).selected(2);
                    },
                  ),
                  CustomToggleButton(
                    sizedBoxHeight: 40.h,
                    sizedBoxWidth: 122.h,
                    isActivity: isSelected[3],
                    text: 'XL',
                    onPressed: () {
                      BlocProvider.of<SizesToggleBtnCubit>(context).selected(3);
                    },
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomToggleButton(
                    sizedBoxHeight: 40.h,
                    sizedBoxWidth: 122.h,
                    isActivity: isSelected[4],
                    text: 'M',
                    onPressed: () {
                      BlocProvider.of<SizesToggleBtnCubit>(context).selected(4);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

productHorizontalSizeInfoBtn(BuildContext context) {
  return ListTile(
    shape: const Border(
      top: BorderSide(color: Colors.black12, width: 0.5),
      bottom: BorderSide(color: Colors.black12, width: 0.5),
    ),
    onTap: () {
      // GoRouter.of(context).goNamed(
      //   APP_PAGE.shopBrand.toName,
      // );
    },
    title: Text(
      'Size info',
      style: AppTextStyles.black16,
    ),
    trailing: const Icon(Icons.chevron_right),
  );
}
