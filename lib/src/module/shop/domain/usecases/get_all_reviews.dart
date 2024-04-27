import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';
import 'package:equatable/equatable.dart';

class GetAllReviews extends UseCase<List<ReviewEntity>, GetAllReviewsParams> {
  final ReviewsRepo reviewsRepo;
  GetAllReviews(this.reviewsRepo);

  @override
  Future<Either<Failure, List<ReviewEntity>>> call(
      GetAllReviewsParams params) async {
    return await reviewsRepo.getAllReviews(productID: params.productID);
  }
}

class GetAllReviewsParams extends Equatable {
  final String productID;
  const GetAllReviewsParams({required this.productID});

  @override
  List<Object?> get props => [
        productID,
      ];
}
