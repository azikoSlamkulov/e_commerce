import 'dart:developer';
import 'package:e_commerce/lib.dart';

class MobileProductDatailView extends StatelessWidget {
  const MobileProductDatailView({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductEntity product;
  //final String productID;

  @override
  Widget build(BuildContext context) {
    return BlocListener<BagBloc, BagState>(
      listener: (context, state) {
        if (state is AddedProductToCartState) {
          //Navigator.pop(context);
          CustomSnackbar().getSnackbar(context: context, title: 'Добавлен.');
        }
      },
      child: NestedMobileProductDatailView(
        product: product,
        //allNewProducts: allNewProducts,
      ),
      // child: BlocBuilder<ProductBloc, ProductState>(
      //   builder: (context, state) {
      //     if (state is LoadingProductState) {
      //       return const Scaffold(
      //         backgroundColor: AppColors.white,
      //         body: Center(
      //           child: CircularProgressIndicator(),
      //         ),
      //       );
      //     } else if (state is LoadedProductState) {
      //       BlocProvider.of<ProductListBloc>(context).add(
      //         GetSortedProductsEvent(
      //           firstQuery: state.product.type,
      //           secondQuery: state.product.collectionName,
      //           thirdQuery: state.product.categoryName,
      //         ),
      //       );
      //       //final allNewProducts = FakeProductData().allFakeProducts;
      //       return NestedMobileProductDatailView(
      //         product: state.product,
      //         //allNewProducts: allNewProducts,
      //       );
      //     } else {
      //       return const Center(child: Text('Login'));
      //     }
      //   },
      // ),
      // child: BlocBuilder<AuthBloc, AuthState>(
      //   builder: (context, state) {
      //     if (state is AuthenticatedState) {
      //       return NestedMobileProductDatailView(
      //         product: product,
      //         allNewProducts: allNewProducts,
      //         userID: state.user.userID!,
      //       );
      //     } else {
      //       return const Center(child: Text('Login'));
      //     }
      //   },
      // ),
    );
    // BlocProvider.of<ProductBloc>(context).add(
    //   GetProductDatailsEvent(
    //     productID: product.id,
    //   ),
    // );
  }
}

class NestedMobileProductDatailView extends StatelessWidget {
  const NestedMobileProductDatailView({
    super.key,
    required this.product,
    //required this.allNewProducts,
    //required this.userID,
  });

  //final List<ProductsListEntity> allNewProducts;
  final ProductEntity product;
  //final String userID;

  @override
  Widget build(BuildContext context) {
    final List<String> sizeItems = ['Size', 'XS', 'S', 'M', 'L', 'XL'];
    final List<String> colorItems = ['Color', 'Black', 'White', 'Red', 'Blue'];
    List<bool> isSelected = [false, false, false, false, false];
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: AppColors.bgColorMain,
      appBar: CustomAppBar(
        title: '${product.categoryName}',
        showShareBtn: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Product image
            Container(
              height: 413.h,
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

            /// choose size and color
            12.verticalSpace,
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                    key: formKey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomDropdownMenu(
                          items: sizeItems,
                          selectedItem: sizeItems[0],
                          validator: (itemIndex) {
                            if (itemIndex == sizeItems[0]) {
                              return 'ssss';
                              log('size');
                            }
                          },
                        ),
                        16.horizontalSpace,
                        CustomDropdownMenu(
                          items: colorItems,
                          selectedItem: colorItems[0],
                          validator: (itemIndex) {
                            if (itemIndex == colorItems[0]) {
                              return 'dddd';
                              //showBottomSheet(context, isSelected);
                              //log('color');
                            }
                          },
                        ),
                        16.horizontalSpace,
                        FavoriteToggleIconBtn(),
                      ],
                    ),
                  ),
                  22.verticalSpace,

                  /// Product datails
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${product.brand}',
                        style: AppTextStyles.black24Bold,
                      ),
                      Text(
                        '\$${product.price}',
                        style: AppTextStyles.black24Bold,
                      ),
                    ],
                  ),
                  5.verticalSpace,
                  Text(
                    '${product.categoryName}',
                    style: AppTextStyles.grey11,
                  ),
                  5.verticalSpace,
                  ratingStar(product),

                  /// Product
                  20.verticalSpace,
                  Container(
                    height: 120.h,
                    //color: Colors.blue[400],
                    child: Text(
                      'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.',
                      style: AppTextStyles.black14,
                    ),
                  ),
                ],
              ),
            ),

            ///
            20.verticalSpace,
            const Divider(height: 0),
            datailListileBtn(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RatingAndReviewsView(),
                  ),
                );
              },
              text: 'Item details',
            ),
            const Divider(height: 0),
            datailListileBtn(
              onTap: () {},
              text: 'Shipping info',
            ),
            const Divider(height: 0),
            datailListileBtn(
              onTap: () {},
              text: 'Support',
            ),
            const Divider(height: 0),

            ///
            40.verticalSpace,
            BlocBuilder<ProducBloc, ProductState>(
              builder: (context, state) {
                if (state is LoadedProductsState) {
                  return Column(
                    children: [
                      Padding(
                        padding: REdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'You can also like this',
                              style: AppTextStyles.black18Bold,
                            ),
                            Text(
                              //'12 items',
                              '${state.allProducts.length} items',
                              style: AppTextStyles.grey11,
                            ),
                          ],
                        ),
                      ),
                      15.verticalSpace,
                      HomeListView(
                        products: state.allProducts,
                      ),
                    ],
                  );
                } else {
                  return Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Список пуст!',
                      style: AppTextStyles.grey16,
                    ),
                  );
                }
              },
            ),

            /// Product list
            // 15.verticalSpace,
            // BlocBuilder<ProductListBloc, ProductsListState>(
            //   builder: (context, state) {
            //     if (state is LoadedProductsListState) {
            //       return CustomListView(allProducts: state.allProducts);
            //     } else {
            //       return Align(
            //         alignment: Alignment.center,
            //         child: Text(
            //           'Список пуст!',
            //           style: AppTextStyles.grey16,
            //         ),
            //       );
            //     }
            //   },
            // ),
          ],
        ),
      ),

      ///
      bottomNavigationBar: Container(
        padding: REdgeInsets.only(left: 16, right: 16, top: 20, bottom: 44),
        height: 112.h,
        color: Colors.white,
        child: CustomElevatedButton(
          sizedBoxHeight: 48.h,
          sizedBoxWidth: MediaQuery.of(context).size.width,
          borderRadius: 30,
          bgColor: AppColors.mainColor,
          text: Text(
            'ADD TO CART',
            style: TextStyle(color: Colors.white, fontSize: 14.sp),
          ),
          onPressed: () {
            BlocProvider.of<BagBloc>(context).add(
              SetProductToCartEvent(
                BagEntity(
                  productID: product.id,
                  userID: 'YkPlvxEcC7QRB1EMBraToKCMykh2',
                  name: product.categoryName,
                  color: product.color,
                  size: product.size,
                  price: product.price,
                  productImgUrl: product.imgUrl,
                ),
              ),
            );
            //bottomSheetBtn(context, isSelected);
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
            // if (formKey.currentState!.validate()) {
            //   //showBottomSheet(context, isSelected);
            //   // BlocProvider.of<ProductBloc>(context).add(
            //   //   AddToCartEvent(
            //   //     product: BagEntity(
            //   //       productID: product.id,
            //   //       userID: '',
            //   //       name: product.category,
            //   //       color: product.color,
            //   //       size: product.size,
            //   //       price: product.price,
            //   //       productImgUrl: product.imgUrl,
            //   //     ),
            //   //   ),
            //   // );
            // }
          },
        ),
      ),
    );
  }
}

