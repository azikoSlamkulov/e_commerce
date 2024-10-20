import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';
import 'package:equatable/equatable.dart';

class SetProductRatingAndReviews
    extends UseCase<bool, SetProductRatingAndReviewsParams> {
  final ProductRepo rroductRepo;
  SetProductRatingAndReviews(this.rroductRepo);

  @override
  Future<Either<Failure, bool>> call(
      SetProductRatingAndReviewsParams params) async {
    return await rroductRepo.setRatingAndReviews(
      productId: params.productId,
      rating: params.rating,
      review: params.reviews,
    );
  }
}

class SetProductRatingAndReviewsParams extends Equatable {
  final String productId;
  final int rating;
  final ProductReviewEntity reviews;
  const SetProductRatingAndReviewsParams({
    required this.productId,
    required this.rating,
    required this.reviews,
  });

  @override
  List<Object?> get props => [
        productId,
        rating,
        reviews,
      ];
}
