import 'package:equatable/equatable.dart';

class ProductColorEntity extends Equatable {
  final int? quantity;
  final String? color;

  const ProductColorEntity({
    this.quantity,
    this.color,
  });

  @override
  List<Object?> get props => [
        quantity,
        color,
      ];
}
