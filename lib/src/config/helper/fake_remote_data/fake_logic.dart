import 'dart:developer';

import 'package:e_commerce/src/module/shop/domain/entities/entities.dart';

import '../../../module/auth/auth.dart';
import '../../../module/profile/data/model/model.dart';
import '../../../module/shop/data/model/model.dart';
import 'fake_remote_data.dart';

class FakeLogic {
  //List<ProductModel> allFakeProducts = FakeProductData().fakeProducts;
  List<ProductRatingAndReviewsModel> allFakeRatingAndReviews =
      FakeProductRatingAndReviewsData().allFakeRatingAndReviews;

  ProductDatailModel getProductWithNewRatingAndReviews(
    ProductDatailModel product,
    ProductReviewModel? newReview,
    int newRate,
  ) {
    List<ProductReviewModel>? reviewsList =
        product.reviews as List<ProductReviewModel>;
    if (newReview != const ProductReviewModel()) {
      reviewsList.add(newReview!);
    }

    ProductRatingModel newRating = getNewRating(
        product.rating! as ProductRatingModel, newRate, product.id!);

    return ProductDatailModel(
      id: product.id,
      category: product.category,
      brand: product.brand,
      color: product.color,
      sizes: product.sizes,
      isNew: product.isNew,
      isSale: product.isSale,
      sale: product.sale,
      price: product.price,
      newPrice: product.newPrice,
      description: product.description,
      rating: newRating,
      totalRating: newRating.totalRating,
      totalUser: newRating.totalUser,
      reviews: reviewsList,
      mainImgUrl: product.mainImgUrl,
      imgUrlList: product.imgUrlList,
    );
  }

  UserModel getUserWithNewReviews(
    UserModel user,
    ProductReviewModel newReview,
  ) {
    List<ProductReviewModel> reviewsList =
        user.reviews as List<ProductReviewModel>;
    if (newReview != ProductReviewModel) {
      reviewsList.add(newReview);
    }

    return UserModel(
      userID: user.userID,
      name: user.name,
      phoneNumber: user.phoneNumber,
      email: user.email,
      orders: user.orders,
      shippingAddresses: user.shippingAddresses,
      paymentMethods: user.paymentMethods,
      //promocodes: entity.promocodes,
      reviews: reviewsList,
      photoURL: user.photoURL,
      role: user.role,
    );
  }

  UserModel selectDefaultPaymentCard({
    required UserModel currentUser,
    required String cardId,
  }) {
    List<PaymentCardModel> paymentCards = [];
    paymentCards = currentUser.paymentMethods as List<PaymentCardModel>;
    for (PaymentCardModel e in paymentCards) {
      e.isCheked = false;
      if (e.id == cardId) {
        e.isCheked = true;
      }
    }
    return UserModel(
      userID: currentUser.userID,
      name: currentUser.name,
      phoneNumber: currentUser.phoneNumber,
      email: currentUser.email,
      orders: currentUser.orders,
      shippingAddresses: currentUser.shippingAddresses,
      paymentMethods: paymentCards,
      //promocodes: currentUser.promocodes,
      reviews: currentUser.reviews,
      photoURL: currentUser.photoURL,
      role: currentUser.role,
    );
  }

  UserModel addNewPaymentCard({
    required UserModel currentUser,
    required PaymentCardModel newCard,
  }) {
    List<PaymentCardModel> paymentCards = [];
    paymentCards = currentUser.paymentMethods as List<PaymentCardModel>;
    for (PaymentCardModel e in paymentCards) {
      if (newCard.isCheked == true) {
        e.isCheked = false;
      }
    }
    paymentCards.add(newCard);

    return UserModel(
      userID: currentUser.userID,
      name: currentUser.name,
      phoneNumber: currentUser.phoneNumber,
      email: currentUser.email,
      orders: currentUser.orders,
      shippingAddresses: currentUser.shippingAddresses,
      paymentMethods: paymentCards,
      //promocodes: currentUser.promocodes,
      reviews: currentUser.reviews,
      photoURL: currentUser.photoURL,
      role: currentUser.role,
    );
  }

  UserModel selectDefaultShippingAddress({
    required UserModel currentUser,
    required String addressId,
  }) {
    List<ShippingAddressModel> addressList = [];
    addressList = currentUser.shippingAddresses as List<ShippingAddressModel>;
    for (ShippingAddressModel e in addressList) {
      e.isCheked = false;
      if (e.id == addressId) {
        e.isCheked = true;
      }
    }
    return UserModel(
      userID: currentUser.userID,
      name: currentUser.name,
      phoneNumber: currentUser.phoneNumber,
      email: currentUser.email,
      orders: currentUser.orders,
      shippingAddresses: addressList,
      paymentMethods: currentUser.paymentMethods,
      //promocodes: currentUser.promocodes,
      reviews: currentUser.reviews,
      photoURL: currentUser.photoURL,
      role: currentUser.role,
    );
  }

