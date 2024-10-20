import 'dart:developer';

import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// final List<FilterModel> selectSizes = <FilterModel>[
//   const FilterModel(name: 'XS', isSelected: false),
//   const FilterModel(name: 'S', isSelected: false),
//   const FilterModel(name: 'L', isSelected: false),
//   const FilterModel(name: 'M', isSelected: false),
//   const FilterModel(name: 'XL', isSelected: false),
// ];

final List<String> productSizes = <String>['XS', 'S', 'L', 'M', 'XL'];

class MobileProductDatailView extends StatelessWidget {
  const MobileProductDatailView({
    required this.productId,
    this.allProducts,
    Key? key,
  }) : super(key: key);

  final String productId;
  final List<ProductEntity>? allProducts;

  @override
  Widget build(BuildContext context) {
    String userId;
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthenticatedState) {
          userId = state.user.userID!;
          return BlocListener<BagBloc, BagState>(
            listener: (context, state) {
              if (state is AddedProductToCartState) {
                AppSnackbar.showSnackbar(context: context, title: 'Добавлен.');
                //Navigator.pop(context);
                // TODO: Доделать возврат на пред. страницу после добавления в корзину
              }
              if (state is ExistsState) {
                AppSnackbar.showSnackbar(
                    context: context, title: 'Product exist.');
                //Navigator.pop(context);
                // TODO: Доделать возврат на пред. страницу после добавления в корзину
              }
            },
            child: MultiBlocProvider(
              providers: [
                BlocProvider<ProductBloc>(
                  create: (context) => sl<ProductBloc>()
                    ..add(
                      GetProductDatailsEvent(productId: productId),
                    ),
                ),
                BlocProvider(
                  create: (context) => sl<RatingAndReviewsBloc>(),
                ),
              ],
              child: BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is LoadingProductstState) {
                    return const LoadingWidget();
                  } else if (state is LoadedProductDatailsState) {
                    return NestedMobileProductDatailView(
                      product: state.productDatails,
                      someProducts: allProducts,
                      userId: userId,
                    );
                  } else if (state is ProductFailureState) {
                    return MyErrorWidget(message: state.message);
                  }
                  return const SomeErrorWidget();
                },
              ),
            ),
          );
        } else if (state is UnAuthenticatedState) {
          return AuthCheckView();
        }
        return const Center(
            child: Text(
          'Some Error',
          style: TextStyle(color: Colors.black),
        ));
      },
    );
  }
}

class NestedMobileProductDatailView extends StatelessWidget {
  NestedMobileProductDatailView({
    super.key,
    required this.product,
    required this.userId,
    this.someProducts,
  });

  final ProductDatailEntity product;
  final String userId;
  final List<ProductEntity>? someProducts;

  String size = 'Size';
  // String color = 'Color';

  List<bool> isSelected = [false, false, false, false, false];
  String imgUrl = '';

  List<String> getSizesName(List<ProductSizeEntity> sizes) {
    List<String>? sizeList = [];
    for (var e in sizes) {
      if (e.quantity != 0) {
        sizeList.add(e.size!);
      }
    }
    return sizeList;
  }

  @override
  Widget build(BuildContext context) {
    // final List<String?> colorItems =
    //     product.colors!.map((e) => e.color).toList();

    //final List<String?> sizeItems = product.sizes!.map((e) => e.size).toList();

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
            product.mainImgUrl!.isNotEmpty
                ? ProductDatailImagelWidget(
                    imagesUrl: product.imgUrlList!,
                  )
                // ? Container(
                //     height: 413.h,
                //     decoration: BoxDecoration(
                //       image: DecorationImage(
                //         image: NetworkImage(product.imgUrl!),
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                //   )
                : Container(
                    height: 413.h,
                    decoration: const BoxDecoration(
                      color: Colors.greenAccent,
                      // image: const DecorationImage(
                      //   image: NetworkImage('assets/png/noImageError.png'),
                      //   fit: BoxFit.cover,
                      // ),
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
                      // Size
                      CustomDropdownMenu(
                        items: getSizesName(product.sizes!),
                        isHint: true,
                        hintText: size,
                        callback: (value) => size = value,
                      ),
                      // Color
                      CustomDropdownMenu(
                        items: const [],
                        isHint: true,
                        hintText: product.color,
                        //callback: (value) => color = value,
                      ),
                      // Favorite button
                      //FavoriteToggleIconBtn(),
                      FavoriteButtonWidget(
                        product: ProductEntity(
                          id: product.id,
                          category: product.category,
                          brand: product.brand,
                          color: product.color,
                          isNew: product.isNew,
                          isSale: product.isSale,
                          sale: product.sale,
                          price: product.price,
                          newPrice: product.newPrice,
                          totalRating: product.totalRating,
                          totalUser: product.totalUser,
                          mainImgUrl: product.mainImgUrl,
                        ),
                      ),
                    ],
                  ),
                  22.verticalSpace,

                  /// Product datails
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.brand!,
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
                    product.category!.categoryName!,
                    style: AppTextStyles.grey11,
                  ),
                  5.verticalSpace,
                  AppRatingBarIndicator(
                    totalRating: product.totalRating!,
                    totalUser: product.totalUser!,
                    itemSize: 15.h,
                  ),

