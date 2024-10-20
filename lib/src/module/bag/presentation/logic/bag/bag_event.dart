part of 'bag_bloc.dart';

abstract class BagEvent extends Equatable {
  const BagEvent();

  @override
  List<Object> get props => [];
}

class ClearProductCartEvent extends BagEvent {}

class AddProductToCartEvent extends BagEvent {
  final BagEntity product;

  const AddProductToCartEvent(this.product);
}

class GetAllProductFromCartEvent extends BagEvent {
  //final String userID;

  const GetAllProductFromCartEvent();
}

class DeleteProductFromCartEvent extends BagEvent {
  final String productID;

  const DeleteProductFromCartEvent(this.productID);
}

class AddNewQuantityEvent extends BagEvent {
  final BagEntity product;

  const AddNewQuantityEvent(this.product);
}

class SetOrderEvent extends BagEvent {
  final OrderEntity order;

  const SetOrderEvent(this.order);
}

class IncrementQuantityEvent extends BagEvent {
  final BagEntity product;
  //final int quantity;

  const IncrementQuantityEvent(this.product);
}

class DecrementQuantityEvent extends BagEvent {
  final BagEntity product;
  //final int quantity;

  const DecrementQuantityEvent(this.product);
}

//class GetAllProductFromCartEvent extends BagEvent {}
