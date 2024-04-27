import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';

class ReviewsRepoImpl implements ReviewsRepo {
  ReviewsRepoImpl({
    required this.remoteReviews,
  });

  final RemoteReviews remoteReviews;

  @override
  Future<Either<Failure, List<ReviewEntity>>> getAllReviews({
    required String productID,
  }) async {
    try {
      final review = await remoteReviews.getAllReviews(productID: productID);
      return Right(review);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> setReview({
    required ReviewEntity review,
  }) async {
    try {
      final isAdded = await remoteReviews.setReview(
        review: ReviewModel(
          productID: review.productID,
          userID: review.userID,
          userImg: review.userImg,
          userName: review.userName,
        ),
      );
      //log('====>>>>>>>  $allProducts');
      return Right(isAdded);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
