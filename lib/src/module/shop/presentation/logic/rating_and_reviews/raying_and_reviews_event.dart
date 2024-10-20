part of 'rating_and_reviews_bloc.dart';

abstract class RatingAndReviewsEvent extends Equatable {
  const RatingAndReviewsEvent();

  @override
  List<Object> get props => [];
}

class GetRatingAndReviewsEvent extends RatingAndReviewsEvent {
  final String productID;
  const GetRatingAndReviewsEvent({
    required this.productID,
  });
}

class GetProductRatingEvent extends RatingAndReviewsEvent {
  final String productId;
  const GetProductRatingEvent({
    required this.productId,
  });
}

class GetProductReviewsEvent extends RatingAndReviewsEvent {
  final String productId;
  const GetProductReviewsEvent({
    required this.productId,
  });
}

class SetProductRatingEvent extends RatingAndReviewsEvent {
  final String productId;
  final int rating;
  const SetProductRatingEvent({
    required this.productId,
    required this.rating,
  });
}

class SetProductReviewEvent extends RatingAndReviewsEvent {
  final String productId;
  final ProductReviewEntity review;
  const SetProductReviewEvent({
    required this.productId,
    required this.review,
  });
}

class SetRatingAndReviewsEvent extends RatingAndReviewsEvent {
  final String productId;
  final int rating;
  final ProductReviewEntity review;

  const SetRatingAndReviewsEvent({
    required this.productId,
    required this.rating,
    required this.review,
  });
}
