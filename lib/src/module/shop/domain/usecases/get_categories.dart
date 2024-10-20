import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/domain/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/category_entity.dart';
import '../repositories/categories_repo.dart';

// class GetAllCategories {
//   final CategoriesRepo categoriesRepo;
//   GetAllCategories(this.categoriesRepo);

//   Future<Either<Failure, List<CategoriesEntity>>> getAllCategories() async {
//     return await categoriesRepo.getAllCategories();
//   }
// }

class GetCategories extends UseCase<List<CategoryEntity>, GetCategoriesParams> {
  final CategoriesRepo categoriesRepo;
  GetCategories(this.categoriesRepo);

  @override
  Future<Either<Failure, List<CategoryEntity>>> call(
      GetCategoriesParams params) async {
    return await categoriesRepo.getCategories(
      type: params.type,
      collection: params.collection,
    );
  }
}

class GetCategoriesParams extends Equatable {
  final String type;
  final String collection;
  const GetCategoriesParams({required this.type, required this.collection});

  @override
  List<Object?> get props => [
        type,
        collection,
      ];
}
