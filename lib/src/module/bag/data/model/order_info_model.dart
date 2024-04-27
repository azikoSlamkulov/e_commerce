import 'dart:convert';

import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/order_info_entity.dart';

OrderInfoModel ordersInfoFromJson(Map docMap) =>
    OrderInfoModel.fromJson(docMap as Map<String, dynamic>);

String ordersInfoToJson(OrderInfoModel data) => json.encode(data.toJson());

class OrderInfoModel extends OrderInfoEntity {
  const OrderInfoModel({
    id,
    status,
    quantity,
    trackingNumber,
    totalAmount,
    createdDate,
    color,
    //final int? percentage;
  }) : super(
          id: id,
          status: status,
          quantity: quantity,
          trackingNumber: trackingNumber,
          totalAmount: totalAmount,
          createdDate: createdDate,
          color: color,
          //percentage: percentage,
        );

  factory OrderInfoModel.fromJson(Map<String, dynamic> json) => OrderInfoModel(
        id: json['id'] as String,
        status: json['status'] as String,
        quantity: json['quantity'] as int,
        trackingNumber: json['trackingNumber'] as String,
        totalAmount: json['totalAmount'] as int,
        createdDate: json['createdDate'] as String,
        //percentage: json['percentage'] as int,
        color: json['color'] as Color,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? '',
        "status": status ?? 'processing',
        "quantity": quantity ?? 0,
        "trackingNumber": trackingNumber ?? '',
        "totalAmount": totalAmount ?? 0.0,
        "createdDate": createdDate ?? DateTime.now().toString(),
        //"percentage": percentage ?? 0,
        "color": color ?? Colors.green,
      };
}
