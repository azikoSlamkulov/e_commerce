// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';

// part 'multiple_toogle_btn_state.dart';

// class MultipleToogleBtnCubit extends Cubit<MultipleToogleBtnState> {
//   MultipleToogleBtnCubit()
//       : super(const MultipleInitialState(
//             [false, false, false, false, false, false]));

//   List<bool> isSelected = [];
//   final List<String> selectedBtnList = [];

//   selected(
//     List<bool> isSelectedList,
//     //List<String> selectedBtnList,
//     int selectedIndex,
//     //String buttonName,
//   ) {
//     //emit(MultipleUnSelectedState());
//     isSelected = isSelectedList;
//     isSelected[selectedIndex] = !isSelected[selectedIndex];
//     // if (isSelectedList[selectedIndex]) {
//     //   selectedBtnList.add(buttonName);
//     // } else {
//     //   selectedBtnList.remove(buttonName);
//     // }
//     emit(MultipleSelectedState(
//       isSelected,
//       selectedBtnList,
//     ));
//   }
// }
