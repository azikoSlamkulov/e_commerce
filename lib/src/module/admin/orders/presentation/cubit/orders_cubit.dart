// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import '../../domain/entities/order_entity.dart';
// import '../../domain/entities/order_info_entity.dart';
// import '../../domain/usecases/get_all_orders.dart';
// import '../../domain/usecases/get_order_info.dart';

// part 'orders_state.dart';

// class OrdersCubit extends Cubit<OrdersState> {
//   GetAllOrders getAllOrders;
//   GetOrderInfo getOrderInfo;
//   OrdersCubit({
//     required this.getAllOrders,
//     required this.getOrderInfo,
//   }) : super(LoadingOrdersState());

//   List<OrderEntity> delivered = [];
//   List<OrderEntity> processing = [];
//   List<OrderEntity> cancelled = [];

//   void getOrdersStatus(List<OrderEntity> allOrders) {
//     delivered = allOrders.where((i) => i.status == 'delivered').toList();
//     processing = allOrders.where((i) => i.status == 'processing').toList();
//     cancelled = allOrders.where((i) => i.status == 'cancelled').toList();
//   }

//   void getOrders() async {
//     //emit(LoadingOrdersState());
//     final allOrders = await getAllOrders.getAllOrders();
//     allOrders.fold(
//       (error) => emit(const FailureOrderState('')),
//       (allOrders) {
//         getOrdersStatus(allOrders);
//         emit(LoadedAllOrdersState(
//           delivered: delivered,
//           processing: processing,
//           cancelled: cancelled,
//         ));
//       },
//     );
//   }

//   void getOrdersInfo() async {
//     //emit(LoadingOrdersState());
//     final orderInfo = await getOrderInfo.getOrderInfo();
//     orderInfo.fold(
//       (error) => emit(const FailureOrderState('')),
//       (orderInfo) {
//         emit(LoadedOrderInfoState(
//           orderInfo: orderInfo,
//         ));
//       },
//     );
//   }
// }
