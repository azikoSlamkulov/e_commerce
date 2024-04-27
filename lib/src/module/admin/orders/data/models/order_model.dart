// import 'package:e_commerce_admin/src/module/orders/domain/entities/order_entity.dart';

// import 'bag_model.dart';

// OrderModel ordersFromJson(Map docMap) =>
//     OrderModel.fromJson(docMap as Map<String, dynamic>);

// //String orderstToJson(OrderModel data) => json.encode(data.toJson());

// class OrderModel extends OrderEntity {
//   const OrderModel({
//     id,
//     userID,
//     userName,
//     orderNumber,
//     trackingNumber,
//     status,
//     items,
//     shippingAddress,
//     paymentMethod,
//     deliveryMethod,
//     discount,
//     totalAmount,
//     createdDate,
//   }) : super(
//           id: id,
//           userID: userID,
//           userName: userName,
//           orderNumber: orderNumber,
//           trackingNumber: trackingNumber,
//           status: status,
//           items: items,
//           shippingAddress: shippingAddress,
//           paymentMethod: paymentMethod,
//           deliveryMethod: deliveryMethod,
//           discount: discount,
//           totalAmount: totalAmount,
//           createdDate: createdDate,
//         );

//   factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
//         id: json['id'] as String,
//         userID: json['userID'] as String,
//         userName: json['userName'] as String,
//         orderNumber: json['orderNumber'] as int,
//         trackingNumber: json['trackingNumber'] as String,
//         //orderStatus: json['delivered'] as bool,
//         status: json['status'] as String,
//         items: (json['items'] as List<dynamic>)
//             .map(
//               (e) => BagModel.fromJson(e),
//             )
//             .toList(),
//         shippingAddress: json['shippingAddress'] as String,
//         paymentMethod: json['paymentMethod'] as String,
//         deliveryMethod: json['deliveryMethod'] as String,
//         discount: json['discount'] as String,
//         totalAmount: json['totalAmount'] as int,
//         createdDate: json['createdDate'] as String,
//       );

//   // review: (json['review'] as List<dynamic>)
//   //     .map((e) => ReviewModel)
//   //     .toList(),

//   // Map<String, dynamic> toJson() => {
//   //       "id": id ?? 0,
//   //       "trackingNumber": trackingNumber ?? '',
//   //       "delivered": delivered ?? false,
//   //       "items": CategoryModel(
//   //         id: '',
//   //         typeName: category!.typeName,
//   //         collectionName: category!.collectionName,
//   //         categoryName: category!.categoryName,
//   //       ).toJson(),
//   //       "shippingAddress": shippingAddress ?? '',
//   //       "paymentMethod": paymentMethod ?? '',
//   //       "deliveryMethod": deliveryMethod ?? '',
//   //       "discount": discount ?? '',
//   //       "totalAmount": totalAmount ?? 0.0,
//   //       "createdDate": createdDate ?? DateTime.now().toString(),
//   //     };
// }
