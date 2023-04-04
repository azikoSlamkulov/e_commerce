part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductLoadingState extends ProductState {}

class LoadedState extends ProductState {
  final ProductEntity product;
  const LoadedState(this.product);
  @override
  List<Object> get props => [product];
}

class LoadedAllProductsState extends ProductState {
  final List<ProductEntity> allProducts;
  const LoadedAllProductsState(this.allProducts);
  @override
  List<Object> get props => [allProducts];
}

// class LoadedAllSortedProductsByQueryState extends ProductState {
//   final List<ProductEntity> allSortedProducts;

//   const LoadedAllSortedProductsByQueryState(
//     this.allSortedProducts,
//   );
//   @override
//   List<Object> get props => [
//         allSortedProducts,
//       ];
// }

// class LoadedSortedProductsState extends ProductState {
//   final List<ProductEntity> allSortedProducts;
//   final List<bool>? isSelected;
//   final String? selectedText;
//   const LoadedSortedProductsState(
//     this.allSortedProducts,
//     this.isSelected,
//     this.selectedText,
//   );
//   @override
//   List<Object> get props => [
//         allSortedProducts,
//         isSelected!,
//         isSelected!,
//       ];
// }

class LoadedAllSortedListByQueryWithThreeValuesState extends ProductState {
  final List<ProductEntity> allSortedProducts;
  const LoadedAllSortedListByQueryWithThreeValuesState(this.allSortedProducts);
  @override
  List<Object> get props => [allSortedProducts];
}

// class AddedProductToCartState extends ProductState {
//   final BagEntity product;
//   const AddedProductToCartState(this.product);
//   @override
//   List<Object> get props => [product];
// }

class ProductFailureState extends ProductState {
  final String message;
  const ProductFailureState(this.message);
  @override
  List<Object> get props => [message];
}
