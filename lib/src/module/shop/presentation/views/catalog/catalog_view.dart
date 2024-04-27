import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    //String choice = 'Price: lowest to high';
    return MultiBlocProvider(
      providers: [
        BlocProvider<OrientationCubit>(
          create: (context) => sl<OrientationCubit>(),
        ),
        BlocProvider<ProductBloc>(
          create: (context) => sl<ProductBloc>()
            ..add(GetProductsByQueryEvent(
              firstQuery: type,
              secondQuery: collection,
              thirdQuery: category,
            )),
        ),
      ],
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is LoadingProductstState) {
            //return const LoadingWidget();
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadedProductsState) {
            return NestedMobileCatalogView(
              allProducts: state.allProducts,
              //allProducts: FakeData().allFakeProducts,
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
    // return NestedMobileCatalogView(
    //   allProducts: allFakeProducts,
    //   collection: collection,
    //   type: type,
    //   category: category,
    //   allCategories: allCategories,
    // );
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
    //String _choice;

    return Scaffold(
      backgroundColor: AppColors.bgColorMain,
      appBar: CustomAppBar(
        title: '$type\'s ${category.toLowerCase()}',
        showSearchBtn: true,
      ),
      body: Column(
        children: [
          /// Categories list
          WidgetGroup(
            allCategories: allCategories,
            type: type,
            collection: collection,
            category: category,
          ),

          /// Products List
          BlocBuilder<OrientationCubit, OrientationState>(
            builder: (context, state) {
              // return state.orientation
              //     ? CatalogGridView(products: allProducts)
              //     : CatalogListView(products: allProducts);

              return allProducts.isEmpty
                  ? Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Список пуст!',
                        style: AppTextStyles.grey16,
                      ),
                    )
                  : state.orientation
                      ? Expanded(
                          child: GridView.builder(
                            padding: REdgeInsets.all(16),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 17.h,
                              //mainAxisSpacing: 17.h,
                              mainAxisExtent: 315.h,
                              crossAxisCount: 2,
                              //childAspectRatio: 90.h / 140.h,
                            ),
                            itemCount: allProducts.length,
                            itemBuilder: (context, index) {
                              final product = allProducts[index];
                              return ProductVerticalCard(
                                product: product,
                                allProducts: allProducts,
                              );
                            },
                          ),
                        )
                      : Expanded(
                          child: ListView.separated(
                            padding: REdgeInsets.all(14),
                            itemCount: allProducts.length,
                            //itemExtent: 155.h,
                            itemBuilder: (context, index) {
                              final product = allProducts[index];
                              return ProductHorizontalCard(
                                product: product,
                                allProducts: allProducts,
                              );
                            },
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 12.h),
                          ),
                        );
            },
          ),
        ],
      ),
    );
  }
}
