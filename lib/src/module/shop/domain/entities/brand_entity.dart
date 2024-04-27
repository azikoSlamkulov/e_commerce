import 'package:equatable/equatable.dart';

class BrandEntity extends Equatable {
  final String? id;
  final String? name;
  bool? isCheked;

  BrandEntity({
    this.id,
    this.name,
    this.isCheked,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        isCheked,
      ];
}
