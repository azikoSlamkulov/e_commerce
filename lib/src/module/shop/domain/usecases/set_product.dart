import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';

import 'package:equatable/equatable.dart';

class SetProduct extends UseCase<bool, SetProductParams> {
  final ProductRepo productRepo;
  SetProduct(this.productRepo);

  @override
  Future<Either<Failure, bool>> call(SetProductParams params) async {
    return await productRepo.setProduct(
      product: params.product,
    );
  }
}

class SetProductParams extends Equatable {
  final ProductEntity product;

  const SetProductParams({
    required this.product,
  });

  @override
  List<Object?> get props => [product];
}
