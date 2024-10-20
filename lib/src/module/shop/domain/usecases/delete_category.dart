import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/domain/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/categories_repo.dart';

class DaleteCategory extends UseCase<bool, DeleteCategoryParams> {
  final CategoriesRepo categoriesRepo;
  DaleteCategory(this.categoriesRepo);

  @override
  Future<Either<Failure, bool>> call(DeleteCategoryParams params) async {
    return await categoriesRepo.deleteCategory(id: params.id);
  }
}

class DeleteCategoryParams extends Equatable {
  final String id;
  const DeleteCategoryParams({required this.id});

  @override
  List<Object?> get props => [
        id,
      ];
}
