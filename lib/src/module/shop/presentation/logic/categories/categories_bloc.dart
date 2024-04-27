import 'package:e_commerce/lib.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final GetCategories getCategories;
  final GetAllCategories getAllCategories;
  final AddCategory addCategory;
  final DaleteCategory daleteCategory;

  CategoriesBloc({
    required this.getCategories,
    required this.getAllCategories,
    required this.addCategory,
    required this.daleteCategory,
  }) : super(InitialState()) {
    on<GetCategoriesEvent>(_getSortedCategories);
    on<GetAllCategoriesEvent>(_getAllCategories);
    //on<TypedCategoryEvent>(_typedCategory);
    on<SetCategoryEvent>(_setCategory);
    on<DeleteCategoryEvent>(_deleteCategory);
  }

  void _getSortedCategories(
      GetCategoriesEvent event, Emitter<CategoriesState> emit) async {
    emit(LoadingCategoriesState());
    final categories = await getCategories(GetCategoriesParams(
      type: event.type,
      collection: event.collection,
    ));
    categories.fold(
      (error) => emit(const CategoriesFailureState('')),
      (allCategories) => emit(LoadedCategoriesState(allCategories)),
    );
  }

  void _getAllCategories(
      GetAllCategoriesEvent event, Emitter<CategoriesState> emit) async {
    emit(LoadingCategoriesState());
    final allCategories = await getAllCategories.getAllCategories();
    allCategories.fold(
      (error) => emit(const CategoriesFailureState('')),
      (allCategories) => emit(LoadedAllCategoriesState(allCategories)),
    );
  }

  void _setCategory(
      SetCategoryEvent event, Emitter<CategoriesState> emit) async {
    emit(LoadingCategoriesState());
    final isCreated = await addCategory(SetCategoryParams(
      typeName: event.type,
      collectionName: event.collection,
      categoryName: event.category,
    ));
    isCreated.fold(
      (error) => emit(const CategoriesFailureState('')),
      (isCreated) => emit(CreatedCategoryState(isCreated, event.category)),
    );
  }

  void _deleteCategory(
      DeleteCategoryEvent event, Emitter<CategoriesState> emit) async {
    emit(LoadingCategoriesState());
    final isDeleted = await daleteCategory(DeleteCategoryParams(
      id: event.id,
    ));
    isDeleted.fold(
      (error) => emit(const CategoriesFailureState('')),
      (isDeleted) => emit(DeletedCategoryState(isDeleted, event.categoryName)),
    );
  }

  // void _typedCategory(
  //     TypedCategoryEvent event, Emitter<CategoriesState> emit) async {
  //   emit(LoadingState());
  //   final typedCategory = CategoryEntity(
  //     type: event.type,
  //     collection: event.collection,
  //     category: event.category,
  //   );
  //   emit(TypedCategoryState(typedCategory));
  // }
}
