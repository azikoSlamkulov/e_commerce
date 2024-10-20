import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/entities.dart';

part 'sorting_btn_state.dart';

class SortingBtnCubit extends Cubit<SortingState> {
  SortingBtnCubit()
      : super(SortingState(
          choice: 'Newest',
          isSelected: [false, true, false, false, false],
          //sortedProducts: allProducts,
        ));

  void getSortingChoice(int newIndex, List<ProductEntity> allProducts) {
    List<bool> isSelected = [false, true, false, false, false];
    List<ProductEntity> sortedProducts = allProducts;
    String choice = 'Newest';
    for (int index = 0; index < isSelected.length; index++) {
      if (index == newIndex) {
        isSelected[index] = true;
      } else {
        isSelected[index] = false;
      }
    }
    switch (newIndex) {
      case 0:
        choice = 'Popular';
        //sortedProducts.sort((a, b) => a.price!.compareTo(b.price!));
        break;
      case 1:
        choice = 'Newest';
        sortedProducts.sort((a, b) => a.createdDate!.compareTo(b.createdDate!));
        break;
      case 2:
        choice = 'Customer review';
        //sortedProducts.sort((a, b) => a.price!.compareTo(b.price!));
        break;
      case 3:
        choice = 'Price: lowest to high';
        sortedProducts.sort((a, b) => a.price!.compareTo(b.price!));
        break;
      case 4:
        choice = 'Price: highest to low';
        sortedProducts.sort((a, b) => b.price!.compareTo(a.price!));
        break;
    }
    emit(SortingState(
        choice: choice,
        isSelected: isSelected,
        sortedProducts: sortedProducts));
  }
}
