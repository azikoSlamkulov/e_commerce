import 'dart:convert';
import 'package:e_commerce/lib.dart';

PaymentCardModel cardFromJson(Map docMap) =>
    PaymentCardModel.fromJson(docMap as Map<String, dynamic>);

String cardToJson(PaymentCardModel data) => json.encode(data.toJson());

PaymentCardModel paymentCardToModel(String id, PaymentCardEntity entity) =>
    PaymentCardModel(
      id: id,
      userId: entity.userId,
      name: entity.name,
      cardNumber: entity.cardNumber,
      expireDate: entity.expireDate,
      cvv: entity.cvv,
      isCheked: entity.isCheked,
      createdDate: entity.createdDate,
    );

class PaymentCardModel extends PaymentCardEntity {
  PaymentCardModel({
    id,
    userId,
    name,
    cardNumber,
    expireDate,
    cvv,
    isCheked,
    createdDate,
  }) : super(
          id: id,
          userId: userId,
          name: name,
          cardNumber: cardNumber,
          expireDate: expireDate,
          cvv: cvv,
          isCheked: isCheked,
          createdDate: createdDate,
        );

  factory PaymentCardModel.fromJson(Map<String, dynamic> json) =>
      PaymentCardModel(
        id: json['id'] as String,
        userId: json['userId'] as String,
        name: json['name'] as String,
        cardNumber: json['cardNumber'] as String,
        expireDate: json['expireDate'] as String,
        cvv: json['cvv'] as int,
        isCheked: json['isCheked'] as bool,
        createdDate: json['createdDate'] as String,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? '',
        "userId": userId ?? '',
        "name": name ?? '',
        "cardNumber": cardNumber ?? '',
        "expireDate": expireDate ?? '',
        "cvv": cvv ?? 0,
        "isCheked": isCheked ?? false,
        "createdDate": createdDate ?? DateTime.now().toString(),
      };
}
