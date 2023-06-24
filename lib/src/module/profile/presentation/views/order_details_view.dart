import 'package:e_commerce/lib.dart';

class MobileOrderDetailsView extends StatelessWidget {
  const MobileOrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    List<BagEntity> products = [
      const BagEntity(
        productID: '1',
        userID: '',
        name: 'Wedding dress',
        color: 'White',
        size: 'L',
        price: 100,
        quantity: 1,
        productImgUrl:
            'https://i.pinimg.com/474x/83/cf/18/83cf1832e706ec7e19fe53382aa398f9.jpg',
      ),
      const BagEntity(
        productID: '2',
        userID: '',
        name: 'Wedding dress',
        color: 'White',
        size: 'L',
        price: 100,
        quantity: 1,
        productImgUrl:
            'https://i.pinimg.com/474x/83/cf/18/83cf1832e706ec7e19fe53382aa398f9.jpg',
      ),
      const BagEntity(
        productID: '3',
        userID: '',
        name: 'Wedding dress',
        color: 'White',
        size: 'L',
        price: 100,
        quantity: 1,
        productImgUrl:
            'https://i.pinimg.com/474x/83/cf/18/83cf1832e706ec7e19fe53382aa398f9.jpg',
      ),
    ];
    return Scaffold(
      backgroundColor: AppColors.bgColorMain,
      appBar: CustomAppBar(title: 'Order Details'),
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 15, vertical: 30),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Order №1947034',
                        style: AppTextStyles.black16Bold,
                      ),
                      Text(
                        '05-12-2019',
                        style: AppTextStyles.grey14,
                      ),
                    ],
                  ),
                  15.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Tracking number:  ',
                            style: AppTextStyles.grey14,
                          ),
                          Text(
                            'IW3475453455',
                            style: AppTextStyles.black14,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Delivered',
                            style: AppTextStyles.green14,
                          ),
                        ],
                      ),
                    ],
                  ),
                  16.verticalSpace,
                  Text(
                    '3 items',
                    style: AppTextStyles.black14,
                  ),
                  18.verticalSpace,
                ],
              ),

              /// Product List
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: products.length,
                itemExtent: 150.h,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Padding(
                    padding: REdgeInsets.only(bottom: 15),
                    child: OrderHorizontalCard(
                      product: product,
                    ),
                  );
                },
              ),
              // SizedBox(
              //   height: 450.h,
              //   width: double.infinity,
              //   child: ListView.builder(
              //     itemCount: products.length,
              //     itemExtent: 150.h,
              //     itemBuilder: (context, index) {
              //       final product = products[index];
              //       return Padding(
              //         padding: REdgeInsets.only(bottom: 15),
              //         child: OrderHorizontalCard(
              //           product: product,
              //         ),
              //       );
              //     },
              //   ),
              // ),

              /// Order information
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  34.verticalSpace,
                  Text(
                    'Order information',
                    style: AppTextStyles.black14Bold,
                  ),
                  34.verticalSpace,
                  Row(
                    children: [
                      Text(
                        'Shipping Address:',
                        style: AppTextStyles.grey14,
                      ),
                      15.horizontalSpace,
                      Text(
                        'Toktogul 45, Bishkek, Kyrgyzstan',
                        style: AppTextStyles.black14Bold,
                      ),
                    ],
                  ),
                  34.verticalSpace,
                  Row(
                    children: [
                      Text(
                        'Payment method:',
                        style: AppTextStyles.grey14,
                      ),
                      21.horizontalSpace,
                      Row(
                        children: [
                          AppAssets.mastercard(height: 20, width: 20),
                          15.horizontalSpace,
                          Text(
                            '**** **** **** 3947',
                            style: AppTextStyles.black14Bold,
                          ),
                        ],
                      ),
                    ],
                  ),
                  34.verticalSpace,
                  Row(
                    children: [
                      Text(
                        'Delivery method:',
                        style: AppTextStyles.grey14,
                      ),
                      27.horizontalSpace,
                      Text(
                        'FedEx, 3 days, 15\$',
                        style: AppTextStyles.black14Bold,
                      ),
                    ],
                  ),
                  34.verticalSpace,
                  Row(
                    children: [
                      Text(
                        'Discount:',
                        style: AppTextStyles.grey14,
                      ),
                      70.horizontalSpace,
                      Text(
                        '10%, Personal promo code',
                        style: AppTextStyles.black14Bold,
                      ),
                    ],
                  ),
                  34.verticalSpace,
                  Row(
                    children: [
                      Text(
                        'Total Amount:',
                        style: AppTextStyles.grey14,
                      ),
                      42.horizontalSpace,
                      Text(
                        '133\$',
                        style: AppTextStyles.black14Bold,
                      ),
                    ],
                  ),
                  50.verticalSpace,

                  /// buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomElevatedButton(
                        sizedBoxHeight: 36.h,
                        sizedBoxWidth: 170.w,
                        borderRadius: 30,
                        bgColor: Colors.white,
                        isBorderSide: true,
                        text: Text(
                          'Reorder',
                          style: AppTextStyles.black14,
                        ),
                        onPressed: () {},
                      ),
                      CustomElevatedButton(
                        sizedBoxHeight: 36.h,
                        sizedBoxWidth: 160.w,
                        borderRadius: 30,
                        text: Text(
                          'Leave feedback',
                          style: AppTextStyles.white14,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
