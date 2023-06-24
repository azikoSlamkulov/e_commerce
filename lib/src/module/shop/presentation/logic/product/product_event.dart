part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class GetProductDatailsEvent extends ProductEvent {
  final String? productID;
  const GetProductDatailsEvent({required this.productID});
}

class GetProductsListEvent extends ProductEvent {}

class GetProductsByQueryEvent extends ProductEvent {
  final dynamic firstQuery;
  final dynamic secondQuery;
  final dynamic thirdQuery;

  const GetProductsByQueryEvent({
    required this.firstQuery,
    required this.secondQuery,
    required this.thirdQuery,
  });
}

class GetAllSortedProductsByQueryEvent extends ProductEvent {
  final String fieldName;
  final dynamic query;

  const GetAllSortedProductsByQueryEvent(this.fieldName, this.query);
}
