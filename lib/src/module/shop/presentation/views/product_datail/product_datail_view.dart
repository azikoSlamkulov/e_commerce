import 'dart:developer';

import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final List<FilterModel> selectSizes = <FilterModel>[
  const FilterModel(name: 'XS', isSelected: false),
  const FilterModel(name: 'S', isSelected: false),
  const FilterModel(name: 'L', isSelected: false),
  const FilterModel(name: 'M', isSelected: false),
  const FilterModel(name: 'XL', isSelected: false),
];

class MobileProductDatailView extends StatelessWidget {
  const MobileProductDatailView({
    required this.product,
    this.allProducts,
    Key? key,
  }) : super(key: key);

  final ProductEntity product;
  final List<ProductEntity>? allProducts;

  @override
  Widget build(BuildContext context) {
    // String size = 'Size';
    // String color = 'Color';
    // final List<String> sizeItems = ['XS', 'S', 'M', 'L', 'XL'];
    // // final List<String> colorItems = ['Color', 'Black', 'White', 'Red', 'Blue'];
    // final List<String?> colorItems =
    //     product.colors!.map((e) => e.color).toList();

    // List<bool> isSelected = [false, false, false, false, false];

    return BlocListener<BagBloc, BagState>(
      listener: (context, state) {
        if (state is AddedProductToCartState) {
          AppSnackbar.showSnackbar(context: context, title: 'Добавлен.');
          //Navigator.pop(context);
          // TODO: Доделать возврат на пред. страницу после добавления в корзину
        }
      },
      // child: Scaffold(
      //   appBar: buildPDAppBar(product),
      //   body: buildPDBody(
      //     context,
      //     product,
      //     allProducts,
      //     size,
      //     color,
      //     sizeItems,
      //     colorItems,
      //   ),
      //   bottomNavigationBar: buildePDBottomNavBar(
      //     context,
      //     product,
      //     size,
      //     color,
      //   ),
      // ),
      child: NestedMobileProductDatailView(
        product: product,
        allProducts: allProducts,
      ),
      // child: allProducts != null
      //     ? NestedMobileProductDatailView(
      //         product: product,
      //         allProducts: allProducts,
      //       )
      //     : BlocBuilder<ProductBloc, ProductState>(
      //         builder: (context, state) {
      //           if (state is LoadingProductstState) {
      //             return const Scaffold(
      //               backgroundColor: AppColors.white,
      //               body: Center(
      //                 child: CircularProgressIndicator(),
      //               ),
      //             );
      //           } else if (state is LoadedProductsState) {
      //             BlocProvider.of<ProductBloc>(context).add(
      //               GetProductsByQueryEvent(
      //                 firstQuery: product.category!.typeName!,
      //                 secondQuery: product.category!.collectionName!,
      //                 thirdQuery: product.category!.categoryName!,
      //               ),
      //             );
      //             //final allNewProducts = FakeProductData().allFakeProducts;
      //             return NestedMobileProductDatailView(
      //               product: product,
      //               allProducts: state.allProducts,
      //             );
      //           } else {
      //             return const Center(child: Text('Login'));
      //           }
      //         },
      //       ),
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

PreferredSizeWidget buildPDAppBar(ProductEntity product) {
  return CustomAppBar(
    title: '${product.category!.categoryName}',
    showShareBtn: true,
  );
}

Widget buildPDBody(
  BuildContext context,
  ProductEntity product,
  List<ProductEntity>? allProducts,
  String size,
  String color,
  List<String?> sizeItems,
  List<String?> colorItems,
) {
  return SingleChildScrollView(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //ToDo: Доделать DropdownMenu
                  CustomDropdownMenu(
                    items: sizeItems,
                    //selectedItem: sizeItems[0],
                    isHint: true,
                    hintText: size,
                    callback: (value) => size = value,
                  ),
                  //16.horizontalSpace,
                  CustomDropdownMenu(
                    items: colorItems,
                    selectedItem: colorItems[0],
                    callback: (value) => color = value,
                  ),
                  //16.horizontalSpace,
                  FavoriteToggleIconBtn(),
                ],
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
                '${product.category!.categoryName}',
                style: AppTextStyles.grey11,
              ),
              5.verticalSpace,
              AppRatingBarIndicator(product: product, itemSize: 15.h),

              /// Product
              20.verticalSpace,
              // TODO: Доделать описание продукта
              Container(
                height: 120.h,
                //color: Colors.blue[400],
                child: product.description != ''
                    ? Text(
                        product.description!,
                        style: AppTextStyles.black14,
                      )
                    : Center(
                        child: Text(
                          'Без описания!',
                          style: AppTextStyles.grey16,
                        ),
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
                builder: (context) => RatingAndReviewsView(
                  product: product,
                ),
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

        /// Product list
        // TODO: Доделать список
        60.verticalSpace,
        allProducts != null
            ? CustomHorizontalListViewWidget(
                products: allProducts!,
                title: 'You can also like this',
                subtitle: '',
              )
            : BlocProvider<ProductBloc>(
                create: (context) => sl<ProductBloc>()
                  ..add(
                    GetProductsByQueryEvent(
                      firstQuery: product.category!.typeName!,
                      secondQuery: product.category!.collectionName!,
                      thirdQuery: product.category!.categoryName!,
                    ),
                  ),
                child: BlocBuilder<ProductBloc, ProductState>(
                  builder: (context, state) {
                    if (state is LoadedProductsState) {
                      return CustomHorizontalListViewWidget(
                        products: state.allProducts,
                        title: 'You can also like this',
                        subtitle: '',
                      );
                    }
                    return Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Some Error!',
                        style: AppTextStyles.grey16,
                      ),
                    );
                  },
                ),
              ),
        40.verticalSpace,

        // BlocBuilder<ProductBloc, ProductState>(
        //   builder: (context, state) {
        //     if (state is LoadedProductsState) {
        //       return CustomHorizontalListViewWidget(
        //         products: state.allProducts,
        //         title: 'You can also like this',
        //         subtitle: '',
        //       );
        //       // return Column(
        //       //   children: [
        //       //     Padding(
        //       //       padding: REdgeInsets.symmetric(horizontal: 16),
        //       //       child: Row(
        //       //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       //         children: [
        //       //           Text(
        //       //             'You can also like this',
        //       //             style: AppTextStyles.black18Bold,
        //       //           ),
        //       //           Text(
        //       //             //'12 items',
        //       //             '${state.allProducts.length} items',
        //       //             style: AppTextStyles.grey11,
        //       //           ),
        //       //         ],
        //       //       ),
        //       //     ),
        //       //     15.verticalSpace,
        //       //     CustomListViewWidget(
        //       //       products: state.allProducts,
        //       //       title: 'You can also like this',
        //       //       subtilte: '',
        //       //     ),
        //       //   ],
        //       // );
        //     }
        //     return Align(
        //       alignment: Alignment.center,
        //       child: Text(
        //         'Some Error!',
        //         style: AppTextStyles.grey16,
        //       ),
        //     );
        //   },
        // ),
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
  );
}

Widget buildePDBottomNavBar(
  BuildContext context,
  ProductEntity product,
  String size,
  String color,
) {
  return Container(
    padding: REdgeInsets.only(left: 16, right: 16, top: 20, bottom: 44),
    height: 112.h,
    color: Colors.white,
    child: CustomButton(
      // sizedBoxHeight: 48.h,
      // sizedBoxWidth: MediaQuery.of(context).size.width,
      // borderRadius: 30,
      //bgColor: AppColors.mainColor,
      // text: Text(
      //   'ADD TO CART',
      //   style: TextStyle(color: Colors.white, fontSize: 14.sp),
      // ),
      text: 'ADD TO CART',
      onPressed: () {
        if (size == 'Size') {
          AppBottomSheet.showBottomSheet(
            context: context,
            title: 'Select size',
            content: Column(
              children: [
                //22.verticalSpace,
                SingleSelectToggleButton(
                  itemList: selectSizes,
                  selectedItemsCallback: (value) => size = value,
                  containerHeight: 140,
                  sizedBoxWidth: 122.h,
                  isGridView: true,
                ),
                22.verticalSpace,
                sbrandButton(context),
                22.verticalSpace,
                Padding(
                  padding: REdgeInsets.all(16),
                  child: CustomButton(
                    onPressed: () {},
                    text: 'ADD TO CART',
                  ),
                ),
                22.verticalSpace,
              ],
            ),
          );
        } else {
          BlocProvider.of<BagBloc>(context).add(
            SetProductToCartEvent(
              BagEntity(
                productID: product.productID,
                name: product.category!.categoryName,
                color: color,
                size: size,
                pricePerUnit: product.price,
                cardTotalPrice: product.price,
                quantity: 1,
                productImgUrl: product.imgUrl,
              ),
            ),
          );
          Navigator.pop(context);
        }
        // if (_formKey.currentState!.validate()) {
        //   log('color');
        // }
      },
    ),
  );
}

class NestedMobileProductDatailView extends StatelessWidget {
  NestedMobileProductDatailView({
    super.key,
    required this.product,
    this.allProducts,
    //required this.allNewProducts,
    //required this.userID,
  });

