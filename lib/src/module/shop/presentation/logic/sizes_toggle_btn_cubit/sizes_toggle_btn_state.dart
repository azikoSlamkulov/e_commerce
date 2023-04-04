part of 'sizes_toggle_btn_cubit.dart';

abstract class SizesToggleBtnState extends Equatable {
  const SizesToggleBtnState();

  @override
  List<Object> get props => [];
}

class SizesInitialState extends SizesToggleBtnState {
  final List<bool> isSelected;

  const SizesInitialState(this.isSelected);
  @override
  List<Object> get props => [isSelected];
}

class SizesSelectedState extends SizesToggleBtnState {
  final List<bool> isSelected;
  final String selectedSize;

  const SizesSelectedState(this.isSelected, this.selectedSize);
  @override
  List<Object> get props => [isSelected, selectedSize];
}

class SizesUnSelectedState extends SizesToggleBtnState {}
