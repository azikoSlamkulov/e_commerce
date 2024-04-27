import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobileHomeVerThreeView extends StatelessWidget {
  const MobileHomeVerThreeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductBloc>(
      create: (context) => sl<ProductBloc>()..add(GetNewAndSaleProductsEvent()),
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is LoadingProductstState) {
            return const LoadingWidget();
          } else if (state is LoadedProductsState) {
            return NestedMobileHomeVerThreeView(
              newProducts:
                  state.allProducts.where((i) => i.isNew == true).toList(),
              saleProducts:
                  state.allProducts.where((i) => i.isSale == true).toList(),
            );
          } else if (state is ProductFailureState) {
            return MyErrorWidget(message: state.message);
          } else {
            return const SomeErrorWidget();
          }
        },
      ),
    );
  }
}

class NestedMobileHomeVerThreeView extends StatelessWidget {
  const NestedMobileHomeVerThreeView({
    super.key,
    required this.newProducts,
    required this.saleProducts,
  });

  final List<ProductEntity> newProducts;
  final List<ProductEntity> saleProducts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Banner
            const SliderCaruselWidget(),

            33.verticalSpace,

            /// Sale product list
            CustomHorizontalListViewWidget(
              products: saleProducts,
              title: 'Sale',
              subtitle: 'Super summer sale',
            ),

            33.verticalSpace,

            /// New product list
            CustomHorizontalListViewWidget(
              products: newProducts,
              title: 'New',
              subtitle: 'You’ve never seen it before!',
            ),

            /// Company Info
            const CompanyInfoWidget(),
          ],
        ),
      ),
    );
  }
}
