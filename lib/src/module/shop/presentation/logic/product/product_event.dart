part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class GetProductDatailsEvent extends ProductEvent {
  final String productId;
  const GetProductDatailsEvent({required this.productId});
}

class GetProductsListEvent extends ProductEvent {}

class GetProductsByQueryEvent extends ProductEvent {
  final String firstQuery;
  final String secondQuery;
  final String thirdQuery;

  const GetProductsByQueryEvent({
    required this.firstQuery,
    required this.secondQuery,
    required this.thirdQuery,
  });
}

class GetNewAndSaleProductsEvent extends ProductEvent {}

class SetProductEvent extends ProductEvent {
  final ProductDatailEntity product;

  const SetProductEvent(this.product);
}

class GetAllProductEvent extends ProductEvent {}
