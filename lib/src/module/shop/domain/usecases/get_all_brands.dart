import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/brand_entity.dart';
import '../repositories/brand_repo.dart';

class GetAllBrands {
  final BrandsRepo brandRepo;
  GetAllBrands(this.brandRepo);

  Future<Either<Failure, List<BrandEntity>>> getAllBrands() async {
    return await brandRepo.getAllBrands();
  }
}
