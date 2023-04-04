import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/brand_entity.dart';
import '../../domain/repositories/brand_repo.dart';
import '../data_source/remote/remote_brands.dart';

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
