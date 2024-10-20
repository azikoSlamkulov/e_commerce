import 'package:equatable/equatable.dart';

import '../domain.dart';

class ProductColorEntity extends Equatable {
  final String? color;
  //final List<dynamic>? sizes;
  final SizeEntity? colorSizes;
  final List<String>? colorImages;

  const ProductColorEntity({
    this.color,
    this.colorSizes,
    this.colorImages,
  });

  @override
  List<Object?> get props => [
        color,
        colorSizes,
        colorImages,
      ];
}
