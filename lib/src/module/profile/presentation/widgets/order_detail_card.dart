import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetailCard extends StatelessWidget {
  const OrderDetailCard({
    super.key,
    required this.product,
  });

  final BagEntity product;

  @override
  Widget build(BuildContext context) {
    return Card(
      //color: Colors.blue,
      clipBehavior: Clip.hardEdge,
      //elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      //margin: REdgeInsets.only(top: 16, left: 16, right: 16, bottom: 20),
      //color: Colors.redAccent.shade100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /// Image
          Container(
            height: 155.h,
            width: 104.h,
            decoration: BoxDecoration(
              //color: Colors.greenAccent,
              image: DecorationImage(
                image: NetworkImage(product.productImgUrl!),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                bottomLeft: Radius.circular(10.r),
              ),
            ),
          ),
          // Image.network(
          //   product.photoURL!,
          //   fit: BoxFit.fill,
          //   width: 140.h,
          //   height: 155.h,
          // ),
          Expanded(
            child: Padding(
              padding: REdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //11.verticalSpace,

                          ///Category
                          Text(
                            product.name!,
                            style: AppTextStyles.black16Bold,
                          ),
                          5.verticalSpace,

                          ///Brand
                          Text(
                            product.name!,
                            style: AppTextStyles.grey11,
                          ),
                          7.verticalSpace,

                          /// Color and size
                          Row(
                            children: [
                              Text(
                                'Color: ',
                                style: AppTextStyles.grey11,
                              ),
                              Text(
                                product.color!,
                                style: AppTextStyles.black11,
                              ),
                              12.horizontalSpace,
                              Text(
                                'Size: ',
                                style: AppTextStyles.grey11,
                              ),
                              Text(
                                product.size!,
                                style: AppTextStyles.black11,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                  /// Quantity and prise
                  10.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('Quantity: ', style: AppTextStyles.grey11),
                          Text('${product.quantity}',
                              style: AppTextStyles.black11),
                        ],
                      ),
                      Text(
                        '${product.pricePerUnit}\$',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  //11.verticalSpace,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
