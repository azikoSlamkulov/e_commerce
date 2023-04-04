import 'dart:developer';

import 'package:e_commerce/src/core/data/remote/fake_data/fake_categories_data.dart';
import 'package:e_commerce/src/core/data/remote/fake_data/fake_category_entity.dart';
import 'package:e_commerce/src/core/data/remote/fake_data/fake_product_data.dart';
import 'package:e_commerce/src/module/auth/presentation/logic/auth_bloc.dart';
import 'package:e_commerce/src/module/auth/presentation/logic/auth_state.dart';
import 'package:e_commerce/src/module/favorites/widgets/favorites_horizontal_container.dart';
import 'package:e_commerce/src/module/favorites/widgets/favorites_vertical_container.dart';
import 'package:e_commerce/src/module/shop/presentation/logic/orientation_toggle_btn/orientation_cubit.dart';
import 'package:e_commerce/src/module/shop/presentation/views/mobile/mobile_filters_view.dart';

import 'package:e_commerce/src/util/app_constants/colors/app_colors.dart';
import 'package:e_commerce/src/util/app_constants/text_styles/app_text_styles.dart';
import 'package:e_commerce/src/util/app_widgets/bar/custom_app_bar.dart';
import 'package:e_commerce/src/util/app_widgets/buttons/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:e_commerce/src/module/shop/presentation/views/mobile/mobile_product_datail.dart';

import 'package:e_commerce/src/util/app_widgets/custom_vertical_container.dart';
import '../../../util/app_widgets/custom_horizontal_container.dart';
import '../../auth/presentation/views/auth_check_view.dart';
import '../../shop/domain/entities/product_entity.dart';
import '../../shop/presentation/logic/sort_toggle_btn/sort_toggle_btn_cubit.dart';
import '../../shop/presentation/widgets/sort_toggle_button.dart';

class MobileFavoritesVew extends StatelessWidget {
  const MobileFavoritesVew({
    Key? key,
    //required this.product,
  }) : super(key: key);

  //final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final fakeCategories = FakeCategoriesData().FakeCategories;
    final fakeProducts = FakeProductData().allFakeProducts;

    return BlocProvider(
      create: (context) => OrientationCubit(),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthenticatedState) {
            return NestedMobileFavoritesVew(
              fakeCategories: fakeCategories,
              allProducts: fakeProducts,
              // userID: state.user.userID!,
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
      ),
    );
    // return NestedMobileProductDatail(
    //   product: product,
    //   allNewProducts: allNewProducts,
    // );
  }
}

class NestedMobileFavoritesVew extends StatelessWidget {
  const NestedMobileFavoritesVew({
    super.key,
    required this.fakeCategories,
    required this.allProducts,
    // required this.userID,
  });

  final List<ProductEntity> allProducts;
  final List<FakeCategoryEntity> fakeCategories;
  // final String userID;

