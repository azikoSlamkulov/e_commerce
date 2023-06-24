import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';

class GetProductQuantity
    extends UseCase<ProductSizeEntity, GetProductQuantityParams> {
  final ProductRepo productRepo;
  GetProductQuantity(this.productRepo);

  @override
  Future<Either<Failure, ProductSizeEntity>> call(
      GetProductQuantityParams params) async {
    return await productRepo.getProductQuantity(
      productID: params.productID,
      productSize: params.productSize,
    );
  }
}

class GetProductQuantityParams extends Equatable {
  final String productID;
  final String productSize;
  const GetProductQuantityParams({
    required this.productID,
    required this.productSize,
  });

  @override
  List<Object?> get props => [
        productID,
        productSize,
      ];
}
