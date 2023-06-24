import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';

class DeleteProductFromFavorites
    extends UseCase<bool, DeleteProductFromFavoritesParams> {
  final FavoritesRepo favoritesRepo;
  DeleteProductFromFavorites(this.favoritesRepo);

  @override
  Future<Either<Failure, bool>> call(
      DeleteProductFromFavoritesParams params) async {
    return await favoritesRepo.deleteProductFromFavorites(
      userID: params.userID,
      productID: params.productID,
    );
  }
}

class DeleteProductFromFavoritesParams extends Equatable {
  final String userID;
  final String productID;

  const DeleteProductFromFavoritesParams({
    required this.userID,
    required this.productID,
  });

  @override
  List<Object?> get props => [userID, productID];
}