  //final List<ProductsListEntity> allNewProducts;
  final ProductEntity product;
  final List<ProductEntity>? allProducts;

  String size = 'Size';
  String color = 'Color';

  List<bool> isSelected = [false, false, false, false, false];
  String imgUrl = '';

  //final List<String> sizeItems = ['XS', 'S', 'M', 'L', 'XL'];

  @override
  Widget build(BuildContext context) {
    // final List<String> colorItems = ['Color', 'Black', 'White', 'Red', 'Blue'];
    final List<String?> colorItems =
        product.colors!.map((e) => e.color).toList();

    final List<String?> sizeItems = product.sizes!.map((e) => e.size).toList();

    return Scaffold(
      backgroundColor: AppColors.bgColorMain,
      appBar: CustomAppBar(
        title: '${product.category!.categoryName}',
        showShareBtn: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Product image
            //TODO
            product.imgUrl!.isNotEmpty
                ? Container(
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
                  )
                : Container(
                    height: 413.h,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      // image: const DecorationImage(
                      //   image: NetworkImage('assets/png/noImageError.png'),
                      //   fit: BoxFit.cover,
                      // ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //ToDo: Доделать DropdownMenu
                      CustomDropdownMenu(
                        items: sizeItems,
                        //selectedItem: sizeItems[0],
                        isHint: true,
                        hintText: size,
                        callback: (value) => size = value,
                      ),
                      //16.horizontalSpace,
                      CustomDropdownMenu(
                        items: colorItems,
                        selectedItem: colorItems[0],
                        callback: (value) => color = value,
                      ),
                      //16.horizontalSpace,
                      FavoriteToggleIconBtn(),
                    ],
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
                    '${product.category!.categoryName}',
                    style: AppTextStyles.grey11,
                  ),
                  5.verticalSpace,
                  AppRatingBarIndicator(product: product, itemSize: 15.h),

                  /// Product
                  20.verticalSpace,
                  // TODO: Доделать описание продукта
                  Container(
                    height: 120.h,
                    //color: Colors.blue[400],
                    child: product.description != ''
                        ? Text(
                            product.description!,
                            style: AppTextStyles.black14,
                          )
                        : Center(
                            child: Text(
                              'Без описания!',
                              style: AppTextStyles.grey16,
                            ),
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
                    builder: (context) => RatingAndReviewsView(
                      product: product,
                    ),
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

            /// Product list
            // TODO: Доделать список
            40.verticalSpace,
            allProducts != null
                ? CustomHorizontalListViewWidget(
                    products: allProducts!,
                    title: 'You can also like this',
                    subtitle: '',
                  )
                : BlocProvider<ProductBloc>(
                    create: (context) => sl<ProductBloc>()
                      ..add(
                        GetProductsByQueryEvent(
                          firstQuery: product.category!.typeName!,
                          secondQuery: product.category!.collectionName!,
                          thirdQuery: product.category!.categoryName!,
                        ),
                      ),
                    child: BlocBuilder<ProductBloc, ProductState>(
                      builder: (context, state) {
                        if (state is LoadedProductsState) {
                          return CustomHorizontalListViewWidget(
                            products: state.allProducts,
                            title: 'You can also like this',
                            subtitle: '',
                          );
                        }
                        return Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Some Error!',
                            style: AppTextStyles.grey16,
                          ),
                        );
                      },
                    ),
                  ),

            // BlocBuilder<ProductBloc, ProductState>(
            //   builder: (context, state) {
            //     if (state is LoadedProductsState) {
            //       return CustomHorizontalListViewWidget(
            //         products: state.allProducts,
            //         title: 'You can also like this',
            //         subtitle: '',
            //       );
            //       // return Column(
            //       //   children: [
            //       //     Padding(
            //       //       padding: REdgeInsets.symmetric(horizontal: 16),
            //       //       child: Row(
            //       //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       //         children: [
            //       //           Text(
            //       //             'You can also like this',
            //       //             style: AppTextStyles.black18Bold,
            //       //           ),
            //       //           Text(
            //       //             //'12 items',
            //       //             '${state.allProducts.length} items',
            //       //             style: AppTextStyles.grey11,
            //       //           ),
            //       //         ],
            //       //       ),
            //       //     ),
            //       //     15.verticalSpace,
            //       //     CustomListViewWidget(
            //       //       products: state.allProducts,
            //       //       title: 'You can also like this',
            //       //       subtilte: '',
            //       //     ),
            //       //   ],
            //       // );
            //     }
            //     return Align(
            //       alignment: Alignment.center,
            //       child: Text(
            //         'Some Error!',
            //         style: AppTextStyles.grey16,
            //       ),
            //     );
            //   },
            // ),
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
        child: CustomButton(
          // sizedBoxHeight: 48.h,
          // sizedBoxWidth: MediaQuery.of(context).size.width,
          // borderRadius: 30,
          //bgColor: AppColors.mainColor,
          // text: Text(
          //   'ADD TO CART',
          //   style: TextStyle(color: Colors.white, fontSize: 14.sp),
          // ),
          text: 'ADD TO CART',
          onPressed: () {
            if (size == 'Size') {
              AppBottomSheet.showBottomSheet(
                context: context,
                title: 'Select size',
                content: Column(
                  children: [
                    //22.verticalSpace,
                    SingleSelectToggleButton(
                      itemList: selectSizes,
                      selectedItemsCallback: (value) => size = value,
                      containerHeight: 140,
                      sizedBoxWidth: 122.h,
                      isGridView: true,
                    ),
                    22.verticalSpace,
                    sbrandButton(context),
                    22.verticalSpace,
                    Padding(
                      padding: REdgeInsets.all(16),
                      child: CustomButton(
                        onPressed: () {
                          BlocProvider.of<BagBloc>(context).add(
                            SetProductToCartEvent(
                              BagEntity(
                                productID: product.productID,
                                name: product.category!.categoryName,
                                color: color,
                                size: size,
                                pricePerUnit: product.price,
                                cardTotalPrice: product.price,
                                quantity: 1,
                                productImgUrl: product.imgUrl,
                              ),
                            ),
                          );
                          Navigator.pop(context);
                        },
                        text: 'ADD TO CART',
                      ),
                    ),
                    22.verticalSpace,
                  ],
                ),
              );
            } else {
              BlocProvider.of<BagBloc>(context).add(
                SetProductToCartEvent(
                  BagEntity(
                    productID: product.productID,
                    name: product.category!.categoryName,
                    color: color,
                    size: size,
                    pricePerUnit: product.price,
                    cardTotalPrice: product.price,
                    quantity: 1,
                    productImgUrl: product.imgUrl,
                  ),
                ),
              );
              Navigator.pop(context);
            }
            // if (_formKey.currentState!.validate()) {
            //   log('color');
            // }
          },
        ),
      ),
    );
  }

