import 'package:e_commerce/src/core/data/remote/fake_data/fake_product_data.dart';
import 'package:e_commerce/src/module/shop/domain/entities/category_entity.dart';

import 'mobile.dart';

class MobileHomeView extends StatelessWidget {
  const MobileHomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProductBloc>()
        ..add(const GetAllSortedProductsByQueryEvent('isNew', true)),
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoadingState) {
            //return const LoadingWidget();
            return const Scaffold(
              backgroundColor: AppColors.white,
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
            //return const Center(child: CircularProgressIndicator());
          } else if (state is LoadedAllProductsState) {
            final allFakeNewProducts = FakeProductData().allFakeProducts;
            return NestedMobileHomeView(
              allProducts: allFakeNewProducts,
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

class NestedMobileHomeView extends StatelessWidget {
  const NestedMobileHomeView({
    super.key,
    required this.allProducts,
  });

  final List<ProductEntity> allProducts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.only(bottom: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Main Image
              //mainImageWidget(context),
              Stack(
                children: [
                  Container(
                    //color: Colors.red,
                    height: 550.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/image_1.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10.w,
                    bottom: 32.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Fashion',
                          style: AppTextStyles.white48Bold,
                        ),
                        Text(
                          'sale',
                          style: AppTextStyles.white48Bold,
                        ),
                        18.verticalSpace,
                        CustomElevatedButton(
                          sizedBoxHeight: 36.h,
                          sizedBoxWidth: 160.h,
                          borderRadius: 30,
                          text: Text(
                            'Check',
                            style: TextStyle(
                              fontSize: 14.sp,
                            ),
                          ),
                          onPressed: () {
                            List<CategoryEntity> allCategories = [];
                            context.goNamed(
                              "shopCatalog",
                              queryParams: {
                                'type': 'null',
                                'collection': 'null',
                                'category': 'Sale',
                              },
                              extra: allCategories,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 10.w,
                    top: 32.h,
                    child: TextButton(
                      child: const Text(
                        'Ver.2',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                      onPressed: () {
                        GoRouter.of(context).goNamed(
                          AppPage.homeVerTwo.toName,
                        );
                      },
                    ),
                  ),
                ],
              ),

              /// New
              33.verticalSpace,
              buildProductsTitle(
                  context, 'NEW', 'You’ve never seen it before!'),

              /// Product List
              22.verticalSpace,
              buildListView(
                allProducts.where((i) => i.isNew == true).toList(),
              ),

              /// Top sales
              40.verticalSpace,
              buildProductsTitle(context, 'TOP', 'Top salse of the week.'),

              /// Product List
              22.verticalSpace,
              buildListView(allProducts),
            ],
          ),
        ),
      ),
    );
  }
}

buildProductsTitle(BuildContext context, String title, String subtilte) {
  return Padding(
    padding: REdgeInsets.symmetric(horizontal: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.black34Bold,
            ),
            4.verticalSpace,
            Text(
              subtilte,
              style: AppTextStyles.grey11,
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            List<CategoryEntity> allCategories = [];
            context.goNamed(
              "shopCatalog",
              queryParams: {
                'type': 'null',
                'collection': 'null',
                'category': 'New',
              },
              extra: allCategories,
            );
          },
          child: Text(
            'View all',
            style: AppTextStyles.grey11,
          ),
        ),
      ],
    ),
  );
}

buildListView(List<ProductEntity> allProducts) {
  return SizedBox(
    height: 300.h,
    child: allProducts.isNotEmpty
        ? ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: allProducts.length,
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
                      builder: (context) =>
                          MobileProductDatail(product: product),
                    ),
                  );
                },
                //isSale: false,
                sizedHeight: 220.h,
              );
            },
          )
        : Align(
            alignment: Alignment.center,
            child: Text(
              'Список пуст!',
              style: AppTextStyles.grey16,
            ),
          ),
  );
}

// mainImageWidget(BuildContext context) {
//   return Stack(
//     children: [
//       Container(
//         //color: Colors.red,
//         height: 550.h,
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/images/image_1.jpg'),
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//       Positioned(
//         left: 10.w,
//         bottom: 32.h,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Fashion',
//               style: AppTextStyles.white48Bold,
//             ),
//             Text(
//               'sale',
//               style: AppTextStyles.white48Bold,
//             ),
//             18.verticalSpace,
//             CustomElevatedButton(
//               sizedBoxHeight: 36.h,
//               sizedBoxWidth: 160.h,
//               borderRadius: 30,
//               text: Text(
//                 'Check',
//                 style: TextStyle(
//                   fontSize: 14.sp,
//                 ),
//               ),
//               onPressed: () {
//                 GoRouter.of(context).goNamed(
//                   APP_PAGE.sale.toName,
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       Positioned(
//         right: 10.w,
//         top: 32.h,
//         child: TextButton(
//           child: const Text(
//             'Ver.2',
//             style: TextStyle(
//               color: Colors.blue,
//             ),
//           ),
//           onPressed: () {
//             GoRouter.of(context).goNamed(
//               APP_PAGE.homeVerTwo.toName,
//             );
//           },
//         ),
//       ),
//     ],
//   );
// }
