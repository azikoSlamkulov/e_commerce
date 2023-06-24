import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';

// import '../../../../core/error/failure.dart';
// import '../entities/brand_entity.dart';

abstract class BrandsRepo {
  Future<Either<Failure, List<BrandEntity>>> getAllBrands();
}
