// import 'package:e_commerce/lib.dart';

// part 'product_event.dart';
// part 'product_state.dart';

// class ProductBloc extends Bloc<ProductEvent, ProductState> {
//   final GetProductDatails getProduct;
//   ProductBloc({
//     required this.getProduct,
//   }) : super(LoadingProductState()) {
//     on<GetProductEvent>(_getProduct);
//   }

//   void _getProduct(GetProductEvent event, Emitter<ProductState> emit) async {
//     emit(LoadingProductState());
//     final product = await getProduct.call(
//       GetProductDatailsParams(
//         productID: event.productID!,
//       ),
//     );
//     product.fold(
//       (error) => emit(const ProductFailureState('')),
//       (product) => emit(LoadedProductState(product)),
//     );
//   }
// }
