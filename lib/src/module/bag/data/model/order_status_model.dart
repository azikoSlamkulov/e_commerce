import 'dart:convert';

import '../../domain/entities/order_status_entity.dart';

OrderStatusModel ordersStatusFromJson(Map docMap) =>
    OrderStatusModel.fromJson(docMap as Map<String, dynamic>);

String orderstStatusToJson(OrderStatusModel data) => json.encode(data.toJson());

class OrderStatusModel extends OrderStatusEntity {
  const OrderStatusModel({
    delivered,
    processing,
    cancelled,
  }) : super(
          delivered: delivered,
          processing: processing,
          cancelled: cancelled,
        );

  factory OrderStatusModel.fromJson(Map<String, dynamic> json) =>
      OrderStatusModel(
        delivered: json['delivered'] as bool,
        processing: json['processing'] as bool,
        cancelled: json['cancelled'] as bool,
      );

  Map<String, dynamic> toJson() => {
        "delivered": delivered ?? false,
        "processing": processing ?? true,
        "cancelled": cancelled ?? false,
      };
}
