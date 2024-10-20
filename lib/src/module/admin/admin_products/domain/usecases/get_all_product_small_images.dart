import 'package:dartz/dartz.dart';
import 'package:e_commerce/src/core/domain/error/failure.dart';

import '../domain.dart';

class GetAllProductSmallImages {
  final ProductImageRepo productImageRepo;
  GetAllProductSmallImages(this.productImageRepo);

  Future<Either<Failure, List<ProductSmallImageEntity>>>
      getAllProductSmallImages() async {
    return await productImageRepo.getAllProductSmallImages();
  }
}
