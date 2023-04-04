part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class GetProductEvent extends ProductEvent {
  final String? productID;

  const GetProductEvent(this.productID);
}

class GetAllProductEvent extends ProductEvent {}

class GetSortedProductsEvent extends ProductEvent {
  final dynamic firstQuery;
  final dynamic secondQuery;
  final dynamic thirdQuery;
  //final String isAllViews;
  // final String isNew;
  // final String isSale;

  const GetSortedProductsEvent({
    required this.firstQuery,
    required this.secondQuery,
    required this.thirdQuery,
    //required this.isAllViews,
    // required this.isNew,
    // required this.isSale,
  });
}

// class AddToCartEvent extends ProductEvent {
//   final BagEntity product;

//   const AddToCartEvent({
//     required this.product,
//   });
// }

class GetFakeSortedListEvent extends ProductEvent {
  final dynamic type;
  final dynamic collection;
  final dynamic category;
  final String? choice;

  const GetFakeSortedListEvent({
    required this.type,
    required this.collection,
    required this.category,
    this.choice,
  });
}

// class SortedListEvent extends ProductEvent {
//   final int newIndex;
//   final dynamic type;
//   final dynamic collection;
//   final dynamic category;
//   final List<bool> isSelected;

//   const SortedListEvent({
//     required this.newIndex,
//     required this.type,
//     required this.collection,
//     required this.category,
//     required this.isSelected,
//   });
// }

class GetAllSortedProductsByQueryEvent extends ProductEvent {
  final String fieldName;
  final dynamic query;

  const GetAllSortedProductsByQueryEvent(this.fieldName, this.query);
}

class GetAllSortedListByQueryWithThreeValuesEvent extends ProductEvent {
  final dynamic firstQuery;
  final dynamic secondQuery;
  final dynamic thirdQuery;
  final String isAll;

  const GetAllSortedListByQueryWithThreeValuesEvent({
    required this.firstQuery,
    required this.secondQuery,
    required this.thirdQuery,
    required this.isAll,
  });
}
