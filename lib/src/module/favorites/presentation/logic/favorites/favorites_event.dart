part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

class AddProductToFavoritesEvent extends FavoritesEvent {
  //final String userID;
  final FavoriteEntity product;

  const AddProductToFavoritesEvent({
    //this.userID,
    required this.product,
  });
}

class GetAllFavoritesProductEvent extends FavoritesEvent {
  final String userID;

  const GetAllFavoritesProductEvent(this.userID);
}

class DeleteProductFromFavoritesEvent extends FavoritesEvent {
  final String userID;
  final String productID;

  const DeleteProductFromFavoritesEvent(
      {required this.userID, required this.productID});
}
