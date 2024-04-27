import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MobileFavoritesVew extends StatelessWidget {
  const MobileFavoritesVew({
    Key? key,
    //required this.product,
  }) : super(key: key);

  //final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final fakeCategories = FakeCategoriesData().allFakeCategories;
    //final fakeProducts = FakeProductData().allFakeProducts;
    String userID;

    return BlocProvider(
      create: (context) => OrientationCubit(),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthenticatedState) {
            // return NestedMobileFavoritesVew(
            //   categories: fakeCategories,
            //   allProducts: fakeProducts,
            //   // userID: state.user.userID!,
            // );
            userID = state.user.userID!;
            BlocProvider.of<FavoritesBloc>(context).add(
              GetAllFavoritesProductEvent(
                userID,
              ),
            );

            return BlocListener<FavoritesBloc, FavoritesState>(
              listener: (context, state) {
                if (state is DeletedProductFromFavoritesState) {
                  BlocProvider.of<FavoritesBloc>(context).add(
                    GetAllFavoritesProductEvent(
                      userID,
                    ),
                  );
                }
              },
              child: BlocBuilder<FavoritesBloc, FavoritesState>(
                builder: (context, state) {
                  if (state is LoadingFavoritesState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is LoadedAllFavoritesProductsState) {
                    return NestedMobileFavoritesVew(
                      userID: userID,
                      allProducts: state.allProducts,
                      categories: fakeCategories,
                    );
                  } else if (state is FailureState) {
                    //return MyErrorWidget('${state.exception}');
                    return Text('11111');
                  } else {
                    //return const SomeError();,
                    return Text('22222');
                  }
                },
              ),
            );
          } else if (state is UnAuthenticatedState) {
            return const AuthCheckView();
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
    required this.userID,
    required this.categories,
    required this.allProducts,
    super.key,
  });

  final String userID;
  final List<FavoriteEntity> allProducts;
  final List<CategoryEntity> categories;

  @override
  Widget build(BuildContext context) {
    String _choice = 'Newest';

    return Scaffold(
      backgroundColor: AppColors.bgColorMain,
      appBar: CustomAppBar(
        title: 'Favorites',
        showSearchBtn: true,
      ),
      body: Column(
        children: [
          /// Categories list
          Container(
            color: Colors.white,
            height: 46.h,
            width: double.infinity,
            child: categories.isNotEmpty
                ? ListView.separated(
                    padding: REdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final newCategory = categories[index];
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor: Colors.black,
                        ),
                        onPressed: () {},
                        child: Text(
                          newCategory.categoryName!,
                          style: AppTextStyles.white14,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(width: 8.h),
                  )
                : CustomButton(
                    sizedBoxHeight: 60,
                    text: 'CATEGORIES',
                    onPressed: () {
                      context.goNamed(
                        AppPage.collections.toName,
                      );
                    },
                  ),
          ),

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
                          builder: (context) => MobileCatalogFiltersView(),
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
                  ProductSortWidget(
                    selectedSortBtnCallback: (value) => _choice = value,
                  ),
                  // TextButton.icon(
                  //   onPressed: () {
                  //     modalBottomSheet(context
                  //         // type,
                  //         // collection,
                  //         // category,
                  //         );
                  //   },
                  //   icon: const Icon(
                  //     Icons.swap_vert_outlined,
                  //     color: Colors.black,
                  //   ),
                  //   label: BlocListener<SortToggleBtnCubit, SortToggleBtnState>(
                  //     listener: (context, state) {
                  //       // if (state is InitialState) {
                  //       //   _choice = state.selectedText;
                  //       //   BlocProvider.of<ProductBloc>(context).add(
                  //       //     GetFakeSortedListEvent(
                  //       //       type: type,
                  //       //       collection: collection,
                  //       //       category: category,
                  //       //       choice: state.selectedText,
                  //       //     ),
                  //       //   );
                  //       // } else if (state is SelectedState) {
                  //       //   _choice = state.selectedText;
                  //       //   BlocProvider.of<ProductBloc>(context).add(
                  //       //     GetFakeSortedListEvent(
                  //       //       type: type,
                  //       //       collection: collection,
                  //       //       category: category,
                  //       //       choice: state.selectedText,
                  //       //     ),
                  //       //   );
                  //       // }
                  //     },
                  //     child:
                  //         BlocBuilder<SortToggleBtnCubit, SortToggleBtnState>(
                  //       builder: (context, state) {
                  //         return Text(
                  //           state.selectedText,
                  //           style: AppTextStyles.black11,
                  //         );
                  //       },
                  //     ),
                  //   ),
                  // ),

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

          /// Products List
          BlocBuilder<OrientationCubit, OrientationState>(
            builder: (context, state) {
              return state.orientation
                  ? FavoritesGridView(userID: userID, products: allProducts)
                  : FavoritesListView(userID: userID, products: allProducts);
            },
          ),
        ],
      ),
    );
  }
}

// modalBottomSheet(
//   BuildContext context,
//   // String type,
//   // String collection,
//   // String category,
// ) {
//   return showModalBottomSheet<void>(
//     context: context,
//     backgroundColor: Colors.white,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.only(
//         topLeft: Radius.circular(30.r),
//         topRight: Radius.circular(30.r),
//       ),
//     ),
//     builder: (BuildContext context) {
//       return SizedBox(
//         height: 352.h,
//         child: Column(
//           children: [
//             Center(
//               child: Padding(
//                 padding: REdgeInsets.only(top: 36),
//                 child: Text(
//                   'Sort by',
//                   style: AppTextStyles.black18Bold,
//                 ),
//               ),
//             ),
//             33.verticalSpace,
//             // SortToggleButton(
//             //   selectedSortText: (value) {},
//             //   // type: type,
//             //   // collection: collection,
//             //   // category: category,
//             // ),
//             // button(context, 'Popular', false, () => log('Popular')),
//             // button(context, 'Newest', false, () => log('Newest')),
//             // button(context, 'Customer review', false,
//             //     () => log('Customer review')),
//             // button(context, 'Price: lowest to high', true,
//             //     () => log('Price: lowest to high')),
//             // button(context, 'Price: highest to low', false,
//             //     () => log('Price: highest to low')),
//           ],
//         ),
//       );
//     },
//   );
// }
