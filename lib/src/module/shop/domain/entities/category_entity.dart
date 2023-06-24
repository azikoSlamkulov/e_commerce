import 'package:e_commerce/lib.dart';

class CategoryEntity extends Equatable {
  final String? id;
  final String? type;
  final String? collectionName;
  final String? categoryName;
  final String? imageURL;
  bool? isCheked;

  CategoryEntity({
    this.id,
    this.type,
    this.collectionName,
    this.categoryName,
    this.imageURL,
    this.isCheked,
  });

  @override
  List<Object?> get props => [
        id,
        type,
        collectionName,
        categoryName,
        imageURL,
        isCheked,
      ];
}
