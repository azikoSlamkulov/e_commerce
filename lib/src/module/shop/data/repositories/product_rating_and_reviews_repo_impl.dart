// import 'package:dartz/dartz.dart';
// import 'package:e_commerce/lib.dart';

// class ProductRatingAndReviewsRepoImpl implements ProductRatingAndReviewsRepo {
//   ProductRatingAndReviewsRepoImpl({
//     required this.remoteRatingAndReviews,
//   });

//   final RemoteProductRatingAndReviews remoteRatingAndReviews;

//   @override
//   Future<Either<Failure, ProductRatingAndReviewsEntity>> getRatingAndReviews({
//     required String productId,
//   }) async {
//     try {
//       // final remoteRating = await remoteRatingAndReviews.getProductRating(
//       //   productID: productID,
//       // );
//       // final allRemoteReviews = await remoteRatingAndReviews.getProductReviews(
//       //   productID: productID,
//       // );
//       // final allRatingAndreviews = ProductRatingAndReviewsEntity(
//       //   productId: productID,
//       //   rating: remoteRating,
//       //   reviews: allRemoteReviews,
//       // );
//       final allRatingAndreviews =
//           await remoteRatingAndReviews.getRatingAndReviews(
//         productID: productId,
//       );
//       return Right(allRatingAndreviews);
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   @override
//   Future<Either<Failure, bool>> setRatingAndReviews({
//     required String productId,
//     required int rating,
//     required ProductReviewEntity review,
//   }) async {
//     try {
//       final isRatingAdded = await remoteRatingAndReviews.setProductRating(
//         productId: productId,
//         newRating: rating,
//       );
//       final isReviewAdded = await remoteRatingAndReviews.setProductReviews(
//         productId: productId,
//         review: ProductReviewModel(
//           reviewId: review.reviewId,
//           productId: review.productId,
//           userId: review.userId,
//           rate: review.rate,
//           reviewText: review.reviewText,
//           userPhotoUrl: review.userPhotoUrl,
//           userName: review.userName,
//           imgUrlList: review.imgUrlList,
//           createdDate: review.createdDate,
//         ),
//       );
//       final bool isAdded;
//       if (isRatingAdded || isReviewAdded) {
//         isAdded = true;
//       } else {
//         isAdded = false;
//       }
//       // final isAdded = await remoteRatingAndReviews.setRatingAndReviews(
//       //   productId: productId,
//       //   rating: rating,
//       //   review: ProductReviewModel(
//       //     reviewId: review.reviewId,
//       //     productId: review.productId,
//       //     userId: review.userId,
//       //     rate: review.rate,
//       //     reviewText: review.reviewText,
//       //     userPhotoUrl: review.userPhotoUrl,
//       //     userName: review.userName,
//       //     imgUrlList: review.imgUrlList,
//       //     createdDate: review.createdDate,
//       //   ),
//       // );
//       //log('====>>>>>>>  $allProducts');
//       return Right(isAdded);
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   @override
//   Future<Either<Failure, ProductRatingEntity>> getProductRating({
//     required String productId,
//   }) async {
//     try {
//       final productRating = await remoteRatingAndReviews.getProductRating(
//         productID: productId,
//       );
//       return Right(productRating);
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   @override
//   Future<Either<Failure, List<ProductReviewEntity>>> getProductReviews({
//     required String productId,
//   }) async {
//     try {
//       final allReviews = await remoteRatingAndReviews.getProductReviews(
//         productID: productId,
//       );
//       return Right(allReviews);
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   @override
//   Future<Either<Failure, bool>> setProductRating({
//     required String productId,
//     required int rating,
//   }) async {
//     try {
//       final isAdded = await remoteRatingAndReviews.setProductRating(
//         productId: productId,
//         newRating: rating,
//       );
//       //log('====>>>>>>>  $allProducts');
//       return Right(isAdded);
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   @override
//   Future<Either<Failure, bool>> setProductReviews({
//     required String productId,
//     required ProductReviewEntity review,
//   }) async {
//     try {
//       final isAdded = await remoteRatingAndReviews.setProductReviews(
//         productId: productId,
//         review: ProductReviewModel(
//           reviewId: review.reviewId,
//           productId: review.productId,
//           userId: review.userId,
//           rate: review.rate,
//           reviewText: review.reviewText,
//           userPhotoUrl: review.userPhotoUrl,
//           userName: review.userName,
//           imgUrlList: review.imgUrlList,
//           createdDate: review.createdDate,
//         ),
//       );
//       //log('====>>>>>>>  $allProducts');
//       return Right(isAdded);
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }
// }
