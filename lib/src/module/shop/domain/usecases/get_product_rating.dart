// import 'package:dartz/dartz.dart';
// import 'package:e_commerce/lib.dart';
// import 'package:equatable/equatable.dart';

// class GetProductRating
//     extends UseCase<ProductRatingEntity, GetProductRatingParams> {
//   final ProductRatingAndReviewsRepo productRatingAndReviewsRepo;
//   GetProductRating(this.productRatingAndReviewsRepo);

//   @override
//   Future<Either<Failure, ProductRatingEntity>> call(
//       GetProductRatingParams params) async {
//     return await productRatingAndReviewsRepo.getProductRating(
//       productId: params.productId,
//     );
//   }
// }

// class GetProductRatingParams extends Equatable {
//   final String productId;
//   const GetProductRatingParams({
//     required this.productId,
//   });

//   @override
//   List<Object?> get props => [
//         productId,
//       ];
// }
