import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';

abstract class ReviewsRepo {
  Future<Either<Failure, List<ReviewEntity>>> getAllReviews({
    required String productID,
  });

  Future<Either<Failure, bool>> setReview({
    required ReviewEntity review,
  });
}
