part of 'categories_bloc.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

class InitialState extends CategoriesState {}

class LoadingState extends CategoriesState {}

class LoadedCategoriesState extends CategoriesState {
  final List<CategoryEntity> allCategories;
  const LoadedCategoriesState(this.allCategories);
  @override
  List<Object> get props => [allCategories];
}

class CategoriesFailureState extends CategoriesState {
  final String message;
  const CategoriesFailureState(this.message);
  @override
  List<Object> get props => [message];
}
