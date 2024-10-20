// import 'package:dartz/dartz.dart';
// import 'package:e_commerce/lib.dart';
// import 'package:equatable/equatable.dart';

// class SetProductRating extends UseCase<bool, SetProductRatingParams> {
//   final ProductRatingAndReviewsRepo ratingAndReviewsRepo;
//   SetProductRating(this.ratingAndReviewsRepo);

//   @override
//   Future<Either<Failure, bool>> call(SetProductRatingParams params) async {
//     return await ratingAndReviewsRepo.setProductRating(
//       productId: params.productId,
//       rating: params.rating,
//     );
//   }
// }

// class SetProductRatingParams extends Equatable {
//   final String productId;
//   final int rating;
//   const SetProductRatingParams({
//     required this.productId,
//     required this.rating,
//   });

//   @override
//   List<Object?> get props => [
//         productId,
//         rating,
//       ];
// }
