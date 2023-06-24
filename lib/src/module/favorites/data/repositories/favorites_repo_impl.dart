import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';

class FavoritesRepoImpl implements FavoritesRepo {
  FavoritesRepoImpl({
    required this.remoteFavorites,
  });

  final RemoteFavorites remoteFavorites;

  @override
  Future<Either<Failure, List<ProductEntity>>> getAllFavoritesProducts(
      {required String userID}) async {
    try {
      final allProducts =
          await remoteFavorites.getAllFavoritesProducts(userID: userID);
      return Right(allProducts);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> addProductToFavorites({
    //required String userID,
    required FavoriteEntity product,
  }) async {
    try {
      final isCreated = await remoteFavorites.addProductToFavorites(
        //userID: userID,
        product: FavoriteModel(
          productID: product.productID,
          userID: product.userID,
          productSize: product.productSize,
          // categoryName: product.categoryName,
          // brand: product.brand,
          // color: product.color,
          // size: product.size,
          // price: product.price,
          // newPrice: product.newPrice,
          // isSale: product.isSale,
          // sale: product.sale,
          // productImgUrl: product.productImgUrl,
          // createdDate: product.createdDate,
        ),
      );
      return Right(isCreated);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteProductFromFavorites({
    required String userID,
    required String productID,
  }) async {
    try {
      final isDeleted = await remoteFavorites.deleteProductFromFavorites(
        userID: userID,
        productID: productID,
      );
      return Right(isDeleted);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
