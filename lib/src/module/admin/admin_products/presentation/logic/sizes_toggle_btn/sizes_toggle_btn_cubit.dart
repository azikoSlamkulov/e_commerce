import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sizes_toggle_btn_state.dart';

class SizesToggleBtnCubit extends Cubit<SizesToggleBtnState> {
  SizesToggleBtnCubit()
      : super(const SizesInitialState([false, false, false, false, false]));

  List<bool> isSelected = [false, false, false, false, false];
  String selectedSize = '';

  selected(int selectedIndex) {
    emit(SizesUnSelectedState());
    for (int index = 0; index < isSelected.length; index++) {
      if (index == selectedIndex) {
        isSelected[index] = true;
      } else {
        isSelected[index] = false;
      }
    }
    switch (selectedIndex) {
      case 0:
        selectedSize = 'XS';
        break;
      case 1:
        selectedSize = 'S';
        break;
      case 2:
        selectedSize = 'L';
        break;
      case 3:
        selectedSize = 'M';
        break;
      case 4:
        selectedSize = 'XL';
        break;
    }
    emit(SizesSelectedState(isSelected, selectedSize));
  }
}
