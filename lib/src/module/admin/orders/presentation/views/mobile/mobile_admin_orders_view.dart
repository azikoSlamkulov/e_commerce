import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/entities/order_entity.dart';
import '../../cubit/orders_cubit.dart';
//allow read, write: if request.auth != null;

class MobileAdminOrdersView extends StatelessWidget {
  const MobileAdminOrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Orders'),
      ),
    );
  }
}

// class MobileOrdersView extends StatelessWidget {
//   const MobileOrdersView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<OrdersCubit>(
//       create: (context) => sl<OrdersCubit>()..getOrders(),
//       child: BlocBuilder<OrdersCubit, OrdersState>(
//         builder: (context, state) {
//           if (state is LoadingOrdersState) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is LoadedAllOrdersState) {
//             //getOrdersStatus(state);
//             return NestedOrdersView(
//               //allOrders: state.allOrders,
//               delivered: state.delivered,
//               processing: state.processing,
//               cancelled: state.cancelled,
//             );
//           } else if (state is FailureOrderState) {
//             //return MyErrorWidget('${state.exception}');
//             return Text('');
//           } else {
//             //return const SomeError();,
//             return Text('');
//           }
//         },
//       ),
//     );
//   }
// }

// class NestedOrdersView extends StatelessWidget {
//   const NestedOrdersView({
//     super.key,
//     //required this.allOrders,
//     required this.delivered,
//     required this.processing,
//     required this.cancelled,
//   });

//   //final List<OrderEntity> allOrders;
//   final List<OrderEntity> delivered;
//   final List<OrderEntity> processing;
//   final List<OrderEntity> cancelled;

//   @override
//   Widget build(BuildContext context) {
//     const items = ['Delivered', 'Processing', 'Cancelled'];
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         backgroundColor: AppColors.bgColorMain,
//         appBar: AppBar(
//           elevation: 0,
//           backgroundColor: AppColors.bgColorMain,
//           bottom: TabBar(
//             padding: REdgeInsets.symmetric(horizontal: 16),
//             indicator: BoxDecoration(
//                 borderRadius: BorderRadius.circular(50), // Creates border
//                 color: Colors.black),
//             unselectedLabelStyle: TextStyle(fontSize: 16.sp),
//             unselectedLabelColor: Colors.black,
//             tabs: items
//                 .map((e) => Tab(
//                       text: e,
//                       height: 35,
//                     ))
//                 .toList(),
//           ),
//           title: const Text(
//             'Orders',
//             style: TextStyle(color: Colors.black),
//           ),
//           centerTitle: true,
//         ),
//         body: Padding(
//           padding: REdgeInsets.all(16.0),
//           child: TabBarView(
//             children: [
//               buildListView(delivered),
//               buildListView(processing),
//               buildListView(cancelled),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   ordersToggleBtn({
//     required String text,
//     required bool isActivity,
//   }) {
//     return TextButton(
//       style: TextButton.styleFrom(
//         padding: REdgeInsets.symmetric(horizontal: 20),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(30),
//           side: BorderSide.none,
//         ),
//         backgroundColor: isActivity ? Colors.black : null,
//       ),
//       onPressed: () {},
//       child: Text(
//         text,
//         style: TextStyle(
//           color: isActivity ? Colors.white : Colors.black,
//         ),
//       ),
//     );
//   }

//   ordersBtn({
//     required BuildContext context,
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
//         // context.goNamed(
//         //   AppPage.orderDetails.toName,
//         // );
//       },
//       child: Text(
//         text,
//         style: AppTextStyles.black14,
//       ),
//     );
//   }
// }

// buildListView(List<OrderEntity> orders) {
//   return orders.isNotEmpty
//       ? Expanded(
//           child: ListView.builder(
//             //padding: REdgeInsets.symmetric(vertical: 37),
//             itemCount: orders.length,
//             itemExtent: 100.h,
//             itemBuilder: (context, index) {
//               final order = orders[index];
//               return Card(
//                 //margin: REdgeInsets.only(bottom: 20),
//                 color: Colors.white,
//                 child: Padding(
//                   padding: REdgeInsets.all(19.0),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'Order №${order.orderNumber}',
//                             style: AppTextStyles.black16,
//                           ),
//                           Text(
//                             '05-12-2019',
//                             style: AppTextStyles.grey14,
//                           ),
//                         ],
//                       ),
//                       15.verticalSpace,
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             '${order.status}',
//                             style: AppTextStyles.green14,
//                           ),
//                           // Text(
//                           //   'Total Amount:  ',
//                           //   style: AppTextStyles.grey14,
//                           // ),
//                           Text(
//                             '${order.totalAmount}\$',
//                             style: AppTextStyles.black14Bold,
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         )
//       : Align(
//           alignment: Alignment.center,
//           child: Text(
//             'Список пуст!',
//             style: AppTextStyles.grey16,
//           ),
//         );
// }
