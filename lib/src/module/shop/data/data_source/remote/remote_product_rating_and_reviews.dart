// import 'dart:developer';

// import 'package:e_commerce/lib.dart';

// abstract class RemoteProductRatingAndReviews {
//   Future<bool> checkExistsRating({
//     required String productID,
//   });

//   Future<ProductRatingModel> getProductRating({
//     required String productID,
//   });
//   Future<List<ProductReviewModel>> getProductReviews({
//     required String productID,
//   });
//   Future<bool> setProductRating({
//     required String productId,
//     required int newRating,
//   });
//   Future<bool> setProductReviews({
//     required String productId,
//     required ProductReviewModel review,
//   });
//   Future<ProductRatingAndReviewsModel> getRatingAndReviews({
//     required String productID,
//   });
//   Future<bool> setRatingAndReviews({
//     required String productId,
//     required int rating,
//     required ProductReviewModel review,
//   });
// }

// class RemoteProductRatingAndReviewsImpl
//     implements RemoteProductRatingAndReviews {
//   final FirestoreCore firestore;
//   //final FakeData fakeData;

//   RemoteProductRatingAndReviewsImpl({
//     required this.firestore,
//   });

//   @override
//   Future<bool> checkExistsRating({
//     required String productID,
//   }) async {
//     return await firestore.checkDocExistsFromSecondCollection(
//       firstCollectionName: 'products',
//       secondCollectionName: 'productRating',
//       firstDocId: productID,
//       secondDocId: productID,
//     );
//   }

//   @override
//   Future<ProductRatingAndReviewsModel> getRatingAndReviews({
//     required String productID,
//     //required String userID,
//   }) async {
//     final remoteRating = await getProductRating(
//       productID: productID,
//     );
//     final allRemoteReviews = await getProductReviews(
//       productID: productID,
//     );
//     final ratingAndAllReviews = ProductRatingAndReviewsModel(
//       productId: productID,
//       rating: remoteRating,
//       reviews: allRemoteReviews,
//     );
//     return ratingAndAllReviews;
//   }

//   @override
//   Future<bool> setRatingAndReviews({
//     required String productId,
//     required int rating,
//     required ProductReviewModel review,
//   }) async {
//     // final ratingAndReviewsFromFirestore =
//     //     await firestore.getListFromCollectionByProductID(
//     //   firstCollection: 'products',
//     //   secondCollection: 'ratingAndReviews',
//     //   productID: productId,
//     //   fromJson: productRatingAndReviewsFromJson,
//     // );
//     // final ratingAndReviews = FakeLogic().updateRatingAndReviews(
//     //   ratingAndReviews: ,
//     //   productId: productId,
//     //   newRate: rating,
//     //   review: review,
//     // );
//     // return await firestore.setWithTwoCollections(
//     //   objectModel: ratingAndReviews,
//     //   // objectModel: ProductRatingAndReviewsModel(
//     //   //   productId: productId,
//     //   //   rating: ProductRatingModel(
//     //   //     productId: productId,
//     //   //     userId: '',
//     //   //     totalRating: 3.1,
//     //   //     totalUser: 11,
//     //   //     one: 2,
//     //   //     two: 2,
//     //   //     three: 2,
//     //   //     four: 2,
//     //   //     five: 3,
//     //   //   ),
//     //   //   reviews: review,
//     //   // ),
//     //   firstCollectionName: 'products',
//     //   secondCollectionName: 'ratingAndReviews',
//     //   firstDocId: productId,
//     // );
//     //final rating = FakeLogic().getRatingAndReviews(productID).;
//     //return FakeLogic().getRatingAndReviews(productID);
//     final productRatingAdded = await setProductRating(
//       productId: productId,
//       newRating: rating,
//     );
//     final productReviewAdded = await setProductReviews(
//       productId: productId,
//       review: review,
//     );
//     final bool isAdded;
//     if (productRatingAdded || productReviewAdded) {
//       isAdded = true;
//     } else {
//       isAdded = false;
//     }
//     return isAdded;
//   }

