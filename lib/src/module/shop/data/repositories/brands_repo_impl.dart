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
}
