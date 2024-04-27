// import 'package:flutter_bloc/flutter_bloc.dart';

// part 'sort_toggle_btn_state.dart';

// class SortToggleBtnCubit extends Cubit<SortToggleBtnState> {
//   SortToggleBtnCubit()
//       : super(const SortToggleBtnState(
//           selectedText: 'Price: lowest to high',
//           isSelected: [false, false, false, true, false],
//         ));

//   List<bool> isSelected = [false, false, false, true, false];
//   String selectedSize = '';

//   getSelectedIndex(int selectedIndex) {
//     //emit(SizesUnSelectedState());
//     for (int index = 0; index < isSelected.length; index++) {
//       if (index == selectedIndex) {
//         isSelected[index] = true;
//       } else {
//         isSelected[index] = false;
//       }
//     }
//     switch (selectedIndex) {
//       case 0:
//         selectedSize = 'Popular';
//         break;
//       case 1:
//         selectedSize = 'Newest';
//         break;
//       case 2:
//         selectedSize = 'Customer review';
//         break;
//       case 3:
//         selectedSize = 'Price: lowest to high';
//         break;
//       case 4:
//         selectedSize = 'Price: highest to low';
//         break;
//     }
//     emit(SortToggleBtnState(
//       selectedText: selectedSize,
//       isSelected: isSelected,
//     ));
//   }
// }
