import 'package:equatable/equatable.dart';

class ProductSizeEntity extends Equatable {
  final int? quantity;
  final String? size;

  const ProductSizeEntity({
    this.quantity,
    this.size,
  });

  @override
  List<Object?> get props => [
        quantity,
        size,
      ];
}
