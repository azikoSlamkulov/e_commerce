import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';

abstract class FavoritesRepo {
  Future<Either<Failure, List<ProductEntity>>> getAllFavoritesProducts({
    required String userID,
  });

  Future<Either<Failure, bool>> addProductToFavorites({
    //required String userID,
    required FavoriteEntity product,
  });

  Future<Either<Failure, bool>> deleteProductFromFavorites({
    required String userID,
    required String productID,
  });
}
