import 'package:e_commerce/src/core/data/remote/fake_data/fake_product_data.dart';
import 'package:e_commerce/src/module/shop/presentation/widgets/custom_list_view.dart';
import 'package:e_commerce/src/util/app_widgets/buttons/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../util/app_constants/text_styles/app_text_styles.dart';
import '../../../../../util/app_widgets/custom_vertical_container.dart';
import '../../../../app/routes/router_utils.dart';
import '../../../domain/entities/product_entity.dart';
import '../../widgets/slider_carusel.dart';

class MobileSaleView extends StatelessWidget {
  const MobileSaleView({
    Key? key,
    //required this.product,
  }) : super(key: key);

  //final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (context) => sl<ProductBloc>()
    //     ..add(const GetAllSortedProductsByQueryEvent('isNew', true)),

    //   child: BlocBuilder<ProductBloc, ProductState>(
    //     builder: (context, state) {
    //       if (state is LoadingState) {
    //         //return const LoadingWidget();
    //         return const Center(child: CircularProgressIndicator());
    //       } else if (state is LoadedAllSortedProductsByQueryState) {
    //         return HomeView2(
    //           allProducts: state.allSortedProducts,
    //         );
    //       } else if (state is ProductFailureState) {
    //         //return MyErrorWidget('${state.exception}');
    //         return Text('');
    //       } else {
    //         //return const SomeError();,
    //         return Text('');
    //       }
    //     },
    //   ),
    // );
    final allSaleProducts = FakeProductData()
        .allFakeProducts
        .where((i) => i.isSale == true)
        .toList();
    final allNewProducts = FakeProductData()
        .allFakeProducts
        .where((i) => i.isNew == true)
        .toList();
    return NestedMobileSaleView(
      allSaleProducts: allSaleProducts,
      allNewProducts: allNewProducts,
    );
  }
}

class NestedMobileSaleView extends StatelessWidget {
  const NestedMobileSaleView({
    super.key,
    required this.allSaleProducts,
    required this.allNewProducts,
  });

  final List<ProductEntity> allSaleProducts;
  final List<ProductEntity> allNewProducts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.only(bottom: 25),
          child: Column(
            children: [
              /// Main image
              Stack(
                children: [
                  Container(
                    //color: Colors.red,
                    height: 180.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/bgImage11.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10.w,
                    bottom: 32.h,
                    child: Text(
                      'Street clothes',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 34.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              ///
              33.verticalSpace,
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sale',
                          style: AppTextStyles.black34Bold,
                        ),
                        4.verticalSpace,
                        Text(
                          'Super summer sale',
                          style: AppTextStyles.grey11,
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'View all',
                        style: AppTextStyles.grey11,
                      ),
                    ),
                  ],
                ),
              ),

              /// Sale product list
              22.verticalSpace,
              SizedBox(
                height: 300.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: allSaleProducts.length,
                  itemBuilder: (context, index) {
                    final product = allSaleProducts[index];
                    return CustomVerticalContainer(
                      product: product,
                      onTap: () {
                        GoRouter.of(context).goNamed(
                          AppPage.shopProductCard.toName,
                        );
                      },
                      //isSale: true,
                      sizedHeight: 220.h,
                    );
                  },
                ),
              ),
              // CustomListView(
              //   allProducts: allSaleProducts,
              //   title: 'Sale',
              //   subTitle: 'Super summer sale',
              //   isSale: true,
              // ),

              ///
              33.verticalSpace,
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'New',
                          style: AppTextStyles.black34Bold,
                        ),
                        4.verticalSpace,
                        Text(
                          'You’ve never seen it before!',
                          style: AppTextStyles.grey11,
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'View all',
                        style: AppTextStyles.grey11,
                      ),
                    ),
                  ],
                ),
              ),

              /// New product list
              22.verticalSpace,
              SizedBox(
                height: 300.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: allNewProducts.length,
                  itemBuilder: (context, index) {
                    final product = allNewProducts[index];
                    return CustomVerticalContainer(
                      product: product,
                      onTap: () {
                        GoRouter.of(context).goNamed(
                          AppPage.shopProductCard.toName,
                        );
                      },
                      //isSale: false,
                      sizedHeight: 220.h,
                    );
                  },
                ),
              ),
              // CustomListView(
              //   allProducts: allNewProducts,
              //   title: 'New',
              //   subTitle: 'You’ve never seen it before!',
              //   isSale: false,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
