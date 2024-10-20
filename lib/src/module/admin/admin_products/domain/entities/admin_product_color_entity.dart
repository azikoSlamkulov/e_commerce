import 'package:e_commerce/src/module/shop/domain/domain.dart';
import 'package:equatable/equatable.dart';

class AdminProductColorEntity extends Equatable {
  final ProductColorEntity? color;
  final List<bool>? isSelectedColorsList;
  final List<bool>? isSelectedSizesList;

  const AdminProductColorEntity({
    this.color,
    this.isSelectedColorsList,
    this.isSelectedSizesList,
  });

  @override
  List<Object?> get props => [
        color,
        isSelectedColorsList,
        isSelectedSizesList,
      ];
}
