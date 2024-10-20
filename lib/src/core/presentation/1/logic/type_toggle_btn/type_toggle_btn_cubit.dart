// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';

// part 'type_toggle_btn_state.dart';

// class TypeToggleBtnCubit extends Cubit<TypeToggleBtnState> {
//   TypeToggleBtnCubit()
//       : super(const TypeInitialState([false, false, false, false, false]));

//   List<bool> isSelected = [false, false, false, false, false];

//   selected(int selectedIndex) {
//     emit(TypeUnSelectedState());
//     for (int index = 0; index < isSelected.length; index++) {
//       if (index == selectedIndex) {
//         isSelected[index] = true;
//       } else {
//         isSelected[index] = false;
//       }
//     }
//     String choice = '';
//     switch (selectedIndex) {
//       case 0:
//         choice = 'Women';
//         break;
//       case 1:
//         choice = 'Men';
//         break;
//       case 2:
//         choice = 'Kids';
//         break;
//       case 3:
//         choice = '';
//         break;
//       case 4:
//         choice = '';
//         break;
//     }
//     emit(TypeSelectedState(isSelected, choice));
//   }
// }
