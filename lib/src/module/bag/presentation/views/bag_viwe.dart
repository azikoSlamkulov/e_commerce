import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MobileBagViwe extends StatelessWidget {
  const MobileBagViwe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String userID;
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthenticatedState) {
          userID = state.user.userID!;
          BlocProvider.of<BagBloc>(context).add(
            GetAllProductFromCartEvent(),
          );

          return BlocListener<BagBloc, BagState>(
            listener: (context, state) {
              if (state is DeletedProductFromCartState) {
                BlocProvider.of<BagBloc>(context).add(
                  GetAllProductFromCartEvent(),
                );
              }
            },
            child: BlocBuilder<BagBloc, BagState>(
              builder: (context, state) {
                if (state is LoadingBagState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is LoadedAllProductsFromCartState) {
                  return NestedMobileBagViwe(
                    allProducts: state.allProducts,
                    totalAmount: state.totalAmount,
                    userId: userID,
                  );
                  // return BlocProvider(
                  //   create: (context) =>
                  //       sl<CounterCubit>()..getTotalAmount(state.allProducts),
                  //   child: NestedMobileBagViwe(
                  //     allProducts: state.allProducts,
                  //     totalAmount: state.totalAmount,
                  //     userId: userID,
                  //   ),
                  // );
                } else if (state is BagFailureState) {
                  //return MyErrorWidget('${state.exception}');
                  return Text('11111');
                }
                return Text('22222');
              },
            ),
          );
        } else if (state is UnAuthenticatedState) {
          return AuthCheckView();
        }
        return const Center(
          child: Text(
            'Some Error',
            style: TextStyle(color: Colors.black),
          ),
        );
      },
    );
  }
}

class NestedMobileBagViwe extends StatelessWidget {
  NestedMobileBagViwe({
    required this.allProducts,
    required this.totalAmount,
    required this.userId,
    super.key,
  });

  final List<BagEntity> allProducts;
  final String userId;
  final double totalAmount;
  static TextEditingController promoCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColorMain,
      appBar: allProducts.isNotEmpty ? buildAppBar() : null,
      body: buildBody(context),
    );
  }

  CustomAppBar buildAppBar() {
    return CustomAppBar(
      title: 'My bag',
      showSearchBtn: true,
      showBackBtn: false,
    );
  }

  buildBody(
    BuildContext context,
  ) {
    return allProducts.isNotEmpty
        ? SingleChildScrollView(
            child: Padding(
              padding:
                  REdgeInsets.only(top: 16, left: 16, right: 16, bottom: 20),
              child: Column(
                children: [
                  /// Product List
                  Container(
                    constraints: BoxConstraints(minHeight: 450.h),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: allProducts.length,
                      //itemExtent: 155.h,
                      itemBuilder: (context, index) {
                        final product = allProducts[index];

                        return BlocProvider.value(
                          value: BlocProvider.of<BagBloc>(context),
                          child: BagHorizontalCard(
                            product: product,
                            // productCallback: (BagEntity value) {},
                            //isSale: product.isSale!,
                          ),
                        );
                      },
                    ),
                  ),

                  /// Promo Code
                  15.verticalSpace,
                  CustomTextFormField(
                    controller: promoCodeController,
                    labelText: 'Enter your promo code',
                    //suffix: Icon(Icons.arrow_circle_right_outlined),
                    suffixIcon: const Icon(Icons.arrow_circle_right_outlined),
                    sizedBoxHeight: 40.h,
                    sizedBoxWidth: double.infinity,
                  ),
                  25.verticalSpace,
                  Padding(
                    padding: REdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total amount:',
                          style: AppTextStyles.grey14,
                        ),
                        Text(
                          '$totalAmount\$',
                          style: AppTextStyles.black14Bold,
                        ),
                      ],
                    ),
                  ),

                  /// Button
                  25.verticalSpace,

                  CustomButton(
                    onPressed: () => context.goNamed(
                      AppPage.checkout.toName,
                      extra: allProducts,
                      queryParams: {
                        'totalAmount': totalAmount.toString(),
                        'userId': userId
                      },
                    ),
                    text: 'CHECK OUT',
                  ),
                ],
              ),
            ),
          )
        : Align(
            alignment: Alignment.center,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_shopping_cart,
                    color: Colors.grey,
                    size: 100.h,
                  ),
                  50.verticalSpace,
                  Text(
                    'Корзина пуста!',
                    style: AppTextStyles.grey16,
                  ),
                ],
              ),
            ),
          );
  }
}
