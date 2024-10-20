// import 'package:dartz/dartz.dart';
// import 'package:e_commerce/lib.dart';
// import 'package:equatable/equatable.dart';

// class SetProductReview extends UseCase<bool, SetProductReviewParams> {
//   final ProductRatingAndReviewsRepo ratingAndReviewsRepo;
//   SetProductReview(this.ratingAndReviewsRepo);

//   @override
//   Future<Either<Failure, bool>> call(SetProductReviewParams params) async {
//     return await ratingAndReviewsRepo.setProductReviews(
//       productId: params.productId,
//       review: params.review,
//     );
//   }
// }

// class SetProductReviewParams extends Equatable {
//   final String productId;
//   final ProductReviewEntity review;
//   const SetProductReviewParams({
//     required this.productId,
//     required this.review,
//   });

//   @override
//   List<Object?> get props => [
//         productId,
//         review,
//       ];
// }
