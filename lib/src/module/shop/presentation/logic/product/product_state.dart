part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class LoadingProductstState extends ProductState {}

class LoadedProductDatailsState extends ProductState {
  final ProductDatailEntity productDatails;
  const LoadedProductDatailsState(this.productDatails);
  @override
  List<Object> get props => [productDatails];
}

class LoadedProductsState extends ProductState {
  final List<ProductEntity> allProducts;
  const LoadedProductsState(this.allProducts);
  @override
  List<Object> get props => [allProducts];
}

class LoadedAllProductState extends ProductState {
  final List<ProductEntity> allProducts;
  const LoadedAllProductState(this.allProducts);
  @override
  List<Object> get props => [allProducts];
}

class CreatedProductState extends ProductState {
  final bool isCreated;
  const CreatedProductState(this.isCreated);
  @override
  List<Object> get props => [isCreated];
}

class ProductFailureState extends ProductState {
  final Failure message;
  const ProductFailureState(this.message);
  @override
  List<Object> get props => [message];
}
