import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String? id;
  final String? typeName;
  final String? collectionName;
  final String? categoryName;

  const CategoryEntity({
    this.id,
    this.typeName,
    this.collectionName,
    this.categoryName,
  });

  @override
  List<Object?> get props => [
        id,
        typeName,
        collectionName,
        categoryName,
      ];
}
