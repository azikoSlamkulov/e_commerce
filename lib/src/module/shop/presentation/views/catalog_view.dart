import 'package:e_commerce/lib.dart';

class MobileCatalogView extends StatelessWidget {
  const MobileCatalogView({
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
    // BlocProvider.of<ProductListBloc>(context).add(
    //   GetSortedProductsEvent(
    //     firstQuery: type,
    //     secondQuery: collection,
    //     thirdQuery: category,
    //   ),
    // );

    return MultiBlocProvider(
      providers: [
        BlocProvider<OrientationCubit>(
          create: (context) => sl<OrientationCubit>(),
        ),
        BlocProvider<ProducBloc>(
          create: (context) => sl<ProducBloc>()
            ..add(GetProductsByQueryEvent(
              firstQuery: type,
              secondQuery: collection,
              thirdQuery: category,
            )),
        ),
      ],
      child: BlocBuilder<ProducBloc, ProductState>(
        builder: (context, state) {
          if (state is LoadingProductstState) {
            //return const LoadingWidget();
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadedProductsState) {
            return NestedMobileCatalogView(
              allProducts: state.allProducts,
              collection: collection,
              type: type,
              category: category,
              allCategories: allCategories,
            );
          } else if (state is ProductFailureState) {
            //return MyErrorWidget('//${state.exception}');
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
    required this.allProducts,
    required this.type,
    required this.collection,
    required this.category,
    this.allCategories,
  });

  final List<ProductEntity> allProducts;
  final List<CategoryEntity>? allCategories;
  final String type;
  final String collection;
  final String category;

  @override
  Widget build(BuildContext context) {
    //bool isVerticalList = false;
    String _choice;
    //final categories = CategoriesData().categories;

    return Scaffold(
      backgroundColor: AppColors.bgColorMain,
      appBar: CustomAppBar(
        title: '$type\'s ${category.toLowerCase()}',
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
                  child: ListView.separated(
                    padding: REdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    scrollDirection: Axis.horizontal,
                    itemCount: allCategories!.length,
                    itemBuilder: (context, index) {
                      final newCategory = allCategories![index];
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
                  // : CustomElevatedButton(
                  //     text: const Text('CATEGORIES'),
                  //     onPressed: () {
                  //       context.goNamed(
                  //         AppPage.collections.toName,
                  //       );
                  //     },
                  //   ),

                  )
              : SizedBox(),
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
                      // context.goNamed(
                      //   AppPage.catalogFilters.toName,
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

          /// Products List
          BlocBuilder<OrientationCubit, OrientationState>(
            builder: (context, state) {
              return state.orientation
                  // ? Expanded(child: buildCatalogProductsGridView(allProducts))
                  // : Expanded(child: buildCatalogProductsListView(allProducts));
                  ? CatalogGridView(products: allProducts)
                  : CatalogListView(products: allProducts);
            },
          ),
        ],
      ),
    );
  }
}

// Widget buildCatalogProductsGridView(List<ProductEntity> allProducts) {
//   return allProducts.isNotEmpty
//       ? GridView.builder(
//           padding: REdgeInsets.all(16),
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisSpacing: 17.h,
//             //mainAxisSpacing: 17.h,
//             mainAxisExtent: 315.h,
//             crossAxisCount: 2,
//             //childAspectRatio: 90.h / 140.h,
//           ),
//           itemCount: allProducts.length,
//           itemBuilder: (context, index) {
//             final product = allProducts[index];
//             return ProductVerticalContainer(
//               product: product,
//               onTap: () {
//                 // GoRouter.of(context).goNamed(
//                 //   APP_PAGE.shopProductCard.toName,
//                 // );
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) =>
//                         MobileProductDatailView(product: product),
//                   ),
//                 );
//               },
//             );
//           },
//         )
//       : Align(
//           alignment: Alignment.center,
//           child: Text(
//             'Список пуст!',
//             style: AppTextStyles.grey16,
//           ),
//         );
// }

// Widget buildCatalogProductsListView(List<ProductEntity> allProducts) {
//   return allProducts.isNotEmpty
//       ? ListView.separated(
//           padding: REdgeInsets.all(14),
//           itemCount: allProducts.length,
//           //itemExtent: 155.h,
//           itemBuilder: (context, index) {
//             final product = allProducts[index];
//             return ProductHorizontalContainer(
//               product: product,
//               onTap: () {
//                 // GoRouter.of(context).goNamed(
//                 //   APP_PAGE.shopProductCard.toName,
//                 // );
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) =>
//                         MobileProductDatailView(product: product),
//                   ),
//                 );
//               },
//             );
//           },
//           separatorBuilder: (context, index) => SizedBox(height: 12.h),
//         )
//       : Align(
//           alignment: Alignment.center,
//           child: Text(
//             'Список пуст!',
//             style: AppTextStyles.grey16,
//           ),
//         );
// }

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
