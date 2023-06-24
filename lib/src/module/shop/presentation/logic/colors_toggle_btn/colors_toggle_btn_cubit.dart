import 'package:e_commerce/lib.dart';

part 'colors_toggle_btn_state.dart';

class ColorsToggleBtnCubit extends Cubit<ColorsToggleBtnState> {
  ColorsToggleBtnCubit()
      : super(const ColorsInitialState(
            [false, false, false, false, false, false]));

  List<bool> isSelected = [false, false, false, false, false, false];
  String selectedColor = '';
  selected(int selectedIndex) {
    emit(ColorsUnSelectedState());
    for (int index = 0; index < isSelected.length; index++) {
      if (index == selectedIndex) {
        isSelected[index] = true;
      } else {
        isSelected[index] = false;
      }
    }
    switch (selectedIndex) {
      case 0:
        selectedColor = 'Black';
        break;
      case 1:
        selectedColor = 'White';
        break;
      case 2:
        selectedColor = 'Red';
        break;
      case 3:
        selectedColor = 'Grey';
        break;
      case 4:
        selectedColor = 'Blue';
        break;
    }
    emit(ColorsSelectedState(isSelected, selectedColor));
  }
}
