import 'package:e_commerce/src/module/bag/presentation/logic/bloc/bag_bloc.dart';
import 'package:e_commerce/src/module/shop/presentation/logic/product/product_bloc.dart';
import 'package:e_commerce/src/module/shop/presentation/logic/product_bloc/product_bloc.dart';
import 'package:e_commerce/src/module/shop/presentation/logic/product_bloc/product_event.dart';
import 'package:e_commerce/src/module/shop/presentation/logic/product_bloc/product_state.dart';
import 'package:e_commerce/src/module/shop/presentation/logic/sort_toggle_button_cubit/sort_toggle_button_cubit.dart';
import 'package:e_commerce/src/module/shop/presentation/views/mobile/mobile_filters_view.dart';
import 'package:e_commerce/src/module/shop/presentation/views/mobile/mobile_product_datail.dart';
import 'package:e_commerce/src/util/app_constants/colors/app_colors.dart';
import 'package:e_commerce/src/util/app_constants/text_styles/app_text_styles.dart';
import 'package:e_commerce/src/util/app_widgets/buttons/custom_elevated_button.dart';
import 'package:e_commerce/src/util/app_widgets/custom_vertical_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../locator.dart';
import '../../../../../util/app_widgets/bar/custom_app_bar.dart';
import '../../../../../util/app_widgets/custom_horizontal_container.dart';
import '../../../../app/routes/router_utils.dart';
import '../../../domain/entities/product_entity.dart';
import '../../../domain/entities/category_entity.dart';
import '../../logic/orientation_cubit/orientation_cubit.dart';

import '../../logic/orientation_toggle_btn/orientation_cubit.dart';
import '../../logic/sort_toggle_btn/sort_toggle_btn_cubit.dart';
import '../../widgets/sort_toggle_button.dart';

class MobileCatalogView extends StatelessWidget {
  MobileCatalogView({
    Key? key,
    required this.type,
    required this.collection,
    required this.category,
    this.allCategories,
  }) : super(key: key);

  final String type;
  final String collection;
  final String category;
  final List<CategoryEntity>? allCategories;

  @override
  Widget build(BuildContext context) {
    String choice = 'Price: lowest to high';
    BlocProvider.of<ProductBloc>(context).add(
      GetSortedProductsEvent(
        firstQuery: type,
        secondQuery: collection,
        thirdQuery: category,
      ),
    );

    return BlocProvider(
      create: (context) => sl<OrientationCubit>(),
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoadingState) {
            //return const LoadingWidget();
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadedAllProductsState) {
            return NestedMobileCatalogView(
              allProducts: state.allProducts,
              collection: collection,
              type: type,
              category: category,
              allCategories: allCategories,
            );
          } else if (state is ProductFailureState) {
            //return MyErrorWidget('${state.exception}');
            return Text('');
          } else {
            //return const SomeError();,
            return Text('');
          }
        },
      ),
    );
  }
}

class NestedMobileCatalogView extends StatelessWidget {
  const NestedMobileCatalogView({
    super.key,
    //required this.allcategories,
    required this.allProducts,
    required this.type,
    required this.collection,
    required this.category,
    this.allCategories,
  });

  //final List<CategoryEntity> allCategories;
  final List<ProductEntity> allProducts;
  final String type;
  final String collection;
  final String category;
  final List<CategoryEntity>? allCategories;