  @override
  Widget build(BuildContext context) {
    String _choice;

    return Scaffold(
      backgroundColor: AppColors.bgColorMain,
      appBar: CustomAppBar(
        title: 'Favorites',
        showShareBtn: true,
      ),
      body: Column(
        children: [
          /// Categories list
          Container(
              color: Colors.white,
              height: 46.h,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: fakeCategories.length,
                itemBuilder: (context, index) {
                  final newCategory = fakeCategories[index];
                  return Padding(
                    padding: REdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: CustomElevatedButton(
                      text: Text(
                        newCategory.name!,
                        style: AppTextStyles.white14,
                      ),
                      onPressed: () {
                        // BlocProvider.of<ProductBloc>(context).add(
                        //   GetFakeSortedListEvent(
                        //     type: type,
                        //     collection: collection,
                        //     category: newCategory.category,
                        //   ),
                        // );
                      },
                      bgColor: Colors.black,
                      sizedBoxHeight: 30.h,
                      sizedBoxWidth: 100.h,
                      borderRadius: 30,
                    ),
                  );
                },
              )),

          ///
          Container(
            color: Colors.white,
            height: 44.h,
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Filters
                  TextButton.icon(
                    onPressed: () {
                      // GoRouter.of(context).goNamed(
                      //   APP_PAGE.shopFilters.toName,
                      // );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MobileFiltersView(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.filter_list,
                      color: Colors.black,
                    ),
                    label: Text(
                      'Filters',
                      style: AppTextStyles.black11,
                    ),
                  ),

                  // Sort
                  TextButton.icon(
                    onPressed: () {
                      modalBottomSheet(context
                          // type,
                          // collection,
                          // category,
                          );
                    },
                    icon: const Icon(
                      Icons.swap_vert_outlined,
                      color: Colors.black,
                    ),
                    label: BlocListener<SortToggleBtnCubit, SortToggleBtnState>(
                      listener: (context, state) {
                        // if (state is InitialState) {
                        //   _choice = state.selectedText;
                        //   BlocProvider.of<ProductBloc>(context).add(
                        //     GetFakeSortedListEvent(
                        //       type: type,
                        //       collection: collection,
                        //       category: category,
                        //       choice: state.selectedText,
                        //     ),
                        //   );
                        // } else if (state is SelectedState) {
                        //   _choice = state.selectedText;
                        //   BlocProvider.of<ProductBloc>(context).add(
                        //     GetFakeSortedListEvent(
                        //       type: type,
                        //       collection: collection,
                        //       category: category,
                        //       choice: state.selectedText,
                        //     ),
                        //   );
                        // }
                      },
                      child:
                          BlocBuilder<SortToggleBtnCubit, SortToggleBtnState>(
                        builder: (context, state) {
                          return Text(
                            state.selectedText,
                            style: AppTextStyles.black11,
                          );
                        },
                      ),
                    ),
                  ),

                  /// Orientation
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<OrientationCubit>(context)
                          .getOrientation();
                    },
                    icon: BlocBuilder<OrientationCubit, OrientationState>(
                      builder: (context, state) {
                        return state.orientation
                            ? const Icon(
                                Icons.view_list,
                                color: Colors.black,
                              )
                            : const Icon(
                                Icons.view_module,
                                color: Colors.black,
                              );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// Products GridView
          BlocBuilder<OrientationCubit, OrientationState>(
            builder: (context, state) {
              return state.orientation
                  ? Expanded(
                      child: Padding(
                      padding:
                          REdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: GridView.builder(
                        itemCount: allProducts.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 90.h / 150.h,
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          final product = allProducts[index];
                          return FavoritesVerticalContainer(
                            product: product,
                            onTap: () {
                              // GoRouter.of(context).goNamed(
                              //   APP_PAGE.shopProductCard.toName,
                              // );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MobileProductDatail(product: product),
                                ),
                              );
                            },
                            //isSale: product.isSale!,
                            sizedHeight: 220.h,
                          );
                        },
                      ),
                    ))
                  : Expanded(
                      child: Padding(
                      padding:
                          REdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: ListView.builder(
                        itemCount: allProducts.length,
                        itemExtent: 155.h,
                        itemBuilder: (context, index) {
                          final product = allProducts[index];
                          return FavoritesHorizontalContainer(
                            product: product,
                            onTap: () {
                              // GoRouter.of(context).goNamed(
                              //   APP_PAGE.shopProductCard.toName,
                              // );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MobileProductDatail(product: product),
                                ),
                              );
                            },
                            isSale: product.isSale!,
                          );
                        },
                      ),
                    ));
            },
          ),
        ],
      ),
    );
  }
}

modalBottomSheet(
  BuildContext context,
  // String type,
  // String collection,
  // String category,
) {
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
                  'Sort by',
                  style: AppTextStyles.black18Bold,
                ),
              ),
            ),
            33.verticalSpace,
            SortToggleButton(
                // type: type,
                // collection: collection,
                // category: category,
                ),
            // button(context, 'Popular', false, () => log('Popular')),
            // button(context, 'Newest', false, () => log('Newest')),
            // button(context, 'Customer review', false,
            //     () => log('Customer review')),
            // button(context, 'Price: lowest to high', true,
            //     () => log('Price: lowest to high')),
            // button(context, 'Price: highest to low', false,
            //     () => log('Price: highest to low')),
          ],
        ),
      );
    },
  );
}
