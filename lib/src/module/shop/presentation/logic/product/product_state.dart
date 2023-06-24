part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class LoadingProductstState extends ProductState {}

class LoadedProductDatailsState extends ProductState {
  final ProductEntity product;
  const LoadedProductDatailsState(this.product);
  @override
  List<Object> get props => [product];
}

class LoadedProductsState extends ProductState {
  final List<ProductEntity> allProducts;
  const LoadedProductsState(this.allProducts);
  @override
  List<Object> get props => [allProducts];
}

class ProductFailureState extends ProductState {
  final String message;
  const ProductFailureState(this.message);
  @override
  List<Object> get props => [message];
}
