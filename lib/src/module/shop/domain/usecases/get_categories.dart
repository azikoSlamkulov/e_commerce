import 'package:dartz/dartz.dart';
import 'package:e_commerce/src/core/error/failure.dart';
import 'package:e_commerce/src/core/usecases/usecase.dart';
import 'package:e_commerce/src/module/shop/domain/entities/category_entity.dart';
import 'package:e_commerce/src/module/shop/domain/repositories/categories_repo.dart';
import 'package:equatable/equatable.dart';

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
  const GetCategoriesParams({
    required this.type,
    required this.collection,
  });

  @override
  List<Object?> get props => [
        type,
        collection,
      ];
}
