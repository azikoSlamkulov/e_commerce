import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';

class BrandsRepoImpl implements BrandsRepo {
  BrandsRepoImpl({
    required this.remoteBrands,
  });

  final RemoteBrands remoteBrands;

  @override
  Future<Either<Failure, List<BrandEntity>>> getAllBrands() async {
    try {
      final allBrands = await remoteBrands.getAllBrands();
      return Right(allBrands);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> addBrand({required String brandName}) async {
    try {
      final brandID = await remoteBrands.getBrandID();
      final isCreated =
          await remoteBrands.addBrand(brandName: brandName, id: brandID);
      return Right(isCreated);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteBrand({
    required String id,
  }) async {
    try {
      final isDelete = await remoteBrands.deleteBrand(
        id: id,
      );
      return Right(isDelete);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
