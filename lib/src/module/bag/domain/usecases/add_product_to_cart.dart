import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';

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
