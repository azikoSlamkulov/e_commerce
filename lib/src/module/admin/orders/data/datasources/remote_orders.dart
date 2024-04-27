// import '../../domain/entities/order_info_entity.dart';
// import '../models/order_model.dart';

// abstract class RemoteOrders {
//   Future<OrderModel> getOrder({required String id});
//   Future<List<OrderModel>> getAllOrders();
//   Future<List<OrderInfoEntity>> getOrderInfo();
// }

// class RemoteOrdersImpl implements RemoteOrders {
//   final FirestoreCore firestore;

//   RemoteOrdersImpl({
//     required this.firestore,
//     //required this.serverImitation,
//   });

//   @override
//   Future<OrderModel> getOrder({required String id}) async {
//     return await firestore.get(
//       id: id,
//       collectionName: 'orders',
//       fromJson: ordersFromJson,
//     );
//   }

//   @override
//   Future<List<OrderModel>> getAllOrders() async {
//     return await firestore.getList(
//       collectionName: 'orders',
//       fromJson: ordersFromJson,
//     );
//   }

//   @override
//   Future<List<OrderInfoEntity>> getOrderInfo() async {
//     final allOrders = await firestore.getList(
//       collectionName: 'orders',
//       fromJson: ordersFromJson,
//     );
//     return ServerImitation().getOrdersStatus(allOrders);
//   }
// }
