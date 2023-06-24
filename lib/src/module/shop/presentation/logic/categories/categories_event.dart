part of 'categories_bloc.dart';

abstract class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object> get props => [];
}

class GetCategoriesEvent extends CategoriesEvent {
  final String type;
  final String collection;

  const GetCategoriesEvent(
    this.type,
    this.collection,
  );
}
