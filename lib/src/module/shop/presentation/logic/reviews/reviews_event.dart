part of 'reviews_bloc.dart';

abstract class ReviewsEvent extends Equatable {
  const ReviewsEvent();

  @override
  List<Object> get props => [];
}

class GetAllReviewsEvent extends ReviewsEvent {
  final String? productID;
  const GetAllReviewsEvent({required this.productID});
}

class SetReviewEvent extends ReviewsEvent {
  final ReviewEntity review;

  const SetReviewEvent({
    required this.review,
  });
}
