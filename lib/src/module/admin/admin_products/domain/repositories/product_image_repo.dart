import 'package:dartz/dartz.dart';

import '../../../../../core/domain/error/failure.dart';
import '../domain.dart';

abstract class ProductImageRepo {
  Future<Either<Failure, List<ProductSmallImageEntity>>>
      getAllProductSmallImages();
  Future<Either<Failure, List<String>>> getAllProductBigImages(
      {required String folderName});

  Future<Either<Failure, String>> setProductImage({
    required String filePath,
    required String fileName,
  });
}
