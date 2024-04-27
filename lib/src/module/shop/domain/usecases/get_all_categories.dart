import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';

class GetAllCategories {
  final CategoriesRepo categoriesRepo;
  GetAllCategories(this.categoriesRepo);

  Future<Either<Failure, List<CategoryEntity>>> getAllCategories() async {
    return await categoriesRepo.getAllCategories();
  }
}
