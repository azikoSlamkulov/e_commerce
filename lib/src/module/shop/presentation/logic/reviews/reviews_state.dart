part of 'reviews_bloc.dart';

abstract class ReviewsState extends Equatable {
  const ReviewsState();

  @override
  List<Object> get props => [];
}

class LoadingReviewsState extends ReviewsState {}

class LoadedReviewsState extends ReviewsState {
  final List<ReviewEntity> allReviews;
  const LoadedReviewsState(this.allReviews);
  @override
  List<Object> get props => [allReviews];
}

class AddedReviewState extends ReviewsState {
  final bool isAdded;
  const AddedReviewState(this.isAdded);
  @override
  List<Object> get props => [isAdded];
}

class ReviewsFailureState extends ReviewsState {
  final String message;
  const ReviewsFailureState(this.message);
  @override
  List<Object> get props => [message];
}
