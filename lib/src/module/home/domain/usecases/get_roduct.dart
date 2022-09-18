import 'package:dartz/dartz.dart';
import 'package:e_commerce/src/module/home/domain/repositories/product_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/product_entity.dart';

class GetProduct extends UseCase<ProductEntity, GetProductParams> {
  final ProductRepo productRepo;
  GetProduct(this.productRepo);

  @override
  Future<Either<Failure, ProductEntity>> call(GetProductParams params) async {
    return await productRepo.getProduct(productID: params.productID);
  }
}

class GetProductParams extends Equatable {
  final String productID;
  const GetProductParams({required this.productID});

  @override
  List<Object?> get props => [
        productID,
      ];
}