ratingStar(ProductEntity product) {
  return Row(
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
        itemSize: 15.0.h,
        direction: Axis.horizontal,
      ),
      5.horizontalSpace,
      Text(
        //'(${product.totalUser})',
        '(105)',
        style: TextStyle(
          fontSize: 11.sp,
          color: Colors.grey,
        ),
      )
    ],
  );
}

datailListileBtn({required VoidCallback onTap, required String text}) {
  return ListTile(
    onTap: onTap,
    title: Text(
      text,
      style: AppTextStyles.black16,
    ),
    trailing: const Icon(Icons.chevron_right),
  );
}

bottomSheetBtn(BuildContext context, List<bool> isSelected) {
  return showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.r),
        topRight: Radius.circular(30.r),
      ),
    ),
    builder: (BuildContext context) {
      return SizedBox(
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
            categoryBtn(context, isSelected),
            30.verticalSpace,
            sbrandButton(context),
            //30.verticalSpace,
            Padding(
              padding: REdgeInsets.all(16),
              child: CustomElevatedButton(
                sizedBoxHeight: 48.h,
                sizedBoxWidth: MediaQuery.of(context).size.width,
                borderRadius: 30,
                bgColor: AppColors.mainColor,
                text: Text(
                  'ADD TO CART',
                  style: TextStyle(color: Colors.white, fontSize: 14.sp),
                ),
                onPressed: () {
                  bottomSheetBtn(context, isSelected);
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}

categoryBtn(BuildContext context, List<bool> isSelected) {
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
                  //BlocProvider.of<CategoryToggleBtnCubit>(context).selected(0);
                },
              ),
              CustomToggleButton(
                sizedBoxHeight: 40.h,
                sizedBoxWidth: 122.h,
                isActivity: isSelected[1],
                text: 'L',
                onPressed: () {
                  //BlocProvider.of<CategoryToggleBtnCubit>(context).selected(1);
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
                  //BlocProvider.of<CategoryToggleBtnCubit>(context).selected(2);
                },
              ),
              CustomToggleButton(
                sizedBoxHeight: 40.h,
                sizedBoxWidth: 122.h,
                isActivity: isSelected[3],
                text: 'XL',
                onPressed: () {
                  // BlocProvider.of<CategoryToggleBtnCubit>(context).selected(3);
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
                  //BlocProvider.of<CategoryToggleBtnCubit>(context).selected(4);
                },
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

sbrandButton(BuildContext context) {
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
