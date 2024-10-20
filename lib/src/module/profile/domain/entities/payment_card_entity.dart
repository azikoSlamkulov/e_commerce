import 'package:equatable/equatable.dart';

class PaymentCardEntity extends Equatable {
  final String? id;
  final String? userId;
  final String? name;
  final String? cardNumber;
  final String? expireDate;
  final int? cvv;
  bool? isCheked;
  final String? createdDate;

  PaymentCardEntity({
    this.id,
    this.userId,
    this.name,
    this.cardNumber,
    this.expireDate,
    this.cvv,
    this.isCheked,
    this.createdDate,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        cardNumber,
        expireDate,
        cvv,
        isCheked,
        createdDate,
      ];
}
