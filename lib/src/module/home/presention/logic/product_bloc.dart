import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_all_products.dart';
import '../../domain/usecases/get_all_sorted_products_by_query.dart';
import '../../domain/usecases/get_roduct.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProduct getProduct;
  final GetAllProducts getAllProducts;
  final GetAllSortedProductsByQuery getAllSortedProducts;

  ProductBloc({
    required this.getProduct,
    required this.getAllProducts,
    required this.getAllSortedProducts,
  }) : super(LoadingState()) {
    on<GetProductEvent>(_getProduct);
    on<GetAllProductEvent>(_getAllProducts);
    on<GetAllSortedProductsByQueryEvent>(_getAllSortedProductsByQuery);
  }

  void _getProduct(GetProductEvent event, Emitter<ProductState> emit) async {
    final product =
        await getProduct(GetProductParams(productID: event.productID!));
    product.fold(
      (error) => emit(const ProductFailureState('')),
      (_product) => emit(LoadedState(_product)),
    );
  }

  void _getAllProducts(
      GetAllProductEvent event, Emitter<ProductState> emit) async {
    final allProducts = await getAllProducts.getAllProducts();
    allProducts.fold(
      (error) => emit(const ProductFailureState('')),
      (_allProducts) => emit(LoadedAllState(_allProducts)),
    );
  }

  void _getAllSortedProductsByQuery(GetAllSortedProductsByQueryEvent event,
      Emitter<ProductState> emit) async {
    final allSortedProducts = await getAllSortedProducts(
      GetAllSortedProductsByQueryParams(
        fieldName: event.fieldName,
        query: event.query,
      ),
    );
    allSortedProducts.fold(
      (error) => emit(const ProductFailureState('')),
      (_allSortedProducts) =>
          emit(LoadedAllSortedProductsByQueryState(_allSortedProducts)),
    );
  }
}