  UserModel updateShippingAddress({
    required UserModel currentUser,
    required ShippingAddressModel newAddress,
  }) {
    List<ShippingAddressModel> addressList = [];
    addressList = currentUser.shippingAddresses as List<ShippingAddressModel>;
    for (ShippingAddressModel e in addressList) {
      if (newAddress.isCheked == true) {
        e.isCheked = false;
      }
    }
    addressList.removeWhere((e) => e.id == newAddress.id);
    addressList.add(newAddress);

    return UserModel(
      userID: currentUser.userID,
      name: currentUser.name,
      phoneNumber: currentUser.phoneNumber,
      email: currentUser.email,
      orders: currentUser.orders,
      shippingAddresses: addressList,
      paymentMethods: currentUser.paymentMethods,
      //promocodes: currentUser.promocodes,
      reviews: currentUser.reviews,
      photoURL: currentUser.photoURL,
      role: currentUser.role,
    );
  }

  UserModel addNewShippingAddress({
    required UserModel currentUser,
    required ShippingAddressModel newAddress,
  }) {
    List<ShippingAddressModel> addressList = [];
    addressList = currentUser.shippingAddresses as List<ShippingAddressModel>;
    for (ShippingAddressModel e in addressList) {
      if (newAddress.isCheked == true) {
        e.isCheked = false;
      }
    }
    addressList.add(newAddress);

    //log('addressList ===>>> $addressList');

    return UserModel(
      userID: currentUser.userID,
      name: currentUser.name,
      phoneNumber: currentUser.phoneNumber,
      email: currentUser.email,
      orders: currentUser.orders,
      shippingAddresses: addressList,
      paymentMethods: currentUser.paymentMethods,
      //promocodes: currentUser.promocodes,
      reviews: currentUser.reviews,
      photoURL: currentUser.photoURL,
      role: currentUser.role,
    );
  }

  // Future<ProductRatingAndReviewsModel> updateRatingAndReviews({
  //   required ProductRatingAndReviewsModel ratingAndReviews,
  //   required String productId,
  //   required int newRate,
  //   required ProductReviewModel review,
  // }) async {
  //   ProductRatingModel? newRating;
  //   List<ProductReviewModel>? newReviews;
  //   newRating = getNewRating(
  //     ratingAndReviews.rating!,
  //     newRate,
  //     productId,
  //   );
  //   newReviews = getNewReviews(
  //     ratingAndReviews.reviews as List<ProductReviewModel>,
  //     review,
  //   );

  //   return ProductRatingAndReviewsModel(
  //     productId: ratingAndReviews.productId,
  //     rating: newRating,
  //     reviews: newReviews,
  //   );
  // }

  ProductRatingModel getNewRating(
    ProductRatingModel rate,
    int newRate,
    String productId,
  ) {
    ProductRatingModel? newRating;
    switch (newRate) {
      case 0:
        newRating = ProductRatingModel(
          totalRating: getTotalRating(rate, newRate),
          totalUser: rate.totalUser!,
          one: rate.one!,
          two: rate.two,
          three: rate.three,
          four: rate.four,
          five: rate.five,
        );
        break;
      case 1:
        newRating = ProductRatingModel(
          totalRating: getTotalRating(rate, newRate),
          totalUser: rate.totalUser! + 1,
          one: rate.one! + 1,
          two: rate.two,
          three: rate.three,
          four: rate.four,
          five: rate.five,
        );
        break;
      case 2:
        newRating = ProductRatingModel(
          totalRating: getTotalRating(rate, newRate),
          totalUser: rate.totalUser! + 1,
          one: rate.one,
          two: rate.two! + 1,
          three: rate.three,
          four: rate.four,
          five: rate.five,
        );
        break;
      case 3:
        newRating = ProductRatingModel(
          totalRating: getTotalRating(rate, newRate),
          totalUser: rate.totalUser! + 1,
          one: rate.one,
          two: rate.two,
          three: rate.three! + 1,
          four: rate.four,
          five: rate.five,
        );
        break;
      case 4:
        newRating = ProductRatingModel(
          totalRating: getTotalRating(rate, newRate),
          totalUser: rate.totalUser! + 1,
          one: rate.one,
          two: rate.two,
          three: rate.three,
          four: rate.four! + 1,
          five: rate.five,
        );
        break;
      case 5:
        newRating = ProductRatingModel(
          totalRating: getTotalRating(rate, newRate),
          totalUser: rate.totalUser! + 1,
          one: rate.one,
          two: rate.two,
          three: rate.three,
          four: rate.four,
          five: rate.five! + 1,
        );
        break;
    }

    return newRating!;
  }

  Future<ProductRatingAndReviewsModel> getRatingAndReviews(
      String productId) async {
    final ratingAndReviews =
        allFakeRatingAndReviews.where((i) => i.productId == productId).toList();

    return ratingAndReviews.elementAt(0);
  }

