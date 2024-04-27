import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobileCheckoutView extends StatelessWidget {
  const MobileCheckoutView({
    Key? key,
    required this.allProducts,
    required this.totalAmount,
  }) : super(key: key);

  final List<BagEntity> allProducts;
  final double totalAmount;

  @override
  Widget build(BuildContext context) {
    String userID;
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthenticatedState) {
          return NestedCheckoutView(
            allProducts: allProducts,
            totalAmount: totalAmount,
            user: state.user,
          );
          // userID = state.user.userID!;
          // BlocProvider.of<BagBloc>(context).add(
          //   GetAllProductFromCartEvent(),
          // );

          // return BlocListener<BagBloc, BagState>(
          //   listener: (context, state) {
          //     if (state is DeletedProductFromCartState) {
          //       BlocProvider.of<BagBloc>(context).add(
          //         GetAllProductFromCartEvent(),
          //       );
          //     }
          //     // if (state is NewQuantityState) {
          //     //   BlocProvider.of<BagBloc>(context).add(
          //     //     GetAllProductFromCartEvent(),
          //     //   );
          //     // }
          //   },
          //   child: BlocBuilder<BagBloc, BagState>(
          //     builder: (context, state) {
          //       if (state is LoadingBagState) {
          //         return const Center(child: CircularProgressIndicator());
          //       } else if (state is LoadedAllProductsFromCartState) {
          //         return NestedMobileBagViwe(
          //           allProducts: state.allProducts,
          //           totalAmount: state.totalAmount,
          //         );
          //       } else if (state is FailureState) {
          //         //return MyErrorWidget('${state.exception}');
          //         return Text('11111');
          //       }
          //       return Text('22222');
          //     },
          //   ),
          // );
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

class NestedCheckoutView extends StatelessWidget {
  final List<BagEntity> allProducts;
  final double totalAmount;
  final AuthUserEntity user;

  const NestedCheckoutView({
    super.key,
    required this.allProducts,
    required this.totalAmount,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColorMain,
      appBar: CustomAppBar(
        title: 'Checkout',
        showSearchBtn: false,
        showBackBtn: true,
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16, vertical: 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Shipping address
            checkoutTitle('Shipping address'),
            20.verticalSpace,
            Container(
              height: 108.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 25, vertical: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Jane Doe', style: AppTextStyles.black14Bold),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MobileShippingAddressView(),
                              ),
                            );
                          },
                          child: Text('Change', style: AppTextStyles.red14),
                        ),
                      ],
                    ),
                    12.verticalSpace,
                    Text('Toktogul, 45', style: AppTextStyles.black14),
                    5.verticalSpace,
                    Text(
                      'Bishkek, Kyrgyzstan',
                      style: AppTextStyles.black14,
                    ),
                  ],
                ),
              ),
            ),
            57.verticalSpace,

            /// Payment method
            Padding(
              padding: REdgeInsets.only(right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  checkoutTitle('Payment'),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const MobilePaymentMethodsView(),
                        ),
                      );
                    },
                    child: Text('Change', style: AppTextStyles.red14),
                  ),
                ],
              ),
            ),
            20.verticalSpace,
            Row(
              children: [
                Container(
                  height: 38.h,
                  width: 64.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: AppAssets.mastercard(width: 64.h, height: 38.h),
                ),
                17.horizontalSpace,
                Text('***** ***** ***** ***3947', style: AppTextStyles.black14),
              ],
            ),
            57.verticalSpace,

            /// Delivery method
            checkoutTitle('Delivery method'),
            21.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildDileveryCard(
                  image: AppAssets.fedex(width: 60.h, height: 37.h),
                ),
                22.horizontalSpace,
                buildDileveryCard(
                  image: AppAssets.usps(width: 60.h, height: 37.h),
                ),
                22.horizontalSpace,
                buildDileveryCard(
                  image: AppAssets.dhl(width: 60.h, height: 37.h),
                ),
              ],
            ),
            52.verticalSpace,

            ///
            buildOrder(text: 'Order:', value: '112'),
            14.verticalSpace,
            buildOrder(text: 'Delivery:', value: '15'),
            14.verticalSpace,
            buildOrder(text: 'Summary:', value: '127'),
            45.verticalSpace,

            /// Button
            CustomButton(
              onPressed: () => BlocProvider.of<BagBloc>(context).add(
                SetOrderEvent(
                  OrderEntity(
                    orderNumber: 1947034,
                    userID: user.userID,
                    userName: user.name,
                    trackingNumber: 'IW3475453455',
                    //status: 'delivered',
                    items: allProducts,
                    shippingAddress: 'United States',
                    paymentMethod: 'paymentMethod',
                    deliveryMethod: 'FedEx, 3 days, 15',
                    discount: '10%, Personal promo code',
                    totalAmount: totalAmount.toInt(),
                  ),
                ),
              ),
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const SuccessViewSecond(),
              //   ),
              // );
              text: 'SUBMIT ORDER',
            ),
          ],
        ),
      ),
    );
  }
}

checkoutTitle(String text) {
  return Text(
    text,
    style: AppTextStyles.black16Bold,
  );
}

buildDileveryCard({required Image image}) {
  return Expanded(
    child: Container(
      height: 72.h,
      width: 100.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image,
          //3.verticalSpace,
          Text(
            '2-3 days',
            style: AppTextStyles.grey11,
          ),
        ],
      ),
    ),
  );
}

buildOrder({required String text, required String value}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        text,
        style: AppTextStyles.grey16,
      ),
      Text(
        '$value\$',
        style: AppTextStyles.black16Bold,
      ),
    ],
  );
}
