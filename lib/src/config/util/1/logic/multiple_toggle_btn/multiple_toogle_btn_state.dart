part of 'multiple_toogle_btn_cubit.dart';

abstract class MultipleToogleBtnState extends Equatable {
  const MultipleToogleBtnState();

  @override
  List<Object> get props => [];
}

class MultipleInitialState extends MultipleToogleBtnState {
  final List<bool> isSelectedList;

  const MultipleInitialState(this.isSelectedList);
  @override
  List<Object> get props => [isSelectedList];
}

class MultipleSelectedState extends MultipleToogleBtnState {
  final List<bool> isSelectedList;
  final List<String> selectedBtnsList;

  const MultipleSelectedState(this.isSelectedList, this.selectedBtnsList);
  @override
  List<Object> get props => [isSelectedList, selectedBtnsList];
}

class MultipleUnSelectedState extends MultipleToogleBtnState {}
