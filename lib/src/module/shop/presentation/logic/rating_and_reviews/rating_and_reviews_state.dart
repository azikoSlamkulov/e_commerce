part of 'rating_and_reviews_bloc.dart';

abstract class RatingAndReviewsState extends Equatable {
  const RatingAndReviewsState();

  @override
  List<Object> get props => [];
}

class InitialRatingAndReviewsState extends RatingAndReviewsState {}

class LoadingRatingAndReviewsState extends RatingAndReviewsState {}

class LoadedRatingAndReviewsState extends RatingAndReviewsState {
  final ProductRatingAndReviewsEntity ratingAndReviews;
  const LoadedRatingAndReviewsState(this.ratingAndReviews);
  @override
  List<Object> get props => [ratingAndReviews];
}

class LoadedProductRatingState extends RatingAndReviewsState {
  final ProductRatingEntity productating;
  const LoadedProductRatingState(this.productating);
  @override
  List<Object> get props => [productating];
}

class LoadedProductReviewsState extends RatingAndReviewsState {
  final List<ProductReviewEntity> productReviews;
  const LoadedProductReviewsState(this.productReviews);
  @override
  List<Object> get props => [productReviews];
}

class AddedReviewState extends RatingAndReviewsState {
  final bool isAdded;
  const AddedReviewState(this.isAdded);
  @override
  List<Object> get props => [isAdded];
}

class RatingAndReviewsFailureState extends RatingAndReviewsState {
  final String message;
  const RatingAndReviewsFailureState(this.message);
  @override
  List<Object> get props => [message];
}
