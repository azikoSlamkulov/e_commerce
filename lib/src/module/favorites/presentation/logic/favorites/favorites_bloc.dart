import 'package:e_commerce/lib.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final AddProductToFavorites addProductToFavorites;
  final GetAllFavoritesProducts getAllFavoritesProducts;
  final DeleteProductFromFavorites deleteProductFromFavorites;
  FavoritesBloc({
    required this.addProductToFavorites,
    required this.getAllFavoritesProducts,
    required this.deleteProductFromFavorites,
  }) : super(LoadingFavoritesState()) {
    on<AddProductToFavoritesEvent>(_addProductToFavorites);
    on<GetAllFavoritesProductEvent>(_getAllFavoritesProduct);
    on<DeleteProductFromFavoritesEvent>(_deleteProductFromFavorites);
  }

  void _addProductToFavorites(
      AddProductToFavoritesEvent event, Emitter<FavoritesState> emit) async {
    emit(LoadingFavoritesState());
    final isCreated = await addProductToFavorites(AddProductToFavoritesParams(
      //userID: event.userID,
      product: event.product,
    ));
    isCreated.fold((error) => emit(const FailureFavoritesState('')),
        (isCreated) => emit(AddedProductToFavoritesState(isCreated)));
  }

  void _getAllFavoritesProduct(
      GetAllFavoritesProductEvent event, Emitter<FavoritesState> emit) async {
    emit(LoadingFavoritesState());
    final allProducts = await getAllFavoritesProducts
        .call(GetAllFavoritesProductsParams(userID: event.userID));
    allProducts.fold(
      (error) => emit(const FailureFavoritesState('')),
      (allProducts) {
        emit(LoadedAllFavoritesProductsState(allProducts));
      },
    );
  }

  void _deleteProductFromFavorites(DeleteProductFromFavoritesEvent event,
      Emitter<FavoritesState> emit) async {
    emit(LoadingFavoritesState());
    final isDeleted = await deleteProductFromFavorites(
        DeleteProductFromFavoritesParams(
            userID: event.userID, productID: event.productID));
    isDeleted.fold((error) => emit(const FailureFavoritesState('')),
        (isDeleted) => emit(DeletedProductFromFavoritesState(isDeleted)));
  }
}
