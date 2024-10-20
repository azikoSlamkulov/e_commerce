import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class DelveryEntity extends Equatable {
  final int? id;
  final String? name;
  final int? days;
  final int? price;
  final Image? image;

  const DelveryEntity({
    this.id,
    this.name,
    this.days,
    this.price,
    this.image,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        days,
        price,
        image,
      ];
}
