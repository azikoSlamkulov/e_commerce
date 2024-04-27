import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';
import 'package:equatable/equatable.dart';

class AddProductToFavorites extends UseCase<bool, AddProductToFavoritesParams> {
  final FavoritesRepo favoritesRepo;
  AddProductToFavorites(this.favoritesRepo);

  @override
  Future<Either<Failure, bool>> call(AddProductToFavoritesParams params) async {
    return await favoritesRepo.addProductToFavorites(
      //userID: params.userID,
      product: params.product,
    );
  }
}

class AddProductToFavoritesParams extends Equatable {
  //final String userID;
  final FavoriteEntity product;

  const AddProductToFavoritesParams({
    //required this.userID,
    required this.product,
  });

  @override
  List<Object?> get props => [
        //userID,
        product,
      ];
}
