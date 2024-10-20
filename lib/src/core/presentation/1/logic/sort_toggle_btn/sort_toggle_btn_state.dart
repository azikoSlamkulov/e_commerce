part of 'sort_toggle_btn_cubit.dart';

// abstract class SortToggleBtnState extends Equatable {
//   const SortToggleBtnState();

//   @override
//   List<Object> get props => [];
// }

// class SortToggleBtnInitial extends SortToggleBtnState {
//   final String selectedText;
//   final List<bool> isSelected;

//   const SortToggleBtnInitial(
//       {required this.selectedText, required this.isSelected});
//   @override
//   List<Object> get props => [selectedText, isSelected];
// }

// abstract class SortToggleButtonState extends Equatable {
//   const SortToggleButtonState();

//   @override
//   List<Object> get props => [];
// }

// class InitialState extends SortToggleBtnState {
//   final String selectedText;

//   const InitialState(this.selectedText);
//   @override
//   List<Object> get props => [selectedText];
// }

// class SortSelectedState extends SortToggleBtnState {
//   final String selectedText;
//   final List<bool> isSelected;

//   const SortSelectedState(
//       {required this.selectedText, required this.isSelected});
//   @override
//   List<Object> get props => [selectedText, isSelected];
// }

class SortToggleBtnState {
  final String selectedText;
  final List<bool> isSelected;
  const SortToggleBtnState({
    required this.selectedText,
    required this.isSelected,
  });
}
