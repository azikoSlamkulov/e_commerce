import 'package:e_commerce/src/core/data/remote/fake_data/fake_product_data.dart';
import 'package:e_commerce/src/module/shop/presentation/widgets/custom_list_view.dart';
import 'package:e_commerce/src/util/app_widgets/buttons/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/routes/router_utils.dart';
import '../../../domain/entities/product_entity.dart';
import '../../widgets/slider_carusel.dart';

class MobileHomeViewVerTwo extends StatelessWidget {
  const MobileHomeViewVerTwo({
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
    return NestedMobileHomeViewVerTwo(
      allSaleProducts: allSaleProducts,
      allNewProducts: allNewProducts,
    );
  }
}

class NestedMobileHomeViewVerTwo extends StatelessWidget {
  const NestedMobileHomeViewVerTwo({
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
        child: Column(
          children: [
            const SliderCarusel(),
            CustomElevatedButton(
              sizedBoxHeight: 70.h,
              sizedBoxWidth: ScreenUtil().screenWidth,
              paddingHorizontal: 15,
              paddingVertical: 10,
              onPressed: () {
                //   GoRouter.of(context).goNamed(
                //     APP_PAGE.shopCategoriesFirst.toName,
                //   );
              },
              text: Text(
                'Category',
                style: TextStyle(fontSize: 18.sp),
              ),
            ),
            CustomListView(
              allProducts: allSaleProducts,
              title: 'Sale',
              subTitle: 'Super summer sale',
              isSale: true,
            ),
            CustomListView(
              allProducts: allNewProducts,
              title: 'New',
              subTitle: 'You’ve never seen it before!',
              isSale: false,
            ),
            companyInfo(),
          ],
        ),
      ),
    );
  }
}

companyInfo() {
  return Container(
    margin: REdgeInsets.only(top: 60),
    height: 120.h,
    width: double.infinity,
    decoration: const BoxDecoration(
      color: Colors.blue,
    ),
    child: const Center(
      child: Text(
        'Company Info',
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}
