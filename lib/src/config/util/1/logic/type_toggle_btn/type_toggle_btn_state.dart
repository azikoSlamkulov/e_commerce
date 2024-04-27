part of 'type_toggle_btn_cubit.dart';

abstract class TypeToggleBtnState extends Equatable {
  const TypeToggleBtnState();

  @override
  List<Object> get props => [];
}

class TypeInitialState extends TypeToggleBtnState {
  final List<bool> isSelected;

  const TypeInitialState(this.isSelected);
  @override
  List<Object> get props => [isSelected];
}

class TypeSelectedState extends TypeToggleBtnState {
  final List<bool> isSelected;
  final String typeChoice;

  const TypeSelectedState(this.isSelected, this.typeChoice);
  @override
  List<Object> get props => [isSelected, typeChoice];
}

class TypeUnSelectedState extends TypeToggleBtnState {}