                  /// Product description
                  20.verticalSpace,
                  // TODO: Доделать описание продукта
                  SizedBox(
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
                              //'${product.colorAndSizes!.colorSizes!.m}',
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
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (contextB) => RatingAndReviewsView(
                      currentProductRating: product.rating!,
                      currentProductReviews:
                          product.reviews as List<ProductReviewEntity>,
                      currentProductId: product.id!,
                      currentUserId: userId,
                    ),
                  ),
                );
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (contextB) => BlocProvider.value(
                //       value: BlocProvider.of<RatingAndReviewsBloc>(context),
                //       child: RatingAndReviewsView(
                //         currentProductRating: product.rating!,
                //         currentProductReviews:
                //             product.reviews as List<ProductReviewEntity>,
                //         currentProductId: product.id!,
                //         currentUserId: userId,
                //       ),
                //     ),
                //   ),
                // );
              },
              title: Text(
                'Item details',
                style: AppTextStyles.black16,
              ),
              trailing: const Icon(Icons.chevron_right),
            ),
            const Divider(height: 0),
            ListTile(
              onTap: () => MyDialog.getDialog(context: context),
              title: Text(
                'Shipping info',
                style: AppTextStyles.black16,
              ),
              trailing: const Icon(Icons.chevron_right),
            ),
            const Divider(height: 0),
            ListTile(
              onTap: () => MyDialog.getDialog(context: context),
              title: Text(
                'Support',
                style: AppTextStyles.black16,
              ),
              trailing: const Icon(Icons.chevron_right),
            ),
            const Divider(height: 0),

            /// Product list
            // TODO: Доделать список, чтоб текущего продукта не было в списке
            40.verticalSpace,
            someProducts != null
                ? CustomHorizontalListViewWidget(
                    products: someProducts!,
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
          ],
        ),
      ),

      ///
      bottomNavigationBar: Container(
        padding: REdgeInsets.only(left: 16, right: 16, top: 20, bottom: 44),
        height: 112.h,
        color: Colors.white,
        child: CustomButton(
          text: 'ADD TO CART',
          onPressed: () {
            if (size == 'Size') {
              AppBottomSheet.showBottomSheet(
                context: context,
                title: 'Select size',
                content: Column(
                  children: [
                    SingleSelectToggleButton(
                      itemList: getSizesName(product.sizes!),
                      selectedItemsCallback: (value) => size = value,
                      containerHeight: 140,
                      sizedBoxWidth: 122.h,
                      isGridView: true,
                    ),
                    22.verticalSpace,
                    ListTile(
                      shape: const Border(
                        top: BorderSide(color: Colors.black12, width: 1),
                        bottom: BorderSide(color: Colors.black12, width: 1),
                      ),
                      onTap: () {},
                      title: Text(
                        'Size info',
                        style: AppTextStyles.black16,
                      ),
                      trailing: const Icon(Icons.chevron_right),
                    ),
                    22.verticalSpace,
                    Padding(
                      padding: REdgeInsets.all(16),
                      child: CustomButton(
                        onPressed: () {
                          BlocProvider.of<BagBloc>(context).add(
                            AddProductToCartEvent(
                              BagEntity(
                                productID: product.id,
                                name: product.category!.categoryName,
                                color: product.color,
                                size: size,
                                pricePerUnit: product.price,
                                cardTotalPrice: product.price,
                                quantity: 1,
                                productImgUrl: product.mainImgUrl,
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
                AddProductToCartEvent(
                  BagEntity(
                    productID: product.id,
                    name: product.category!.categoryName,
                    color: product.color,
                    size: size,
                    pricePerUnit: product.price,
                    cardTotalPrice: product.price,
                    quantity: 1,
                    productImgUrl: product.mainImgUrl,
                  ),
                ),
              );
              Navigator.pop(context);
            }
          },
        ),
      ),
    );
  }
}

// datailListileBtn({required VoidCallback onTap, required String text}) {
//   return ListTile(
//     onTap: onTap,
//     title: Text(
//       text,
//       style: AppTextStyles.black16,
//     ),
//     trailing: const Icon(Icons.chevron_right),
//   );
// }

// sbrandButton(BuildContext context) {
//   return ListTile(
//     shape: const Border(
//       top: BorderSide(color: Colors.black12, width: 1),
//       bottom: BorderSide(color: Colors.black12, width: 1),
//     ),
//     onTap: () {
//       // GoRouter.of(context).goNamed(
//       //   APP_PAGE.shopBrand.toName,
//       // );
//     },
//     title: Text(
//       'Size info',
//       style: AppTextStyles.black16,
//     ),
//     trailing: const Icon(Icons.chevron_right),
//   );
// }
