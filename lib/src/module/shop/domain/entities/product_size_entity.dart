import 'package:e_commerce/lib.dart';

class ProductSizeEntity extends Equatable {
  final String? productID;
  final String? sizeID;
  final int? quantity;
  final String? size;

  const ProductSizeEntity({
    this.productID,
    this.sizeID,
    this.quantity,
    this.size,
  });

  @override
  List<Object?> get props => [
        productID,
        sizeID,
        quantity,
        size,
      ];
}
