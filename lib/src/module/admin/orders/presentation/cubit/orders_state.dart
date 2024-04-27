// part of 'orders_cubit.dart';

// abstract class OrdersState extends Equatable {
//   const OrdersState();

//   @override
//   List<Object> get props => [];
// }

// class LoadingOrdersState extends OrdersState {}

// class LoadedAllOrdersState extends OrdersState {
//   //final List<OrderEntity> allOrders;
//   final List<OrderEntity> delivered;
//   final List<OrderEntity> processing;
//   final List<OrderEntity> cancelled;

//   const LoadedAllOrdersState({
//     //required this.allOrders,
//     required this.delivered,
//     required this.processing,
//     required this.cancelled,
//   });
//   @override
//   List<Object> get props => [
//         //allOrders,
//         delivered,
//         processing,
//         cancelled,
//       ];
// }

// class LoadedOrderInfoState extends OrdersState {
//   final List<OrderInfoEntity> orderInfo;

//   const LoadedOrderInfoState({
//     required this.orderInfo,
//   });
//   @override
//   List<Object> get props => [
//         orderInfo,
//       ];
// }

// class FailureOrderState extends OrdersState {
//   final String message;
//   const FailureOrderState(this.message);
//   @override
//   List<Object> get props => [message];
// }
