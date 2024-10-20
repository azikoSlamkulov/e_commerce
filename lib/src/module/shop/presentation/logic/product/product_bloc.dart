//import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductsByQuery getProductsByQuery;
  final GetNewAndSaleProducts getNewAndSaleProducts;
  final SetProduct setProducts;
  final GetAllProducts getAllProducts;
  final GetProductDatails getProductDatails;
  ProductBloc({
    required this.getProductsByQuery,
    required this.getNewAndSaleProducts,
    required this.setProducts,
    required this.getAllProducts,
    required this.getProductDatails,
  }) : super(LoadingProductstState()) {
    on<GetNewAndSaleProductsEvent>(_getNewAndSaleProducts);
    on<GetProductsByQueryEvent>(_getProductsByQuery);
    on<SetProductEvent>(_setProduct);
    on<GetAllProductEvent>(_getAllProducts);
    on<GetProductDatailsEvent>(_getProductDatails);
  }

  void _getAllProducts(
      GetAllProductEvent event, Emitter<ProductState> emit) async {
    emit(LoadingProductstState());
    final allProducts = await getAllProducts.getAllProducts();
    allProducts.fold(
      (error) => emit(ProductFailureState(error)),
      (_allProducts) => emit(LoadedAllProductState(_allProducts)),
    );
  }

  void _getProductDatails(
      GetProductDatailsEvent event, Emitter<ProductState> emit) async {
    final productDatails = await getProductDatails(
      GetProductDatailsParams(
        productId: event.productId,
      ),
    );
    productDatails.fold(
      (error) => emit(ProductFailureState(error)),
      (datails) => emit(LoadedProductDatailsState(datails)),
    );
  }

  void _getNewAndSaleProducts(
      GetNewAndSaleProductsEvent event, Emitter<ProductState> emit) async {
    final newAndSaleProducts =
        await getNewAndSaleProducts.getNewAndSaleProducts();
    newAndSaleProducts.fold(
      (error) => emit(ProductFailureState(error)),
      (products) => emit(LoadedProductsState(products)),
    );
  }

  void _getProductsByQuery(
      GetProductsByQueryEvent event, Emitter<ProductState> emit) async {
    final sortedProducts = await getProductsByQuery(
      GetProductsByQueryParams(
        firstQuery: event.firstQuery,
        secondQuery: event.secondQuery,
        thirdQuery: event.thirdQuery,
      ),
    );
    sortedProducts.fold(
      (error) => emit(ProductFailureState(error)),
      (sortedProducts) => emit(LoadedProductsState(sortedProducts)),
    );
  }

  void _setProduct(SetProductEvent event, Emitter<ProductState> emit) async {
    emit(LoadingProductstState());
    final isCreated =
        await setProducts(SetProductParams(product: event.product));
    isCreated.fold(
      (error) => emit(ProductFailureState(error)),
      (_isCreated) async {
        // if (_isCreated) {
        //   final allProducts = await getAllProducts.getAllProducts();
        //   allProducts.fold(
        //     (error) => emit(const ProductFailureState('')),
        //     (_allProducts) => emit(LoadedAllProductState(_allProducts)),
        //   );
        // }

        emit(CreatedProductState(_isCreated));
      },
    );
  }
}
