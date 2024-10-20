import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'category_toggle_btn_state.dart';

class CategoryToggleBtnCubit extends Cubit<CategoryToggleBtnState> {
  CategoryToggleBtnCubit()
      : super(const CategoryInitialState([true, false, false, false, false]));

  List<bool> isSelected = [false, false, false, false, false];

  selected(int selectedIndex) {
    emit(UnSelectedState());
    for (int index = 0; index < isSelected.length; index++) {
      if (index == selectedIndex) {
        isSelected[index] = true;
      } else {
        isSelected[index] = false;
      }
    }
    emit(SelectedState(isSelected));
  }
}
