part of 'bag_bloc.dart';

abstract class BagState extends Equatable {
  const BagState();

  @override
  List<Object> get props => [];
}

class BagInitial extends BagState {}

class LoadingBagState extends BagState {}

class LoadedAllProductsFromCartState extends BagState {
  final List<BagEntity> allProducts;
  final double totalAmount;
  const LoadedAllProductsFromCartState(this.allProducts, this.totalAmount);
  @override
  List<Object> get props => [allProducts, totalAmount];
}

class AddedProductToCartState extends BagState {
  final bool isCreated;
  const AddedProductToCartState(this.isCreated);
  @override
  List<Object> get props => [isCreated];
}

class DeletedProductFromCartState extends BagState {
  final bool isDeleted;
  const DeletedProductFromCartState(this.isDeleted);
  @override
  List<Object> get props => [isDeleted];
}

class IncrementesQuantityState extends BagState {
  final int newQuantity;
  final double newPrice;
  const IncrementesQuantityState(this.newQuantity, this.newPrice);
  @override
  List<Object> get props => [newQuantity, newPrice];
}

class DecrementesQuantityState extends BagState {
  final int newQuantity;
  final double newPrice;
  const DecrementesQuantityState(this.newQuantity, this.newPrice);
  @override
  List<Object> get props => [newQuantity, newPrice];
}

class FailureState extends BagState {
  final String message;
  const FailureState(this.message);
  @override
  List<Object> get props => [message];
}
