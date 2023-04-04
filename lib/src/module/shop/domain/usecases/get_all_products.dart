import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repo.dart';

class GetAllProducts {
  final ProductRepo productRepo;
  GetAllProducts(this.productRepo);

  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    return await productRepo.getAllProducts();
  }
}
