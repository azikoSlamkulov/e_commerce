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

class GetAllCategoriesEvent extends CategoriesEvent {}

class SetCategoryEvent extends CategoriesEvent {
  final String type;
  final String collection;
  final String category;

  const SetCategoryEvent(
    this.type,
    this.collection,
    this.category,
  );
}

class DeleteCategoryEvent extends CategoriesEvent {
  final String id;
  final String categoryName;

  const DeleteCategoryEvent({required this.id, required this.categoryName});
}
