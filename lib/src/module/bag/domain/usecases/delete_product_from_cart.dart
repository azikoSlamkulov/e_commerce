import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';

class DeleteProductFromCart extends UseCase<bool, DeleteProductFromCartParams> {
  final BagRepo bagRepo;
  DeleteProductFromCart(this.bagRepo);

  @override
  Future<Either<Failure, bool>> call(DeleteProductFromCartParams params) async {
    return await bagRepo.deleteProductFromCart(
      userID: params.userID,
      productID: params.productID,
    );
  }
}

class DeleteProductFromCartParams extends Equatable {
  final String userID;
  final String productID;

  const DeleteProductFromCartParams({
    required this.userID,
    required this.productID,
  });

  @override
  List<Object?> get props => [userID, productID];
}
