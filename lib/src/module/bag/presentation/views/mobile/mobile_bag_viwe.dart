import 'dart:developer';
import 'package:collection/collection.dart';

import '../../../../auth/auth.dart';
import '../../../../auth/presentation/views/auth_check_view.dart';
import 'mobile.dart';

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
            GetAllProductFromCartEvent(
              userID,
            ),
          );

          return BlocListener<BagBloc, BagState>(
            listener: (context, state) {
              if (state is DeletedProductFromCartState) {
                BlocProvider.of<BagBloc>(context).add(
                  GetAllProductFromCartEvent(
                    userID,
                  ),
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
                    subTotal: state.totalAmount,
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
          return AuthCheckView();
        }
        return const Center(
            child: Text(
          'Some Error',
          style: TextStyle(color: Colors.black),
        ));
      },
    );
  }
}

class NestedMobileBagViwe extends StatelessWidget {
  NestedMobileBagViwe({
    required this.allProducts,
    required this.subTotal,
    super.key,
  });

  List<BagEntity> allProducts;
  double subTotal;

  @override
  Widget build(BuildContext context) {
    TextEditingController promoCodeController = TextEditingController();
    List<double> totalAmountList = [];
    double totalAmount = totalAmountList.sum;
    return Scaffold(
        backgroundColor: AppColors.bgColorMain,
        appBar: CustomAppBar(
          title: 'My bag',
          showSearchBtn: true,
          showBackBtn: false,
        ),
        body: Column(
          children: [
            /// Product List
            SizedBox(
              //height: 550.h,
              height: 480.h,
              child: ListView.builder(
                itemCount: allProducts.length,
                itemExtent: 155.h,
                itemBuilder: (context, index) {
                  final product = allProducts[index];
                  return BagHorizontalCard(
                    product: product,
                    onTap: () {},
                    //isSale: product.isSale!,
                  );
                },
              ),
              // BlocBuilder<BagBloc, BagState>(
              //   builder: (context, state) {
              //     if (state is LoadingBagState) {
              //       return const Center(child: CircularProgressIndicator());
              //     } else if (state is LoadedAllProductsFromCartState) {
              //       return ListView.builder(
              //         itemCount: state.allProducts.length,
              //         itemExtent: 155.h,
              //         itemBuilder: (context, index) {
              //           final product = state.allProducts[index];
              //           totalAmountList.add(product.price!);
              //           //totalAmount = totalAmountList.sum;
              //           return BagHorizontalCard(
              //             product: product,
              //             onTap: () {},
              //             //isSale: product.isSale!,
              //           );
              //         },
              //       );
              //     } else if (state is FailureState) {
              //       //return MyErrorWidget('${state.exception}');
              //       return Text('11111');
              //     } else {
              //       //return const SomeError();,
              //       return Text('22222');
              //     }
              //   },
              // ),
            ),

            /// Promo Code
            30.verticalSpace,
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: CustomTextFormField(
                controller: promoCodeController,
                labelText: 'Enter your promo code',
                //suffix: Icon(Icons.arrow_circle_right_outlined),
                suffixIcon: Icon(Icons.arrow_circle_right_outlined),
                sizedBoxHeight: 40.h,
                sizedBoxWidth: double.infinity,
              ),
            ),
            30.verticalSpace,
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
                    '$subTotal\$',
                    style: AppTextStyles.black14Bold,
                  ),
                ],
              ),
            ),

            /// Button
            30.verticalSpace,
            Container(
              //padding: REdgeInsets.only(left: 16, right: 16, top: 20, bottom: 20),
              padding: REdgeInsets.symmetric(horizontal: 16),
              height: 48.h,
              color: AppColors.bgColorMain,
              child: CustomElevatedButton(
                sizedBoxHeight: 48.h,
                sizedBoxWidth: MediaQuery.of(context).size.width,
                borderRadius: 30,
                bgColor: AppColors.mainColor,
                text: Text(
                  'CHECK OUT',
                  style: TextStyle(color: Colors.white, fontSize: 14.sp),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ));
  }
}
