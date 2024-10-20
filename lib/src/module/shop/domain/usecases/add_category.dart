import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/domain/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/categories_repo.dart';

class AddCategory extends UseCase<bool, SetCategoryParams> {
  final CategoriesRepo categoriesRepo;
  AddCategory(this.categoriesRepo);

  @override
  Future<Either<Failure, bool>> call(SetCategoryParams params) async {
    return await categoriesRepo.addCategory(
      type: params.typeName,
      collection: params.collectionName,
      category: params.categoryName,
    );
  }
}

class SetCategoryParams extends Equatable {
  final String typeName;
  final String collectionName;
  final String categoryName;
  const SetCategoryParams({
    required this.typeName,
    required this.collectionName,
    required this.categoryName,
  });

  @override
  List<Object?> get props => [
        id,
        typeName,
        collectionName,
        categoryName,
      ];
}
