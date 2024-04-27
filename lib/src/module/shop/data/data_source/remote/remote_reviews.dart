import 'package:e_commerce/lib.dart';

abstract class RemoteReviews {
  Future<List<ReviewModel>> getAllReviews({required String productID});
  Future<bool> setReview({required ReviewModel review});
}

class RemoteReviewsImpl implements RemoteReviews {
  final FirestoreCore firestore;
  //final FakeData fakeData;

  RemoteReviewsImpl({
    required this.firestore,
  });

  @override
  Future<List<ReviewModel>> getAllReviews({required String productID}) async {
    return await firestore.getListFromCollectionByProductID(
      firstCollection: 'products',
      secondCollection: 'reviews',
      productID: productID,
      fromJson: reviewsFromJson,
    );
  }

  @override
  Future<bool> setReview({required ReviewModel review}) async {
    return await firestore.setReview(
      objectModel: review,
      //collectionName: 'reviews',
    );
  }
}
