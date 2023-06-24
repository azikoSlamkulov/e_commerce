import 'package:e_commerce/lib.dart';

class ProductVerticalContainer extends StatelessWidget {
  const ProductVerticalContainer({
    super.key,
    required this.product,
    required this.onTap,
    this.favoriteOnTap,
    //required this.isSale,
    //this.sizedHeight = 220,
    //this.sizedWidth = 140,
  });

  final ProductEntity product;
  final VoidCallback onTap;
  final VoidCallback? favoriteOnTap;
  //final bool isSale;
  //final double sizedWidth;
  //final double sizedHeight;

  @override
  Widget build(BuildContext context) {
    //final bool isNew = DateTimeFormatter().isNew(product.createdDate!);
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 220.h,
            child: Stack(
              children: [
                ///Image
                Container(
                  height: 192.h, // 184.h
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

                /// Favorite button
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is AuthenticatedState) {
                      String? selectedSize;
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
                          onPressed: () =>
                              customBottomSheet.customModalBottomSheet(
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
                                        selectedSize = state.selectedSize;
                                        return productVerticalSizeBtn(
                                            context, state.isSelected);
                                      }

                                      return const Center(child: Text('Error'));
                                    },
                                  ),
                                  //productVerticalSizeBtn(context, isSelected),
                                  30.verticalSpace,
                                  productVerticalSizeInfoBtn(context),
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
                                            color: Colors.white,
                                            fontSize: 14.sp),
                                      ),
                                      onPressed: () {
                                        context.pop(context);
                                        BlocProvider.of<FavoritesBloc>(context)
                                            .add(
                                          AddProductToFavoritesEvent(
                                            product: FavoriteEntity(
                                              productID: product.id,
                                              userID: state.user.userID,
                                              productSize: 'XL',
                                              // categoryName:
                                              //     product.categoryName,
                                              // brand: product.brand,
                                              // color: product.color,
                                              // size: selectedSize,
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
            product.categoryName!,
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

productVerticalSizeBtn(BuildContext context, List<bool> isSelected) {
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
                      text: 'S',
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
                      text: 'L',
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
                      text: 'M',
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
                      text: 'XL',
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

productVerticalSizeInfoBtn(BuildContext context) {
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
