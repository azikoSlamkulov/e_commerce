// import 'package:dartz/dartz.dart';
// import 'package:e_commerce/lib.dart';
// import 'package:equatable/equatable.dart';

// class GetProductReviews
//     extends UseCase<List<ProductReviewEntity>, GetProductReviewsParams> {
//   final ProductRatingAndReviewsRepo productRatingAndReviewsRepo;
//   GetProductReviews(this.productRatingAndReviewsRepo);

//   @override
//   Future<Either<Failure, List<ProductReviewEntity>>> call(
//       GetProductReviewsParams params) async {
//     return await productRatingAndReviewsRepo.getProductReviews(
//       productId: params.productId,
//     );
//   }
// }

// class GetProductReviewsParams extends Equatable {
//   final String productId;
//   const GetProductReviewsParams({
//     required this.productId,
//   });

//   @override
//   List<Object?> get props => [
//         productId,
//       ];
// }
