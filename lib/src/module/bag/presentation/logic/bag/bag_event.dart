part of 'bag_bloc.dart';

abstract class BagEvent extends Equatable {
  const BagEvent();

  @override
  List<Object> get props => [];
}

class SetProductToCartEvent extends BagEvent {
  final BagEntity product;

  const SetProductToCartEvent(this.product);
}

class GetAllProductFromCartEvent extends BagEvent {
  final String userID;

  const GetAllProductFromCartEvent(this.userID);
}

class DeleteProductFromCartEvent extends BagEvent {
  final String userID;
  final String productID;

  const DeleteProductFromCartEvent(this.userID, this.productID);
}

class IncrementQuantityEvent extends BagEvent {
  final BagEntity product;
  final int quantity;

  const IncrementQuantityEvent(this.product, this.quantity);
}

class DecrementQuantityEvent extends BagEvent {
  final BagEntity product;
  final int quantity;

  const DecrementQuantityEvent(this.product, this.quantity);
}

//class GetAllProductFromCartEvent extends BagEvent {}
