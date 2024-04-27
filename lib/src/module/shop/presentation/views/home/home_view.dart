import 'dart:developer';

import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobileHomeView extends StatelessWidget {
  const MobileHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('build 1');
    return BlocProvider<ProductBloc>(
      create: (context) => sl<ProductBloc>()..add(GetNewAndSaleProductsEvent()),
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is LoadingProductstState) {
            return const LoadingWidget();
          } else if (state is LoadedProductsState) {
            return NestedMobileHomeView(
              newProducts:
                  state.allProducts.where((i) => i.isNew == true).toList(),
              topProducts: const [],
            );
          } else if (state is ProductFailureState) {
            return MyErrorWidget(message: state.message);
          }
          return const SomeErrorWidget();
        },
      ),
    );
  }
}

class NestedMobileHomeView extends StatelessWidget {
  const NestedMobileHomeView({
    super.key,
    required this.newProducts,
    required this.topProducts,
  });

  final List<ProductEntity> newProducts;
  final List<ProductEntity> topProducts;

  @override
  Widget build(BuildContext context) {
    log('build 2');
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.only(bottom: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Big Banner
              const BigBannerWdget(),

              33.verticalSpace,

              /// New  product list
              CustomHorizontalListViewWidget(
                products: newProducts,
                title: 'New',
                subtitle: 'You’ve never seen it before!',
              ),

              33.verticalSpace,

              /// Top sales  product list
              CustomHorizontalListViewWidget(
                products: topProducts,
                title: 'Top',
                subtitle: 'Top salse of the week.',
              ),

              /// Company info
              //const CompanyInfoWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
