import 'package:e_commerce/lib.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reviews_event.dart';
part 'reviews_state.dart';

class ReviewsBloc extends Bloc<ReviewsEvent, ReviewsState> {
  final GetAllReviews getAllReviews;
  final SetReview setReview;
  ReviewsBloc({
    required this.getAllReviews,
    required this.setReview,
  }) : super(LoadingReviewsState()) {
    on<GetAllReviewsEvent>(_getAllReviews);
    on<SetReviewEvent>(_addReview);
  }

  void _getAllReviews(
      GetAllReviewsEvent event, Emitter<ReviewsState> emit) async {
    final allReviews = await getAllReviews.call(
      GetAllReviewsParams(
        productID: event.productID!,
      ),
    );
    allReviews.fold(
      (error) => emit(const ReviewsFailureState('')),
      (allReviews) => emit(LoadedReviewsState(allReviews)),
    );
  }

  void _addReview(SetReviewEvent event, Emitter<ReviewsState> emit) async {
    final isAdded = await setReview.call(
      SetReviewParams(
        review: event.review,
      ),
    );
    isAdded.fold(
      (error) => emit(const ReviewsFailureState('')),
      (isAdded) => emit(AddedReviewState(isAdded)),
    );
  }
}
