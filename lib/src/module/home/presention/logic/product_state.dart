import 'package:equatable/equatable.dart';

import '../../domain/entities/product_entity.dart';

class ProductState extends Equatable {
  const ProductState();
  @override
  List<Object> get props => [];
}

class LoadingState extends ProductState {}

class LoadedState extends ProductState {
  final ProductEntity product;
  const LoadedState(this.product);
  @override
  List<Object> get props => [product];
}

class LoadedAllState extends ProductState {
  final List<ProductEntity> allProducts;
  const LoadedAllState(this.allProducts);
  @override
  List<Object> get props => [allProducts];
}

class LoadedAllSortedProductsByQueryState extends ProductState {
  final List<ProductEntity> allSortedProducts;
  const LoadedAllSortedProductsByQueryState(this.allSortedProducts);
  @override
  List<Object> get props => [allSortedProducts];
}

class ProductFailureState extends ProductState {
  final String message;
  const ProductFailureState(this.message);
  @override
  List<Object> get props => [message];
}
