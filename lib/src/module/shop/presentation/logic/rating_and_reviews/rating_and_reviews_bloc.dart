import 'dart:developer';

import 'package:e_commerce/lib.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'raying_and_reviews_event.dart';
part 'rating_and_reviews_state.dart';

class RatingAndReviewsBloc
    extends Bloc<RatingAndReviewsEvent, RatingAndReviewsState> {
  final GetProductRatingAndReviews getAllRatingAndReviews;
  final SetProductRatingAndReviews setRatingAndReviews;
  // final GetProductRating getProductRating;
  // final SetProductRating setProductRating;
  // final GetProductReviews getProductReviews;
  // final SetProductReview setProductReviews;
  RatingAndReviewsBloc({
    required this.getAllRatingAndReviews,
    required this.setRatingAndReviews,
    // required this.getProductRating,
    // required this.setProductRating,
    // required this.getProductReviews,
    // required this.setProductReviews,
  }) : super(InitialRatingAndReviewsState()) {
    on<GetRatingAndReviewsEvent>(_getAllRatingAndReviews);
    on<SetRatingAndReviewsEvent>(_setRatingAndReviews);
    // on<GetProductRatingEvent>(_getProductRating);
    // on<SetProductRatingEvent>(_setProductRating);
    // on<GetProductReviewsEvent>(_getProductReviews);
    // on<SetProductReviewEvent>(_setProductReview);
  }

  void _getAllRatingAndReviews(GetRatingAndReviewsEvent event,
      Emitter<RatingAndReviewsState> emit) async {
    emit(LoadingRatingAndReviewsState());
    final allRatingAndReviews = await getAllRatingAndReviews.call(
      GetProductRatingAndReviewsParams(
        productID: event.productID,
        //userID: event.userID,
      ),
    );
    allRatingAndReviews.fold(
      (error) => emit(const RatingAndReviewsFailureState('')),
      (allReviews) => emit(LoadedRatingAndReviewsState(allReviews)),
    );
  }

  void _setRatingAndReviews(SetRatingAndReviewsEvent event,
      Emitter<RatingAndReviewsState> emit) async {
    emit(LoadingRatingAndReviewsState());
    final isAdded = await setRatingAndReviews.call(
      SetProductRatingAndReviewsParams(
        productId: event.productId,
        rating: event.rating,
        reviews: event.review,
      ),
    );
    isAdded.fold(
      (error) => emit(const RatingAndReviewsFailureState('')),
      (isAdded) => emit(AddedReviewState(isAdded)),
    );
  }

  // void _getProductRating(
  //     GetProductRatingEvent event, Emitter<RatingAndReviewsState> emit) async {
  //   final productRating = await getProductRating.call(
  //     GetProductRatingParams(
  //       productId: event.productId,
  //       //userID: event.userID,
  //     ),
  //   );
  //   productRating.fold(
  //     (error) => emit(const RatingAndReviewsFailureState('')),
  //     (rating) => emit(LoadedProductRatingState(rating)),
  //   );
  // }

  // void _setProductRating(
  //     SetProductRatingEvent event, Emitter<RatingAndReviewsState> emit) async {
  //   emit(LoadingRatingAndReviewsState());
  //   final isAdded = await setProductRating.call(
  //     SetProductRatingParams(
  //       productId: event.productId,
  //       rating: event.rating,
  //     ),
  //   );
  //   isAdded.fold(
  //     (error) => emit(const RatingAndReviewsFailureState('')),
  //     (isAdded) => emit(AddedReviewState(isAdded)),
  //   );
  // }

  // void _getProductReviews(
  //     GetProductReviewsEvent event, Emitter<RatingAndReviewsState> emit) async {
  //   final productReviews = await getProductReviews.call(
  //     GetProductReviewsParams(
  //       productId: event.productId,
  //       //userID: event.userID,
  //     ),
  //   );
  //   productReviews.fold(
  //     (error) => emit(const RatingAndReviewsFailureState('')),
  //     (reviews) => emit(LoadedProductReviewsState(reviews)),
  //   );
  // }

  // void _setProductReview(
  //     SetProductReviewEvent event, Emitter<RatingAndReviewsState> emit) async {
  //   emit(LoadingRatingAndReviewsState());
  //   final isAdded = await setProductReviews.call(
  //     SetProductReviewParams(
  //       productId: event.productId,
  //       review: event.review,
  //     ),
  //   );
  //   isAdded.fold(
  //     (error) => emit(const RatingAndReviewsFailureState('')),
  //     (isAdded) => emit(AddedReviewState(isAdded)),
  //   );
  // }
}
