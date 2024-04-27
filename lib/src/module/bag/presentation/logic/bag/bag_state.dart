part of 'bag_bloc.dart';

abstract class BagState extends Equatable {
  const BagState();

  @override
  List<Object> get props => [];
}

class LoadingBagState extends BagState {}

class LoadedAllProductsFromCartState extends BagState {
  final List<BagEntity> allProducts;
  final double totalAmount;
  const LoadedAllProductsFromCartState(this.allProducts, this.totalAmount);
  @override
  List<Object> get props => [allProducts, totalAmount];
  // final FakeBagsData allProducts;

  // const LoadedAllProductsFromCartState(
  //     {this.allProducts = const FakeBagsData()});
  // @override
  // List<Object> get props => [allProducts];
}

class AddedProductToCartState extends BagState {
  final bool isCreated;
  const AddedProductToCartState(this.isCreated);
  @override
  List<Object> get props => [isCreated];
  // final FakeBagsData allProducts;

  // const AddedProductToCartState({this.allProducts = const FakeBagsData()});
  // @override
  // List<Object> get props => [allProducts];
}

class DeletedProductFromCartState extends BagState {
  final bool isDeleted;
  const DeletedProductFromCartState(this.isDeleted);
  @override
  List<Object> get props => [isDeleted];
}

class AddedOrder extends BagState {
  final bool isCreated;
  const AddedOrder(this.isCreated);
  @override
  List<Object> get props => [isCreated];
  // final FakeBagsData allProducts;

  // const AddedProductToCartState({this.allProducts = const FakeBagsData()});
  // @override
  // List<Object> get props => [allProducts];
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

class NewQuantityState extends BagState {
  final int newQuantity;
  final double newPrice;
  const NewQuantityState(this.newQuantity, this.newPrice);
  @override
  List<Object> get props => [newQuantity, newPrice];
}

class FailureState extends BagState {
  final String message;
  const FailureState(this.message);
  @override
  List<Object> get props => [message];
}
