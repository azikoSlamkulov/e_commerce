import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';

class GetAllCategories
    extends UseCase<List<CategoryEntity>, GetAllCategoriesParams> {
  final CategoriesRepo categoriesRepo;
  GetAllCategories(this.categoriesRepo);

  @override
  Future<Either<Failure, List<CategoryEntity>>> call(
      GetAllCategoriesParams params) async {
    return await categoriesRepo.getCategories(
      type: params.type,
      collection: params.collection,
    );
  }
}

class GetAllCategoriesParams extends Equatable {
  final String type;
  final String collection;
  const GetAllCategoriesParams({
    required this.type,
    required this.collection,
  });

  @override
  List<Object?> get props => [
        type,
        collection,
      ];
}
