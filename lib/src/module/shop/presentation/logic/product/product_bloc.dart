import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProducBloc extends Bloc<ProductEvent, ProductState> {
  //final GetProductDatails getProductDatails;
  final GetAllProducts getAllProducts;
  final GetAllSortedProductsByQuery getAllSortedProducts;
  final GetAllSortedProductsByQueryWithTwoValues
      getAllSortedProductsWithTwoValues;
  final GetAllSortedProductsByQueryWithThreeValues
      getAllSortedProductsWithThreeValues;
  ProducBloc({
    //required this.getProductDatails,
    required this.getAllProducts,
    required this.getAllSortedProducts,
    required this.getAllSortedProductsWithTwoValues,
    required this.getAllSortedProductsWithThreeValues,
  }) : super(LoadingProductstState()) {
    //on<GetProductDatailsEvent>(_getProductDatails);
    on<GetProductsListEvent>(_getAllProducts);
    on<GetAllSortedProductsByQueryEvent>(_getAllSortedProductsByQuery);
    on<GetProductsByQueryEvent>(_getProductsByQuery);
  }

  // void _getProductDatails(
  //     GetProductDatailsEvent event, Emitter<ProductsListState> emit) async {
  //   emit(LoadingProductsListState());
  //   final product = await getProductDatails.call(
  //     GetProductDatailsParams(
  //       productID: event.productID!,
  //     ),
  //   );
  //   product.fold(
  //     (error) => emit(const ProductListFailureState('')),
  //     (product) => emit(LoadedProductDatailsState(product)),
  //   );
  // }

  void _getAllProducts(
      GetProductsListEvent event, Emitter<ProductState> emit) async {
    final allProducts = await getAllProducts.getAllProducts();
    allProducts.fold(
      (error) => emit(const ProductFailureState('')),
      (allProducts) => emit(LoadedProductsState(allProducts)),
    );
  }

  void _getAllSortedProductsByQuery(GetAllSortedProductsByQueryEvent event,
      Emitter<ProductState> emit) async {
    final sortedProducts = await getAllSortedProducts.call(
      GetAllSortedProductsByQueryParams(
        fieldName: event.fieldName,
        query: event.query,
      ),
    );
    sortedProducts.fold(
      (error) => emit(const ProductFailureState('')),
      (sortedProducts) => emit(LoadedProductsState(sortedProducts)),
    );
  }

  void _getProductsByQuery(
      GetProductsByQueryEvent event, Emitter<ProductState> emit) async {
    final Either<Failure, List<ProductEntity>> sortedProducts;
    switch (event.thirdQuery) {
      case 'all':
        sortedProducts = await getAllSortedProductsWithTwoValues.call(
          GetAllSortedProductsByQueryWithTwoValuesParams(
            firstQuery: event.firstQuery,
            secondQuery: event.secondQuery,
          ),
        );
        break;
      case 'New':
        sortedProducts = await getAllSortedProducts.call(
          const GetAllSortedProductsByQueryParams(
            fieldName: 'isNew',
            query: true,
          ),
        );
        break;
      case 'Sale':
        sortedProducts = await getAllSortedProducts.call(
          const GetAllSortedProductsByQueryParams(
            fieldName: 'isSale',
            query: true,
          ),
        );
        break;
      default:
        sortedProducts = await getAllSortedProductsWithThreeValues.call(
          GetAllSortedProductsByQueryWithThreeValuesParams(
            firstQuery: event.firstQuery,
            secondQuery: event.secondQuery,
            thirdQuery: event.thirdQuery,
          ),
        );
    }
    // if (event.thirdQuery == 'all') {
    //   sortedProducts = await getAllSortedProductsWithTwoValues.call(
    //     GetAllSortedProductsByQueryWithTwoValuesParams(
    //       firstQuery: event.firstQuery,
    //       secondQuery: event.secondQuery,
    //     ),
    //   );
    // } else if (event.thirdQuery == 'New') {
    //   sortedProducts = await getAllSortedProducts.call(
    //     const GetAllSortedProductsByQueryParams(
    //       fieldName: 'isNew',
    //       query: true,
    //     ),
    //   );
    // } else if (event.thirdQuery == 'Sale') {
    //   sortedProducts = await getAllSortedProducts.call(
    //     const GetAllSortedProductsByQueryParams(
    //       fieldName: 'isSale',
    //       query: true,
    //     ),
    //   );
    // } else {
    //   sortedProducts = await getAllSortedProductsWithThreeValues.call(
    //     GetAllSortedProductsByQueryWithThreeValuesParams(
    //       firstQuery: event.firstQuery,
    //       secondQuery: event.secondQuery,
    //       thirdQuery: event.thirdQuery,
    //     ),
    //   );
    // }
    sortedProducts.fold(
      (error) => emit(const ProductFailureState('')),
      (sortedProducts) => emit(LoadedProductsState(sortedProducts)),
    );
  }
}
