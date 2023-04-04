import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String? id;
  final String? type;
  final String? collection;
  final String? category;
  final String? imageURL;
  bool? isCheked;

  CategoryEntity({
    this.id,
    this.type,
    this.collection,
    this.category,
    this.imageURL,
    this.isCheked,
  });

  @override
  List<Object?> get props => [
        id,
        type,
        collection,
        category,
        imageURL,
        isCheked,
      ];
}
