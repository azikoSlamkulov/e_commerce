import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';

class GetAllBrands {
  final BrandsRepo brandRepo;
  GetAllBrands(this.brandRepo);

  Future<Either<Failure, List<BrandEntity>>> getAllBrands() async {
    return await brandRepo.getAllBrands();
  }
}
