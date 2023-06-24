import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';

class CategoriesRepoImpl implements CategoriesRepo {
  CategoriesRepoImpl({
    required this.remoteCategories,
  });

  final RemoteCategories remoteCategories;

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories({
    required String type,
    required String collection,
  }) async {
    try {
      final allCategories = await remoteCategories.getCategories(
        type: type,
        collection: collection,
      );
      return Right(allCategories);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
