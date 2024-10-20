import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/core.dart';
import '../repositories/product_image_repo.dart';

class GetAllProductBigImages
    extends UseCase<List<String>, GetAllProductBigImagesParams> {
  final ProductImageRepo productImageRepo;
  GetAllProductBigImages(this.productImageRepo);

  @override
  Future<Either<Failure, List<String>>> call(
      GetAllProductBigImagesParams params) async {
    return await productImageRepo.getAllProductBigImages(
        folderName: params.folderName);
  }
}

class GetAllProductBigImagesParams extends Equatable {
  final String folderName;
  const GetAllProductBigImagesParams({required this.folderName});

  @override
  List<Object?> get props => [
        folderName,
      ];
}
