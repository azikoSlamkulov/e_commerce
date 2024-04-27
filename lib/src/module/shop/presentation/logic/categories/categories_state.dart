part of 'categories_bloc.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

class InitialState extends CategoriesState {}

class LoadingCategoriesState extends CategoriesState {}

class LoadedCategoriesState extends CategoriesState {
  final List<CategoryEntity> allCategories;
  const LoadedCategoriesState(this.allCategories);
  @override
  List<Object> get props => [allCategories];
}

class LoadedAllCategoriesState extends CategoriesState {
  //final List<TypeEntity> allTypes;
  final List<CategoryEntity> allCategories;
  const LoadedAllCategoriesState(this.allCategories);
  @override
  List<Object> get props => [allCategories];
}

class CreatedCategoryState extends CategoriesState {
  final bool isCreated;
  final String categoryName;
  const CreatedCategoryState(this.isCreated, this.categoryName);
  @override
  List<Object> get props => [isCreated, categoryName];
}

class DeletedCategoryState extends CategoriesState {
  final bool isDeleted;
  final String categoryName;
  const DeletedCategoryState(this.isDeleted, this.categoryName);
  @override
  List<Object> get props => [isDeleted, categoryName];
}

class CategoriesFailureState extends CategoriesState {
  final String message;
  const CategoriesFailureState(this.message);
  @override
  List<Object> get props => [message];
}