  double getTotalRating(ProductRatingModel rating, int newRate) {
    double rate = 0.0;

    switch (newRate) {
      case 1:
        rate = (((rating.one! + 1) * 1).toDouble() +
                (rating.two! * 2).toDouble() +
                (rating.three! * 3).toDouble() +
                (rating.four! * 4).toDouble() +
                (rating.five! * 5).toDouble()) /
            (rating.totalUser! + 1);
        break;
      case 2:
        rate = ((rating.one! * 1).toDouble() +
                ((rating.two! + 1) * 2).toDouble() +
                (rating.three! * 3).toDouble() +
                (rating.four! * 4).toDouble() +
                (rating.five! * 5).toDouble()) /
            (rating.totalUser! + 1);
        break;
      case 3:
        rate = ((rating.one! * 1).toDouble() +
                (rating.two! * 2).toDouble() +
                ((rating.three! + 1) * 3).toDouble() +
                (rating.four! * 4).toDouble() +
                (rating.five! * 5).toDouble()) /
            (rating.totalUser! + 1);
        break;
      case 4:
        rate = ((rating.one! * 1).toDouble() +
                (rating.two! * 2).toDouble() +
                (rating.three! * 3).toDouble() +
                ((rating.four! + 1) * 4).toDouble() +
                (rating.five! * 5).toDouble()) /
            (rating.totalUser! + 1);
        break;
      case 5:
        rate = ((rating.one! * 1).toDouble() +
                (rating.two! * 2).toDouble() +
                (rating.three! * 3).toDouble() +
                (rating.four! * 4).toDouble() +
                ((rating.five! + 1) * 5).toDouble()) /
            (rating.totalUser! + 1);
        break;
    }

    return rate;
  }

  // switch (newIndex) {
  //               case 0:
  //                 _choice = 'Popular';
  //                 break;
  //               case 1:
  //                 _choice = 'Newest';
  //                 break;
  //               case 2:
  //                 _choice = 'Customer review';
  //                 break;
  //               case 3:
  //                 _choice = 'Price: lowest to high';
  //                 break;
  //               case 4:
  //                 _choice = 'Price: highest to low';
  //                 break;
  //             }

  // Future<List<ProductModel>> getNewAndSaleProducts() async {
  //   final List<ProductModel> fakeProductsList = [];
  //   final allNewProducts = allFakeProducts
  //       .where(
  //         (i) => i.isNew == true,
  //       )
  //       .toList();
  //   final allSaleProducts =
  //       allFakeProducts.where((i) => i.isSale == true).toList();
  //   fakeProductsList.addAll(allNewProducts);
  //   fakeProductsList.addAll(allSaleProducts);
  //   return fakeProductsList;
  // }

  // Future<List<ProductModel>> getProductsWithTwoValues({
  //   required String type,
  //   required String collection,
  // }) async {
  //   final fakeProductsList = allFakeProducts
  //       .where((i) => i.category!.typeName == type)
  //       .toList()
  //       .where((i) => i.category!.collectionName == collection)
  //       .toList();
  //   return fakeProductsList;
  // }

  // List<ProductModel> getProductsWithThreeValues({
  //   required String type,
  //   required String collection,
  //   required String category,
  // }) {
  //   final fakeProductsList = allFakeProducts
  //       .where((i) => i.category!.typeName == type)
  //       .toList()
  //       .where((i) => i.category!.collectionName == collection)
  //       .toList()
  //       .where((i) => i.category!.categoryName == category)
  //       .toList();
  //   return fakeProductsList;
  // }

  // List<ProductModel> getNewProducts() {
  //   return allFakeProducts.where((i) => i.isNew == true).toList();
  // }
}


// allProducts: allProducts.where((i) => i.isNew == true).toList(),
//                 allProducts: allProducts
//                     .where((i) =>
//                         DateTimeFormatter().isNew(i.createdDate!) == true)
//                     .toList(),

// final allNewProducts =
//     FakeProductData().allFakeProducts.where((i) => i.isNew == true).toList();

// class FakeProductData {
//   // Future<ProductModel> getProduct({required String productID}) async {
//   //   return await firestore.get(
//   //     id: productID,
//   //     collectionName: 'products',
//   //     fromJson: productFromJson,
//   //   );
//   // }

//   Future<List<ProductModel>> getAllProducts() async {
//     // List<ProductModel>? fakeProductsList;
//     // Future.delayed(const Duration(seconds: 2), () {});
//     final fakeProductsList = allFakeProducts.toList();
//     return fakeProductsList;
//   }

//   Future<List<ProductModel>> getProductsByQuery({
//     required String fieldName,
//     required dynamic query,
//   }) async {
//     final fakeProductsList = allFakeProducts
//         .where((i) => i.type == fieldName)
//         .toList()
//         .where((i) => i.collectionName == query)
//         .toList();
//     return fakeProductsList;
//   }

//   Future<List<ProductModel>> getProductsWithTwoValues({
//     required String type,
//     required String collection,
//   }) async {
//     final fakeProductsList = allFakeProducts
//         .where((i) => i.type == type)
//         .toList()
//         .where((i) => i.collectionName == collection)
//         .toList();
//     return fakeProductsList;
//   }
