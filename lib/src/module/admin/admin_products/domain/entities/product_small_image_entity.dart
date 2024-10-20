import 'package:equatable/equatable.dart';

class ProductSmallImageEntity extends Equatable {
  final String? imageUrl;
  final String? imageName;

  const ProductSmallImageEntity({
    this.imageUrl,
    this.imageName,
  });

  @override
  List<Object?> get props => [
        imageUrl,
        imageName,
      ];
}
