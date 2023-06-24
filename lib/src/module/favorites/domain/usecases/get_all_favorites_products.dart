import 'package:dartz/dartz.dart';

import '../../../../../lib.dart';

class GetAllFavoritesProducts
    extends UseCase<List<ProductEntity>, GetAllFavoritesProductsParams> {
  final FavoritesRepo favoritesRepo;
  GetAllFavoritesProducts(this.favoritesRepo);

  @override
  Future<Either<Failure, List<ProductEntity>>> call(
      GetAllFavoritesProductsParams params) async {
    return await favoritesRepo.getAllFavoritesProducts(
      userID: params.userID,
    );
  }
}

class GetAllFavoritesProductsParams extends Equatable {
  final String userID;

  const GetAllFavoritesProductsParams({
    required this.userID,
  });

  @override
  List<Object?> get props => [
        userID,
      ];
}
