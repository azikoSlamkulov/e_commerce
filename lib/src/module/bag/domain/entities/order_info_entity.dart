import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class OrderInfoEntity extends Equatable {
  final String? id, status, trackingNumber, createdDate;
  final int? quantity, totalAmount;
  final Color? color;
  //final int? percentage;

  const OrderInfoEntity({
    this.id,
    this.status,
    this.quantity,
    this.trackingNumber,
    this.totalAmount,
    this.createdDate,
    //this.percentage,
    this.color,
  });

  @override
  List<Object?> get props => [
        id,
        status,
        quantity,
        trackingNumber,
        totalAmount,
        quantity,
        createdDate,
        //percentage,
        color,
      ];
}
