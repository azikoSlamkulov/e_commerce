import 'dart:developer';

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
    on<AddProductToCartEvent>(_addProductToCart);
    on<GetAllProductFromCartEvent>(_getAllProductFromCart);
    on<DeleteProductFromCartEvent>(_deleteProductFromCart);
    on<AddNewQuantityEvent>(_addNewQuantity);
    on<SetOrderEvent>(_setOrder);
    on<ClearProductCartEvent>(_clearProductCart);
    // on<IncrementQuantityEvent>(_incrementQuantity);
    // on<DecrementQuantityEvent>(_decrementQuantity);
  }

  List<BagEntity> bagProductList = [];

  double totalAmount = 0;

  // void _getTotalAmount() {
  //   totalAmount = 0;
  //   double newTotalAmount = 0;
  //   for (BagEntity e in bagProductList) {
  //     newTotalAmount = newTotalAmount + e.cardTotalPrice!;
  //   }
  //   totalAmount = newTotalAmount;
  // }

  void _addProductToCart(
      AddProductToCartEvent event, Emitter<BagState> emit) async {
    emit(LoadingBagState());
    if (bagProductList.isEmpty) {
      bagProductList.add(event.product);
      //_getTotalAmount();
      emit(const AddedProductToCartState(true));
    } else {
      bool isExists = false;
      for (BagEntity e in bagProductList) {
        if (e.productID == event.product.productID) {
          isExists = true;
        }
      }
      if (isExists) {
        emit(ExistsState());
      } else {
        bagProductList.add(event.product);
        //_getTotalAmount();
        emit(const AddedProductToCartState(true));
      }
    }
  }

  void _getAllProductFromCart(
      GetAllProductFromCartEvent event, Emitter<BagState> emit) async {
    emit(LoadingBagState());
    double totalAmount = bagProductList.fold(
      0,
      (total, current) => total + current.cardTotalPrice!,
    );
    emit(LoadedAllProductsFromCartState(
      bagProductList,
      totalAmount,
    ));
  }

  void _deleteProductFromCart(
      DeleteProductFromCartEvent event, Emitter<BagState> emit) async {
    emit(LoadingBagState());
    bagProductList.removeWhere((e) => e.productID == event.productID);
    emit(const DeletedProductFromCartState(true));
  }

  void _addNewQuantity(
      AddNewQuantityEvent event, Emitter<BagState> emit) async {
    bagProductList[bagProductList.indexWhere(
        (e) => e.productID == event.product.productID)] = event.product;
    double totalAmount = bagProductList.fold(
      0,
      (total, current) => total + current.cardTotalPrice!,
    );
    emit(LoadedAllProductsFromCartState(
      bagProductList,
      totalAmount,
    ));
  }

  // void _setProductToCart(
  //     SetProductToCartEvent event, Emitter<BagState> emit) async {
  //   emit(LoadingBagState());
  //   //bagProductList.add(event.product);
  //   final isCreated =
  //       await setProductToCart(SetProductToCartParams(product: event.product));
  //   isCreated.fold((error) => emit(const BagFailureState('')),
  //       (isCreated) => emit(AddedProductToCartState(isCreated)));
  //   //emit(const AddedProductToCartState(true));
  // }

  // void _getAllProductFromCart(
  //     GetAllProductFromCartEvent event, Emitter<BagState> emit) async {
  //   emit(LoadingBagState());
  //   final allProducts = await getAllProductsFromCart
  //       .call(GetAllProductsFromCartParams(userID: ''));
  //   allProducts.fold(
  //     (error) => emit(const BagFailureState('')),
  //     (allProducts) {
  //       double totalAmount = allProducts.fold(
  //         0,
  //         (total, current) => total + current.cardTotalPrice!,
  //       );
  //       emit(LoadedAllProductsFromCartState(
  //         allProducts,
  //         totalAmount,
  //       ));
  //     },
  //   );
  // }

  // void _deleteProductFromCart(
  //     DeleteProductFromCartEvent event, Emitter<BagState> emit) async {
  //   emit(LoadingBagState());
  //   final isDeleted = await deleteProductFromCart(
  //       DeleteProductFromCartParams(productID: event.productID));
  //   isDeleted.fold((error) => emit(const BagFailureState('')),
  //       (isDeleted) => emit(DeletedProductFromCartState(isDeleted)));
  // }

  void _setOrder(SetOrderEvent event, Emitter<BagState> emit) async {
    emit(LoadingBagState());
    //bagProductList.add(event.product);
    final isCreated = await setOrder(SetOrderParams(
      order: event.order,
    ));
    isCreated.fold((error) => emit(const BagFailureState('')),
        (isCreated) => emit(AddedOrderState(isCreated)));
    //emit(const AddedProductToCartState(true));
  }

  void _clearProductCart(
      ClearProductCartEvent event, Emitter<BagState> emit) async {
    emit(LoadingBagState());
    bagProductList = [];
    totalAmount = 0;
    emit(ClearedProductCartState());
  }

  // void _incrementQuantity(
  //     IncrementQuantityEvent event, Emitter<BagState> emit) async {
  //   //emit(LoadingBagState());
  //   int quantity = 1;
  //   double price;
  //   double cardTotalPrice = 0;
  //   quantity = event.product.quantity!;
  //   quantity++;
  //   price = event.product.pricePerUnit!;
  //   cardTotalPrice = event.product.cardTotalPrice!;
  //   cardTotalPrice = cardTotalPrice + price;

  //   final isCreated = await setNewQuantity(SetNewQuantityParams(
  //       productID: event.product.productID!,
  //       newQuantity: quantity,
  //       cardTotalPrice: cardTotalPrice));
  //   isCreated.fold(
  //     (error) => emit(const BagFailureState('')),
  //     (isCreated) => emit(NewQuantityState(quantity, price)),
  //   );
  // }

  // void _decrementQuantity(
  //     DecrementQuantityEvent event, Emitter<BagState> emit) async {
  //   int quantity = 1;
  //   double price;
  //   double cardTotalPrice = 0;
  //   quantity = event.product.quantity!;
  //   price = event.product.pricePerUnit!;
  //   cardTotalPrice = event.product.cardTotalPrice!;
  //   if (quantity > 1 && cardTotalPrice > price) {
  //     quantity--;
  //     cardTotalPrice = cardTotalPrice - price;

  //     final isCreated = await setNewQuantity(SetNewQuantityParams(
  //         productID: event.product.productID!,
  //         newQuantity: quantity,
  //         cardTotalPrice: cardTotalPrice));
  //     isCreated.fold(
  //       (error) => emit(const BagFailureState('')),
  //       (isCreated) => emit(DecrementesQuantityState(quantity, cardTotalPrice)),
  //     );
  //   }
  // }
}
