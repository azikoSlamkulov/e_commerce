import 'package:dartz/dartz.dart';
import 'package:e_commerce/lib.dart';
import 'package:equatable/equatable.dart';

class SetReview extends UseCase<bool, SetReviewParams> {
  final ReviewsRepo reviewsRepo;
  SetReview(this.reviewsRepo);

  @override
  Future<Either<Failure, bool>> call(SetReviewParams params) async {
    return await reviewsRepo.setReview(review: params.review);
  }
}

class SetReviewParams extends Equatable {
  final ReviewEntity review;
  const SetReviewParams({required this.review});

  @override
  List<Object?> get props => [
        review,
      ];
}
