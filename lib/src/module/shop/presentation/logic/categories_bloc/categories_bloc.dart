import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/src/module/shop/domain/entities/category_entity.dart';
import 'package:e_commerce/src/module/shop/domain/usecases/get_categories.dart';
import 'package:equatable/equatable.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final GetCategories getCategories;

  CategoriesBloc({
    required this.getCategories,
  }) : super(InitialState()) {
    on<GetCategoriesEvent>(_getAllCategories);
    //on<TypedCategoryEvent>(_typedCategory);
  }

  void _getAllCategories(
      GetCategoriesEvent event, Emitter<CategoriesState> emit) async {
    emit(LoadingState());
    final allCategories = await getCategories(GetCategoriesParams(
      type: event.type,
      collection: event.collection,
    ));
    allCategories.fold(
      (error) => emit(const CategoriesFailureState('')),
      (allCategories) => emit(LoadedCategoriesState(allCategories)),
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
