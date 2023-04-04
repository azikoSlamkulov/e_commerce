// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';

// part 'product_event.dart';
// part 'product_state.dart';

// class ProductBloc extends Bloc<ProductEvent, ProductState> {
//   final SetProduct setProducts;
//   final GetAllProducts getAllProducts;
//   ProductBloc({
//     required this.setProducts,
//     required this.getAllProducts,
//   }) : super(ProductInitial()) {
//     on<SetProductEvent>(_setProduct);
//     on<GetAllProductEvent>(_getAllProducts);
//   }

//   void _setProduct(SetProductEvent event, Emitter<ProductState> emit) async {
//     emit(LoadingProductState());
//     final isCreated =
//         await setProducts(SetProductParams(product: event.product));
//     isCreated.fold(
//       (error) => emit(const ProductFailureState('')),
//       (_isCreated) async {
//         // if (_isCreated) {
//         //   final allProducts = await getAllProducts.getAllProducts();
//         //   allProducts.fold(
//         //     (error) => emit(const ProductFailureState('')),
//         //     (_allProducts) => emit(LoadedAllProductState(_allProducts)),
//         //   );
//         // }

//         emit(CreatedProductState(_isCreated));
//       },
//     );
//   }

//   void _getAllProducts(
//       GetAllProductEvent event, Emitter<ProductState> emit) async {
//     emit(LoadingProductState());
//     final allProducts = await getAllProducts.getAllProducts();
//     allProducts.fold(
//       (error) => emit(const ProductFailureState('')),
//       (_allProducts) => emit(LoadedAllProductState(_allProducts)),
//     );
//   }
// }
