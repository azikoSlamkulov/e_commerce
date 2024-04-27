part of 'single_toggle_btn_cubit.dart';

abstract class SingleToggleBtnState extends Equatable {
  const SingleToggleBtnState();

  @override
  List<Object> get props => [];
}

class SingleToggleBtnInitialState extends SingleToggleBtnState {
  final List<bool> isSelected;

  const SingleToggleBtnInitialState(this.isSelected);
  @override
  List<Object> get props => [isSelected];
}

class SingleToggleBtnSelectedState extends SingleToggleBtnState {
  final List<bool> isSelected;
  final String selectedName;

  const SingleToggleBtnSelectedState(this.isSelected, this.selectedName);
  @override
  List<Object> get props => [isSelected, selectedName];
}

class SingleToggleBtnUnSelectedState extends SingleToggleBtnState {}
