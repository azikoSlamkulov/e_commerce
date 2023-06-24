import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';

class GetAllProducts {
  final ProductRepo productRepo;
  GetAllProducts(this.productRepo);

  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    return await productRepo.getAllProducts();
  }
}
