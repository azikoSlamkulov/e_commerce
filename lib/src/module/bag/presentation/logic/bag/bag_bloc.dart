import 'package:e_commerce/lib.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bag_event.dart';
part 'bag_state.dart';

class BagBloc extends Bloc<BagEvent, BagState> {
  final SetProductToCart setProductToCart;
  final GetAllProductsFromCart getAllProductsFromCart;
  final DeleteProductFromCart deleteProductFromCart;
  final SetNewQuantity setNewQuantity;
  final SetOrder setOrder;
  BagBloc({
    required this.setProductToCart,
    required this.getAllProductsFromCart,
    required this.deleteProductFromCart,
    required this.setNewQuantity,
    required this.setOrder,
  }) : super(LoadingBagState()) {
    on<SetProductToCartEvent>(_setProductToCart);
    on<GetAllProductFromCartEvent>(_getAllProductFromCart);
    on<DeleteProductFromCartEvent>(_deleteProductFromCart);
    on<SetOrderEvent>(_setOrder);
    on<IncrementQuantityEvent>(_incrementQuantity);
    on<DecrementQuantityEvent>(_decrementQuantity);
  }

  //List<BagEntity> bagProductList = [];

  void _setProductToCart(
      SetProductToCartEvent event, Emitter<BagState> emit) async {
    emit(LoadingBagState());
    //bagProductList.add(event.product);
    final isCreated =
        await setProductToCart(SetProductToCartParams(product: event.product));
    isCreated.fold((error) => emit(const FailureState('')),
        (isCreated) => emit(AddedProductToCartState(isCreated)));
    //emit(const AddedProductToCartState(true));
  }

  void _getAllProductFromCart(
      GetAllProductFromCartEvent event, Emitter<BagState> emit) async {
    emit(LoadingBagState());
    final allProducts = await getAllProductsFromCart
        .call(GetAllProductsFromCartParams(userID: ''));
    allProducts.fold(
      (error) => emit(const FailureState('')),
      (allProducts) {
        double totalAmount = allProducts.fold(
          0,
          (total, current) => total + current.cardTotalPrice!,
        );
        emit(LoadedAllProductsFromCartState(
          allProducts,
          totalAmount,
        ));
      },
    );
  }

  void _deleteProductFromCart(
      DeleteProductFromCartEvent event, Emitter<BagState> emit) async {
    emit(LoadingBagState());
    final isDeleted = await deleteProductFromCart(
        DeleteProductFromCartParams(productID: event.productID));
    isDeleted.fold((error) => emit(const FailureState('')),
        (isDeleted) => emit(DeletedProductFromCartState(isDeleted)));
  }

  void _setOrder(SetOrderEvent event, Emitter<BagState> emit) async {
    emit(LoadingBagState());
    //bagProductList.add(event.product);
    final isCreated = await setOrder(SetOrderParams(order: event.order));
    isCreated.fold((error) => emit(const FailureState('')),
        (isCreated) => emit(AddedProductToCartState(isCreated)));
    //emit(const AddedProductToCartState(true));
  }

  void _incrementQuantity(
      IncrementQuantityEvent event, Emitter<BagState> emit) async {
    //emit(LoadingBagState());
    int quantity = 1;
    double price;
    double cardTotalPrice = 0;
    quantity = event.product.quantity!;
    quantity++;
    price = event.product.pricePerUnit!;
    cardTotalPrice = event.product.cardTotalPrice!;
    cardTotalPrice = cardTotalPrice + price;

    final isCreated = await setNewQuantity(SetNewQuantityParams(
        productID: event.product.productID!,
        newQuantity: quantity,
        cardTotalPrice: cardTotalPrice));
    isCreated.fold(
      (error) => emit(const FailureState('')),
      (isCreated) => emit(NewQuantityState(quantity, price)),
    );
  }

  void _decrementQuantity(
      DecrementQuantityEvent event, Emitter<BagState> emit) async {
    int quantity = 1;
    double price;
    double cardTotalPrice = 0;
    quantity = event.product.quantity!;
    price = event.product.pricePerUnit!;
    cardTotalPrice = event.product.cardTotalPrice!;
    if (quantity > 1 && cardTotalPrice > price) {
      quantity--;
      cardTotalPrice = cardTotalPrice - price;

      final isCreated = await setNewQuantity(SetNewQuantityParams(
          productID: event.product.productID!,
          newQuantity: quantity,
          cardTotalPrice: cardTotalPrice));
      isCreated.fold(
        (error) => emit(const FailureState('')),
        (isCreated) => emit(DecrementesQuantityState(quantity, cardTotalPrice)),
      );
    }
  }
}
