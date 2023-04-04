import 'package:equatable/equatable.dart';

class FakeCategoryEntity extends Equatable {
  final String? id;
  final String? type;
  final String? collection;
  final String? name;
  final String? imageURL;
  bool? isCheked;

  FakeCategoryEntity({
    this.id,
    this.type,
    this.collection,
    this.name,
    this.imageURL,
    this.isCheked,
  });

  @override
  List<Object?> get props => [
        id,
        type,
        collection,
        name,
        imageURL,
        isCheked,
      ];
}
