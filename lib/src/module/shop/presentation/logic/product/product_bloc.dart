import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/src/core/error/failure.dart';
import 'package:e_commerce/src/module/shop/domain/entities/product_entity.dart';
import 'package:e_commerce/src/module/shop/domain/usecases/get_all_products.dart';
import 'package:e_commerce/src/module/shop/domain/usecases/get_all_sorted_products_by_query.dart';
import 'package:e_commerce/src/module/shop/domain/usecases/get_all_sorted_products_by_query_with_three_value.dart';
import 'package:e_commerce/src/module/shop/domain/usecases/get_all_sorted_products_by_query_with_two_value.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetAllProducts getAllProducts;
  final GetAllSortedProductsByQuery getAllSortedProducts;
  final GetAllSortedProductsByQueryWithTwoValues
      getAllSortedProductsWithTwoValues;
  final GetAllSortedProductsByQueryWithThreeValues
      getAllSortedProductsWithThreeValues;
  ProductBloc({
    required this.getAllProducts,
    required this.getAllSortedProducts,
    required this.getAllSortedProductsWithTwoValues,
    required this.getAllSortedProductsWithThreeValues,
  }) : super(ProductLoadingState()) {
    on<GetAllProductEvent>(_getAllProducts);
    on<GetAllSortedProductsByQueryEvent>(_getAllSortedProductsByQuery);
    on<GetSortedProductsEvent>(_getSortedProducts);
  }

  void _getAllProducts(
      GetAllProductEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoadingState());
    final allProducts = await getAllProducts.getAllProducts();
    allProducts.fold(
      (error) => emit(const ProductFailureState('')),
      (allProducts) => emit(LoadedAllProductsState(allProducts)),
    );
  }

  void _getAllSortedProductsByQuery(GetAllSortedProductsByQueryEvent event,
      Emitter<ProductState> emit) async {
    emit(ProductLoadingState());
    final sortedProducts = await getAllSortedProducts.call(
      GetAllSortedProductsByQueryParams(
        fieldName: event.fieldName,
        query: event.query,
      ),
    );
    sortedProducts.fold(
      (error) => emit(const ProductFailureState('')),
      (sortedProducts) => emit(LoadedAllProductsState(sortedProducts)),
    );
  }

  void _getSortedProducts(
      GetSortedProductsEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoadingState());
    final Either<Failure, List<ProductEntity>> sortedProducts;
    if (event.thirdQuery == 'all') {
      sortedProducts = await getAllSortedProductsWithTwoValues.call(
        GetAllSortedProductsByQueryWithTwoValuesParams(
          firstQuery: event.firstQuery,
          secondQuery: event.secondQuery,
        ),
      );
    } else if (event.thirdQuery == 'New') {
      sortedProducts = await getAllSortedProducts.call(
        const GetAllSortedProductsByQueryParams(
          fieldName: 'isNew',
          query: true,
        ),
      );
    } else if (event.thirdQuery == 'Sale') {
      sortedProducts = await getAllSortedProducts.call(
        const GetAllSortedProductsByQueryParams(
          fieldName: 'isSale',
          query: true,
        ),
      );
    } else {
      sortedProducts = await getAllSortedProductsWithThreeValues.call(
        GetAllSortedProductsByQueryWithThreeValuesParams(
          firstQuery: event.firstQuery,
          secondQuery: event.secondQuery,
          thirdQuery: event.thirdQuery,
        ),
      );
    }
    sortedProducts.fold(
      (error) => emit(const ProductFailureState('')),
      (sortedProducts) => emit(LoadedAllProductsState(sortedProducts)),
    );
  }
}
