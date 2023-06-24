import 'package:e_commerce/lib.dart';

part 'bag_event.dart';
part 'bag_state.dart';

class BagBloc extends Bloc<BagEvent, BagState> {
  final SetProductToCart setProductToCart;
  final GetAllProductsFromCart getAllProductsFromCart;
  final DeleteProductFromCart deleteProductFromCart;
  BagBloc({
    required this.setProductToCart,
    required this.getAllProductsFromCart,
    required this.deleteProductFromCart,
  }) : super(LoadingBagState()) {
    on<SetProductToCartEvent>(_setProductToCart);
    on<GetAllProductFromCartEvent>(_getAllProductFromCart);
    on<DeleteProductFromCartEvent>(_deleteProductFromCart);
    on<IncrementQuantityEvent>(_incrementQuantity);
    on<DecrementQuantityEvent>(_decrementQuantity);
  }

  List<BagEntity> bagProductList = [];

  void _setProductToCart(
      SetProductToCartEvent event, Emitter<BagState> emit) async {
    emit(LoadingBagState());
    bagProductList.add(event.product);
    // final isCreated =
    //     await setProductToCart(SetProductToCartParams(product: event.product));
    // isCreated.fold((error) => emit(const FailureState('')),
    //     (isCreated) => emit(AddedProductToCartState(isCreated)));
    emit(const AddedProductToCartState(true));
  }

  void _getAllProductFromCart(
      GetAllProductFromCartEvent event, Emitter<BagState> emit) async {
    emit(LoadingBagState());
    // final allProducts = await getAllProductsFromCart
    //     .call(GetAllProductsFromCartParams(userID: event.userID));
    // allProducts.fold(
    //   (error) => emit(const FailureState('')),
    //   (allProducts) {
    //     double totalAmount = allProducts.fold(0,
    //         (total, current) => total + (current.quantity! * current.price!));

    //     emit(LoadedAllProductsFromCartState(
    //       allProducts,
    //       totalAmount,
    //     ));
    //   },
    // );
    // double totalAmount = bagProductList.fold(
    //     0, (total, current) => total + (current.quantity! * current.price!));

    emit(LoadedAllProductsFromCartState(
      bagProductList,
      10,
    ));
  }

  void _deleteProductFromCart(
      DeleteProductFromCartEvent event, Emitter<BagState> emit) async {
    emit(LoadingBagState());
    final isDeleted = await deleteProductFromCart(DeleteProductFromCartParams(
        userID: event.userID, productID: event.productID));
    isDeleted.fold((error) => emit(const FailureState('')),
        (isDeleted) => emit(DeletedProductFromCartState(isDeleted)));
  }

  void _incrementQuantity(
      IncrementQuantityEvent event, Emitter<BagState> emit) async {
    int quantity = 1;
    double price;
    quantity++;
    price = event.product.price! * quantity;
    //emit(LoadingBagState());
    // final isCreated =
    //     await setProductToCart(SetProductToCartParams(product: event.product));
    // isCreated.fold((error) => emit(const FailureState('')),
    //(isCreated) =>
    emit(IncrementesQuantityState(quantity, price));
  }

  void _decrementQuantity(
      DecrementQuantityEvent event, Emitter<BagState> emit) async {
    int quantity = 1;
    double price;
    quantity--;
    price = event.product.price! * quantity;
    //emit(LoadingBagState());
    // final isCreated =
    //     await setProductToCart(SetProductToCartParams(product: event.product));
    // isCreated.fold((error) => emit(const FailureState('')),
    //     (isCreated) =>
    emit(DecrementesQuantityState(quantity, price));
  }
}