  @override
  Widget build(BuildContext context) {
    //bool isVerticalList = false;
    String _choice;
    //final categories = CategoriesData().categories;

    return Scaffold(
      backgroundColor: AppColors.bgColorMain,
      appBar: CustomAppBar(
        title: '$type\'s $category',
        showSearchBtn: true,
      ),
      body: Column(
        children: [
          /// Categories list
          allCategories!.isNotEmpty
              ? Container(
                  color: Colors.white,
                  height: 46.h,
                  width: double.infinity,
                  child: allCategories!.isNotEmpty
                      ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: allCategories!.length,
                          itemBuilder: (context, index) {
                            final newCategory = allCategories![index];
                            return Padding(
                              padding: REdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8),
                              child: CustomElevatedButton(
                                text: Text(
                                  newCategory.category!,
                                  style: AppTextStyles.white14,
                                ),
                                onPressed: () {
                                  BlocProvider.of<ProductBloc>(context).add(
                                    GetFakeSortedListEvent(
                                      type: type,
                                      collection: collection,
                                      category: newCategory.category,
                                    ),
                                  );
                                },
                                bgColor: Colors.black,
                                sizedBoxHeight: 30.h,
                                sizedBoxWidth: 100.h,
                                borderRadius: 30,
                              ),
                            );
                          },
                        )
                      : CustomElevatedButton(
                          text: const Text('CATEGORIES'),
                          onPressed: () {
                            GoRouter.of(context).goNamed(
                              AppPage.shopCategoriesFirst.toName,
                            );
                          },
                        ),
                )
              : const SizedBox(),
          // Container(
          //   color: Colors.white,
          //   height: 46.h,
          //   width: double.infinity,
          //   child: allCategories!.isNotEmpty
          //       ? ListView.builder(
          //           scrollDirection: Axis.horizontal,
          //           itemCount: allCategories!.length,
          //           itemBuilder: (context, index) {
          //             final newCategory = allCategories![index];
          //             return Padding(
          //               padding:
          //                   REdgeInsets.symmetric(horizontal: 8, vertical: 8),
          //               child: CustomElevatedButton(
          //                 text: Text(
          //                   newCategory.category!,
          //                   style: AppTextStyles.white14,
          //                 ),
          //                 onPressed: () {
          //                   BlocProvider.of<ProductBloc>(context).add(
          //                     GetFakeSortedListEvent(
          //                       type: type,
          //                       collection: collection,
          //                       category: newCategory.category,
          //                     ),
          //                   );
          //                 },
          //                 bgColor: Colors.black,
          //                 sizedBoxHeight: 30.h,
          //                 sizedBoxWidth: 100.h,
          //                 borderRadius: 30,
          //               ),
          //             );
          //           },
          //         )
          //       : CustomElevatedButton(
          //           text: const Text('CATEGORIES'),
          //           onPressed: () {
          //             GoRouter.of(context).goNamed(
          //               AppPage.shopCategoriesFirst.toName,
          //             );
          //           },
          //         ),
          // ),

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
                      bottomSheet(
                        context,
                        type,
                        collection,
                        category,
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
                  ? Expanded(child: gridView(allProducts))
                  : Expanded(child: listView(allProducts));
            },
          ),
        ],
      ),
    );
  }
}

Widget gridView(List<ProductEntity> allProducts) {
  return Padding(
    padding: REdgeInsets.symmetric(horizontal: 8, vertical: 16),
    child: GridView.builder(
      itemCount: allProducts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 90.h / 140.h,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        final product = allProducts[index];
        return CustomVerticalContainer(
          product: product,
          onTap: () {
            // GoRouter.of(context).goNamed(
            //   APP_PAGE.shopProductCard.toName,
            // );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MobileProductDatail(product: product),
              ),
            );
          },
          //isSale: product.isSale!,
          sizedHeight: 220.h,
        );
      },
    ),
  );
}

Widget listView(List<ProductEntity> allProducts) {
  return Padding(
    padding: REdgeInsets.symmetric(horizontal: 8, vertical: 16),
    child: ListView.builder(
      itemCount: allProducts.length,
      itemExtent: 155.h,
      itemBuilder: (context, index) {
        final product = allProducts[index];
        return CustomHorizontalContainer(
          product: product,
          onTap: () {
            // GoRouter.of(context).goNamed(
            //   APP_PAGE.shopProductCard.toName,
            // );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MobileProductDatail(product: product),
              ),
            );
          },
          isSale: product.isSale!,
        );
      },
    ),
  );
}

bottomSheet(
  BuildContext context,
  String type,
  String collection,
  String category,
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

button(BuildContext context, String title, bool isActive, Function() onTab) {
  return InkWell(
    onTap: onTab,
    child: Container(
      height: 48.h,
      width: MediaQuery.of(context).size.width,
      color: isActive ? Colors.red : Colors.white,
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.black54,
              fontSize: 16.sp,
            ),
          ),
        ),
      ),
    ),
  );
}
