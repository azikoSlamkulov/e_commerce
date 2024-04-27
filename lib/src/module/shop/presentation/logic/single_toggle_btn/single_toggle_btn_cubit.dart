import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'single_toggle_btn_state.dart';

class SingleToggleBtnCubit extends Cubit<SingleToggleBtnState> {
  SingleToggleBtnCubit()
      : super(const SingleToggleBtnInitialState(
          [false, false, false, false, false, false],
        ));

  List<bool> isSelected = [];
  //String selectedName = '';

  selected(
      List<bool> isSelectedList, int selectedIndex, String selectedBtnName) {
    isSelected = isSelectedList;
    for (int index = 0; index < isSelected.length; index++) {
      if (index == selectedIndex) {
        isSelected[index] = true;
      } else {
        isSelected[index] = false;
      }
    }
    emit(SingleToggleBtnSelectedState(isSelected, selectedBtnName));
  }
}
