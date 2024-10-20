import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'single_toggle_btn_state.dart';

class SingleToggleBtnCubit extends Cubit<SingleToggleBtnState> {
  SingleToggleBtnCubit()
      : super(const SingleInitialState([false, false, false, false, false]));

  List<bool> isSelected = [false, false, false, false, false];

  selected(int selectedIndex) {
    emit(SingleUnSelectedState());
    for (int index = 0; index < isSelected.length; index++) {
      if (index == selectedIndex) {
        isSelected[index] = true;
      } else {
        isSelected[index] = false;
      }
    }
    String _choice = '';
    switch (selectedIndex) {
      case 0:
        _choice = 'Clothes';
        break;
      case 1:
        _choice = 'Shoes';
        break;
      case 2:
        _choice = 'Accesories';
        break;
      case 3:
        _choice = '';
        break;
      case 4:
        _choice = '';
        break;
    }
    emit(SingleSelectedState(isSelected, _choice));
  }
}
