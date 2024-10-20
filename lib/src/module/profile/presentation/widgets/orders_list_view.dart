import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OrdersListView extends StatelessWidget {
  const OrdersListView({super.key, required this.allOrders});

  final List<OrderEntity> allOrders;

  String capitalize(String text) =>
      '${text[0].toUpperCase()}${text.substring(1)}';

  @override
  Widget build(BuildContext context) {
    return allOrders.isNotEmpty
        ? ListView.builder(
            //padding: REdgeInsets.symmetric(vertical: 37),
            itemCount: allOrders.length,
            //itemExtent: 206.h,
            itemBuilder: (context, index) {
              final order = allOrders[index];
              return Card(
                //margin: REdgeInsets.only(bottom: 20),
                color: Colors.white,
                child: Padding(
                  padding: REdgeInsets.all(19.0),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Order №${order.orderNumber}',
                          style: AppTextStyles.black16,
                        ),
                        Text(
                          DateTimeFormatter.dateTimeFormater(
                              order.createdDate!),
                          //'${order.createdDate}',
                          style: AppTextStyles.grey14,
                        ),
                      ],
                    ),
                    15.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                    15.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Quantity:  ',
                              style: AppTextStyles.grey14,
                            ),
                            Text(
                              '${order.items!.length}',
                              style: AppTextStyles.black14,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Total Amount: ',
                              style: AppTextStyles.grey14,
                            ),
                            Text(
                              '${order.totalAmount}\$',
                              style: AppTextStyles.black14Bold,
                            ),
                          ],
                        ),
                      ],
                    ),
                    15.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //ordersBtn(context: context, text: 'Details'),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            padding: REdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            side: const BorderSide(color: Colors.black),
                            backgroundColor: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MobileOrderDetailsView(
                                  order: order,
                                ),
                              ),
                            );
                            // context.goNamed(
                            //   AppPage.orderDetails.toName,
                            //   extra: order,
                            // );
                          },
                          child: Text(
                            'Details',
                            style: AppTextStyles.black14,
                          ),
                        ),
                        Text(
                          capitalize(order.status!),
                          //'${order.status}',
                          style: AppTextStyles.green14,
                        ),
                      ],
                    ),
                  ]),
                ),
              );
            },
          )
        : Align(
            alignment: Alignment.center,
            child: Text(
              'Список пуст!',
              style: AppTextStyles.grey16,
            ),
          );
  }
}

// ordersBtn({
//     //required BuildContext context,
//     required String text,
//   }) {
//     return OutlinedButton(
//       style: OutlinedButton.styleFrom(
//         padding: REdgeInsets.symmetric(
//           horizontal: 20,
//         ),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(30.r),
//         ),
//         side: const BorderSide(color: Colors.black),
//         backgroundColor: Colors.white,
//       ),
//       onPressed: () {
//         context.goNamed(
//           AppPage.orderDetails.toName,
//         );
//       },
//       child: Text(
//         text,
//         style: AppTextStyles.black14,
//       ),
//     );
//   }
