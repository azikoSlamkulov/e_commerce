import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';
import 'package:equatable/equatable.dart';

class GetProductDatails
    extends UseCase<ProductDatailEntity, GetProductDatailsParams> {
  final ProductRepo productRepo;
  GetProductDatails(this.productRepo);

  @override
  Future<Either<Failure, ProductDatailEntity>> call(
      GetProductDatailsParams params) async {
    return await productRepo.getProductDatails(productId: params.productId);
  }
}

class GetProductDatailsParams extends Equatable {
  final String productId;
  const GetProductDatailsParams({required this.productId});

  @override
  List<Object?> get props => [
        productId,
      ];
}
