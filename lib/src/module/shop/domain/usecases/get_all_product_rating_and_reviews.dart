import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';
import 'package:equatable/equatable.dart';

class GetProductRatingAndReviews extends UseCase<ProductRatingAndReviewsEntity,
    GetProductRatingAndReviewsParams> {
  final ProductRepo productRepo;
  GetProductRatingAndReviews(this.productRepo);

  @override
  Future<Either<Failure, ProductRatingAndReviewsEntity>> call(
      GetProductRatingAndReviewsParams params) async {
    return await productRepo.getRatingAndReviews(
      productId: params.productID,
    );
  }
}

class GetProductRatingAndReviewsParams extends Equatable {
  final String productID;
  const GetProductRatingAndReviewsParams({
    required this.productID,
  });

  @override
  List<Object?> get props => [
        productID,
      ];
}
