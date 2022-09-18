import 'package:equatable/equatable.dart';

class ProductEvent extends Equatable {
  const ProductEvent();
  @override
  List<Object> get props => [];
}

class GetProductEvent extends ProductEvent {
  final String? productID;

  const GetProductEvent(this.productID);
}

class GetAllProductEvent extends ProductEvent {}

class GetAllSortedProductsByQueryEvent extends ProductEvent {
  final String fieldName;
  final dynamic query;

  const GetAllSortedProductsByQueryEvent(this.fieldName, this.query);
}
