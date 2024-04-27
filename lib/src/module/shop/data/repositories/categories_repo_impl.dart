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

  @override
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories() async {
    try {
      final allCategories = await remoteCategories.getAllCategories();
      return Right(allCategories);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> addCategory({
    required String type,
    required String collection,
    required String category,
  }) async {
    try {
      final categorytID = await remoteCategories.getCategoryID();
      final isCreated = await remoteCategories.addCategory(
        id: categorytID,
        typeName: type,
        collectionName: collection,
        categoryName: category,
      );
      return Right(isCreated);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteCategory({
    required String id,
  }) async {
    try {
      final isDelete = await remoteCategories.deleteCategory(
        id: id,
      );
      return Right(isDelete);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
