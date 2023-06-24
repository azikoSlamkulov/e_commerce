import 'package:e_commerce/lib.dart';

class MobileHomeView extends StatelessWidget {
  const MobileHomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<ProductBloc>(context)
    //     .add(const GetAllSortedProductsByQueryEvent('isNew', true));
    //BlocProvider.of<ProductListBloc>(context).add(GetProductsListEvent());
    return BlocProvider<ProducBloc>(
      create: (context) => sl<ProducBloc>()
        ..add(const GetAllSortedProductsByQueryEvent('isNew', true)),
      child: BlocBuilder<ProducBloc, ProductState>(
        builder: (context, state) {
          if (state is LoadingProductstState) {
            //return const LoadingWidget();
            return const Scaffold(
              backgroundColor: AppColors.white,
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
            //return const Center(child: CircularProgressIndicator());
          } else if (state is LoadedProductsState) {
            return NestedMobileHomeView(
              //allProducts: FakeProductData().allFakeProducts,
              allProducts: state.allProducts,
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
                              AppPage.catalog.name,
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
                        context.goNamed(
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
              22.verticalSpace,
              HomeListView(
                // allProducts: allProducts.where((i) => i.isNew == true).toList(),
                // allProducts: allProducts
                //     .where((i) =>
                //         DateTimeFormatter().isNew(i.createdDate!) == true)
                //     .toList(),
                products: allProducts,
              ),

              /// Top sales
              40.verticalSpace,
              buildProductsTitle(context, 'TOP', 'Top salse of the week.'),
              22.verticalSpace,
              HomeListView(
                products: allProducts,
              ),
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
              AppPage.catalog.name,
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
