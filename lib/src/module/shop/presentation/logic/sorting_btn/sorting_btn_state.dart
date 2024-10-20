part of 'sorting_btn_cubit.dart';

final class SortingState {
  final String choice;
  final List<bool> isSelected;
  final List<ProductEntity>? sortedProducts;
  const SortingState({
    required this.choice,
    required this.isSelected,
    this.sortedProducts,
  });
}
