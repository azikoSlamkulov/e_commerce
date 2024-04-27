import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CardEntity extends Equatable {
  final String? id;
  final String? name;
  final String? cardNumber;
  final String? expireDate;
  final String? cvv;
  final Image? cardImage;
  final bool? isCheked;

  CardEntity({
    this.id,
    this.name,
    this.cardNumber,
    this.expireDate,
    this.cvv,
    this.cardImage,
    this.isCheked,
  });

  @override
  List<Object?> get props => [
        id,
        cardNumber,
        expireDate,
        cvv,
        cardImage,
        isCheked,
      ];
}
