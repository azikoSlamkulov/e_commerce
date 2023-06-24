import 'package:e_commerce/lib.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

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
                                    const MobileShippingAddressView(),
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
            CustomElevatedButton(
              sizedBoxHeight: 48.h,
              sizedBoxWidth: double.infinity,
              borderRadius: 30,
              bgColor: AppColors.mainColor,
              text: Text(
                'SUBMIT ORDER',
                style: AppTextStyles.white14,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SuccessViewSecond(),
                  ),
                );
              },
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
