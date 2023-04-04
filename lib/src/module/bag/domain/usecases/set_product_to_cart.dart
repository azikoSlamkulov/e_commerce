import 'package:dartz/dartz.dart';
import 'package:e_commerce/src/module/bag/domain/repositories/bag_repo.dart';

import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/bag_entity.dart';

class SetProductToCart extends UseCase<bool, SetProductToCartParams> {
  final BagRepo bagRepo;
  SetProductToCart(this.bagRepo);

  @override
  Future<Either<Failure, bool>> call(SetProductToCartParams params) async {
    return await bagRepo.setProductToCart(
      product: params.product,
    );
  }
}

class SetProductToCartParams extends Equatable {
  final BagEntity product;

  const SetProductToCartParams({
    required this.product,
  });

  @override
  List<Object?> get props => [product];
}
