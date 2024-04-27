import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobileOrderDetailsView extends StatelessWidget {
  const MobileOrderDetailsView({
    required this.order,
    super.key,
  });

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
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
                        'Order №${order.orderNumber}',
                        style: AppTextStyles.black16Bold,
                      ),
                      Text(
                        '${order.createdDate}',
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
                            '${order.trackingNumber}',
                            style: AppTextStyles.black14,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '${order.status}',
                            style: AppTextStyles.green14,
                          ),
                        ],
                      ),
                    ],
                  ),
                  16.verticalSpace,
                  Text(
                    '${order.items!.length} items',
                    style: AppTextStyles.black14,
                  ),
                  18.verticalSpace,
                ],
              ),

              /// Product List
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: order.items!.length,
                itemExtent: 150.h,
                itemBuilder: (context, index) {
                  final product = order.items![index];
                  return Padding(
                    padding: REdgeInsets.only(bottom: 15),
                    child: OrderDetailCard(
                      product: product,
                    ),
                  );
                },
              ),

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
                        '${order.shippingAddress}',
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
                            '${order.paymentMethod}',
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
                        '${order.deliveryMethod}',
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
                        '${order.discount}',
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
                        '${order.totalAmount}\$',
                        style: AppTextStyles.black14Bold,
                      ),
                    ],
                  ),
                  50.verticalSpace,

                  /// buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        sizedBoxHeight: 36.h,
                        sizedBoxWidth: 170.w,
                        isOutlinedButton: true,
                        onPressed: () {},
                        text: 'Reorder',
                      ),
                      CustomButton(
                        sizedBoxHeight: 36.h,
                        sizedBoxWidth: 160.w,
                        onPressed: () {},
                        text: 'Leave feedback',
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
