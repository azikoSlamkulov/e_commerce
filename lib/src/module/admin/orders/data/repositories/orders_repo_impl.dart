// import 'package:dartz/dartz.dart';

// import '../../../../core/error/exception.dart';
// import '../../../../core/error/failure.dart';
// import '../../domain/entities/order_entity.dart';
// import '../../domain/entities/order_info_entity.dart';
// import '../../domain/repositories/orders_repo.dart';
// import '../datasources/remote_orders.dart';

// class OrdersRepoImpl implements OrdersRepo {
//   OrdersRepoImpl({
//     required this.remoteOrders,
//   });

//   final RemoteOrders remoteOrders;

//   @override
//   Future<Either<Failure, OrderEntity>> getOrder({required String id}) async {
//     try {
//       final order = await remoteOrders.getOrder(id: id);
//       return Right(order);
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   @override
//   Future<Either<Failure, List<OrderEntity>>> getAllOrders() async {
//     try {
//       final allOrders = await remoteOrders.getAllOrders();
//       return Right(allOrders);
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   @override
//   Future<Either<Failure, List<OrderInfoEntity>>> getOrderInfo() async {
//     try {
//       final allOrders = await remoteOrders.getOrderInfo();
//       return Right(allOrders);
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }
// }
