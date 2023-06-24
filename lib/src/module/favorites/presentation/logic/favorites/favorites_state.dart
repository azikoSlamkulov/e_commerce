part of 'favorites_bloc.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

class LoadingFavoritesState extends FavoritesState {}

class LoadedAllFavoritesProductsState extends FavoritesState {
  final List<ProductEntity> allProducts;

  const LoadedAllFavoritesProductsState(this.allProducts);
  @override
  List<Object> get props => [allProducts];
}

class AddedProductToFavoritesState extends FavoritesState {
  final bool isCreated;
  const AddedProductToFavoritesState(this.isCreated);
  @override
  List<Object> get props => [isCreated];
}

class DeletedProductFromFavoritesState extends FavoritesState {
  final bool isDeleted;
  const DeletedProductFromFavoritesState(this.isDeleted);
  @override
  List<Object> get props => [isDeleted];
}

class FailureFavoritesState extends FavoritesState {
  final String message;
  const FailureFavoritesState(this.message);
  @override
  List<Object> get props => [message];
}