  sizeBottomSheetContent(BuildContext context) {
    return AppBottomSheet.showBottomSheet(
      context: context,
      title: 'Select size',
      content: Column(
        children: [
          //22.verticalSpace,
          SingleSelectToggleButton(
            itemList: selectSizes,
            selectedItemsCallback: (value) => size = value,
            containerHeight: 140,
            sizedBoxWidth: 122.h,
            isGridView: true,
          ),
          22.verticalSpace,
          sbrandButton(context),
          22.verticalSpace,
          Padding(
            padding: REdgeInsets.all(16),
            child: CustomButton(
              onPressed: () {
                if (size != 'Size') {
                  //log(size);
                  BlocProvider.of<BagBloc>(context).add(
                    SetProductToCartEvent(
                      BagEntity(
                        productID: product.productID,
                        name: product.category!.categoryName,
                        color: color,
                        size: size,
                        pricePerUnit: product.price,
                        cardTotalPrice: product.price,
                        quantity: 1,
                        productImgUrl: product.imgUrl,
                      ),
                    ),
                  );
                  Navigator.pop(context);
                } else {
                  // TODO: Доделать Snackbar
                  Navigator.pop(context);
                  AppSnackbar.showSnackbar(
                      context: context, title: 'Select size.');
                }
              },
              text: 'ADD TO CART',
            ),
          ),
          22.verticalSpace,
        ],
      ),
    );
  }
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

sbrandButton(BuildContext context) {
  return ListTile(
    shape: const Border(
      top: BorderSide(color: Colors.black12, width: 1),
      bottom: BorderSide(color: Colors.black12, width: 1),
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
