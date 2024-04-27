import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';

class GetNewAndSaleProducts {
  final ProductRepo productRepo;
  GetNewAndSaleProducts(this.productRepo);

  Future<Either<Failure, List<ProductEntity>>> getNewAndSaleProducts() async {
    return await productRepo.getNewAndSaleProducts();
  }
}
