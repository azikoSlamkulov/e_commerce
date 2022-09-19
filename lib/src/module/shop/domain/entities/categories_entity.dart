import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String? categoryID;
  final String? categoryName;
  final String? imageURL;

  const CategoryEntity({
    this.categoryID,
    this.categoryName,
    this.imageURL,
  });

  @override
  List<Object?> get props => [
        categoryID,
        categoryName,
        imageURL,
      ];
}