//   @override
//   Future<ProductRatingModel> getProductRating(
//       {required String productID}) async {
//     bool isExists = await firestore.checkDocExistsFromSecondCollection(
//       firstDocId: productID,
//       secondDocId: productID,
//       firstCollectionName: 'products',
//       secondCollectionName: 'productRating',
//     );
//     if (isExists) {
//       return await firestore.getDocFromSecondCollection(
//         firstCollectionName: 'products',
//         secondCollectionName: 'productRating',
//         firstDocId: productID,
//         secondDocId: productID,
//         fromJson: ratingFromJson,
//       );
//     } else {
//       return ProductRatingModel(
//         productId: productID,
//         userId: '',
//         five: 0,
//         four: 0,
//         three: 0,
//         two: 0,
//         one: 0,
//         totalRating: 0,
//         totalUser: 0,
//       );
//     }
//   }

//   @override
//   Future<List<ProductReviewModel>> getProductReviews(
//       {required String productID}) async {
//     return await firestore.getListFromSecondCollection(
//       firstCollectionName: 'products',
//       secondCollectionName: 'productReviews',
//       firstDocId: productID,
//       fromJson: reviewsFromJson,
//     );
//   }

//   @override
//   Future<bool> setProductRating(
//       {required String productId, required int newRating}) {
//     // TODO: implement setProductRating
//     throw UnimplementedError();
//   }

//   // @override
//   // Future<bool> setProductRating({
//   //   required String productId,
//   //   required int newRating,
//   // }) async {
//   //   final product = await firestore.get(
//   //     docId: productId,
//   //     collectionName: 'products',
//   //     fromJson: productFromJson,
//   //   );

//   //   final productRating = await getProductRating(
//   //     productID: productId,
//   //   );

//   //   final newProductRating = await FakeLogic().updateProductRating(
//   //     productRating: ProductRatingModel(
//   //       productId: productId,
//   //       userId: productRating.userId,
//   //       five: productRating.five,
//   //       four: productRating.four,
//   //       three: productRating.three,
//   //       two: productRating.two,
//   //       one: productRating.one,
//   //       totalRating: productRating.totalRating,
//   //       totalUser: productRating.totalUser,
//   //     ),
//   //     productId: productId,
//   //     newRate: newRating,
//   //   );
//   //   firestore.update(
//   //     docId: productId,
//   //     objectModel: ProductModel(
//   //       id: product.id,
//   //       category: CategoryEntity(
//   //         id: product.category!.id,
//   //         typeName: product.category!.typeName,
//   //         collectionName: product.category!.collectionName,
//   //         categoryName: product.category!.categoryName,
//   //       ),
//   //       brand: product.brand,
//   //       //sizes: product.sizes,
//   //       price: product.price,
//   //       //quantity: product.quantity,
//   //       //description: product.description,
//   //       totalRating: newProductRating.totalRating,
//   //       totalUser: newProductRating.totalUser,
//   //       // rating: ProductRatingEntity(
//   //       //   totalRating: newProductRating.totalRating,
//   //       //   totalUser: newProductRating.totalUser,
//   //       //   one: 13,
//   //       //   two: 4,
//   //       //   three: 2,
//   //       //   four: 3,
//   //       //   five: 4,
//   //       // ),
//   //       mainImgUrl: product.mainImgUrl,
//   //       //imgUrlList: product.imgUrlList,
//   //     ),
//   //     collectionName: 'products',
//   //   );
//   //   return await firestore.setTwoCollections(
//   //     firstCollectionName: 'products',
//   //     secondCollectionName: 'productRating',
//   //     firstDocId: productId,
//   //     secondDocId: productId,
//   //     objectModel: newProductRating,
//   //   );
//   // }

//   @override
//   Future<bool> setProductReviews({
//     required String productId,
//     required ProductReviewModel review,
//   }) async {
//     return await firestore.setTwoCollections(
//       firstCollectionName: 'products',
//       secondCollectionName: 'productReviews',
//       firstDocId: productId,
//       objectModel: review,
//     );
//   }
// }
