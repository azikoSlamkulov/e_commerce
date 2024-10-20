import 'dart:developer';

import 'package:e_commerce/lib.dart';

abstract class RemoteProduct {
  //Future<bool> checkUserExists({required String? userID});
  Future<ProductDatailModel> getProductDatails({required String productId});
  Future<String> getProductID();

  Future<List<ProductModel>> getAllProducts();

  Future<List<ProductModel>> getNewAndSaleProducts();

  Future<List<ProductModel>> getProductsOfTheCollection({
    required String typeName,
    required String collectionName,
  });

  Future<List<ProductModel>> getProductsOfTheCategory({
    required String typeName,
    required String collectionName,
    required String categoryName,
  });

  Future<List<ProductModel>> getSortedProductsByQuery({
    required String fieldName,
    required dynamic query,
  });

  Future<List<ProductModel>> getSortedListByQueryWithTwoValues({
    required dynamic firstQuery,
    required dynamic secondQuery,
  });

  Future<List<ProductModel>> getSortedListByQueryWithThreeValues({
    required dynamic firstQuery,
    required dynamic secondQuery,
    required dynamic thirdQuery,
  });

  Future<bool> setProduct({
    required ProductModel product,
    required ProductDatailModel productDatail,
  });

  Future<bool?> checkProductExist({required productID});

  Future<ProductRatingAndReviewsModel> getRatingAndReviews({
    required String productID,
  });

  Future<bool> setRatingAndReviews({
    required String productId,
    required int rating,
    required ProductReviewModel review,
  });

  // Future<List<ProductSizeModel>> getProductSizesList({
  //   required String productID,
  // });

  // Future<ProductSizeModel> getProductQuantity({
  //   required String productID,
  //   required String productSize,
  // });
}

class RemoteProductImpl implements RemoteProduct {
  final FirestoreCore firestore;
  //final FakeData fakeData;

  RemoteProductImpl({
    required this.firestore,
    //required this.fakeData,
  });

  @override
  Future<ProductDatailModel> getProductDatails(
      {required String productId}) async {
    return await firestore.getDocFromSecondCollection(
      firstDocId: productId,
      secondDocId: productId,
      firstCollectionName: 'products',
      secondCollectionName: 'productDatails',
      fromJson: productDatailFromJson,
    );
  }

  @override
  Future<String> getProductID() async {
    return await firestore.getId(
      collectionName: 'products',
    );
  }

  @override
  Future<List<ProductModel>> getAllProducts() async {
    return await firestore.getList(
      collectionName: 'products',
      fromJson: productFromJson,
    );
    //return FakeProductData().allFakeProducts;
  }

  @override
  Future<List<ProductModel>> getSortedListByQueryWithTwoValues({
    required dynamic firstQuery,
    required dynamic secondQuery,
  }) async {
    return await firestore.getListByQueryWithTwoValues(
      collectionName: 'products',
      mainFieldName: 'category.',
      firstFieldName: 'type',
      secondFieldName: 'collection',
      firstQuery: firstQuery,
      secondQuery: secondQuery,
      fromJson: productFromJson,
    );
    // return FakeProductData().getProductsWithTwoValues(
    //   type: firstQuery,
    //   collection: secondQuery,
    // );
  }

  @override
  Future<List<ProductModel>> getProductsOfTheCollection({
    required String typeName,
    required String collectionName,
  }) async {
    return await firestore.getListByQueryWithTwoValues(
      collectionName: 'products',
      mainFieldName: 'category.',
      firstFieldName: 'type',
      secondFieldName: 'collection',
      firstQuery: typeName,
      secondQuery: collectionName,
      fromJson: productFromJson,
    );
    // return FakeLogic().getProductsWithTwoValues(
    //   type: typeName,
    //   collection: collectionName,
    //   //category: thirdQuery,
    // );
  }

  @override
  Future<List<ProductModel>> getProductsOfTheCategory({
    required String typeName,
    required String collectionName,
    required String categoryName,
  }) async {
    return await firestore.getListByQueryWithThreeValues(
      collectionName: 'products',
      mainFieldName: 'category.',
      firstFieldName: 'type',
      secondFieldName: 'collection',
      thirdFieldName: 'category',
      firstQuery: typeName,
      secondQuery: collectionName,
      thirdQuery: categoryName,
      fromJson: productFromJson,
    );
    // return FakeLogic().getProductsWithThreeValues(
    //   type: typeName,
    //   collection: collectionName,
    //   category: categoryName,
    // );
  }

  @override
  Future<List<ProductModel>> getSortedProductsByQuery({
    required String fieldName,
    required dynamic query,
  }) async {
    return await firestore.getListByQuery(
      collectionName: 'products',
      fieldName: fieldName,
      query: query,
      fromJson: productFromJson,
    );
    // return FakeProductData().getProductsByQuery(
    //   fieldName: fieldName,
    //   query: query,
    // );
  }

  @override
  Future<List<ProductModel>> getNewAndSaleProducts() async {
    final List<ProductModel> newAndSaleProducts = [];
    final newProducts = await firestore.getListByQuery(
      collectionName: 'products',
      fieldName: 'isNew',
      query: true,
      fromJson: productFromJson,
    );
    final saleProducts = await firestore.getListByQuery(
      collectionName: 'products',
      fieldName: 'isSale',
      query: true,
      fromJson: productFromJson,
    );
    newAndSaleProducts.addAll(newProducts);
    newAndSaleProducts.addAll(saleProducts);
    return newAndSaleProducts;

    // return FakeLogic().getNewAndSaleProducts();
  }

  @override
  Future<List<ProductModel>> getSortedListByQueryWithThreeValues({
    required dynamic firstQuery,
    required dynamic secondQuery,
    required dynamic thirdQuery,
  }) async {
    return await firestore.getListByQueryWithThreeValues(
      collectionName: 'products',
      mainFieldName: 'category',
      firstFieldName: 'type',
      secondFieldName: 'collection',
      thirdFieldName: 'category',
      firstQuery: firstQuery,
      secondQuery: secondQuery,
      thirdQuery: thirdQuery,
      fromJson: productFromJson,
    );
    // return FakeProductData().getFakeProductsWithThreeValues(
    //   type: firstQuery,
    //   collection: secondQuery,
    //   category: thirdQuery,
    // );
  }

  @override
  Future<bool> setProduct({
    required ProductModel product,
    required ProductDatailModel productDatail,
  }) async {
    final isProductAdded = await firestore.create(
      docId: product.id!,
      objectModel: product,
      collectionName: 'products',
    );
    final isProductDatailAdded = await firestore.setTwoCollections(
      firstCollectionName: 'products',
      secondCollectionName: 'productDatails',
      firstDocId: product.id!,
      secondDocId: product.id!,
      objectModel: productDatail,
    );
    return isProductDatailAdded;
  }

  @override
  Future<bool?> checkProductExist({required productID}) {
    // TODO: implement checkProductExist
    throw UnimplementedError();
  }

  @override
  Future<ProductRatingAndReviewsModel> getRatingAndReviews({
    required String productID,
    //required String userID,
  }) async {
    final product = await getProductDatails(productId: productID);

    final rating = product.rating as ProductRatingModel;
    final reviews = product.reviews as List<ProductReviewModel>;

    return ProductRatingAndReviewsModel(
      productId: product.id,
      rating: rating,
      reviews: reviews,
    );
  }

  @override
  Future<bool> setRatingAndReviews({
    required String productId,
    required int rating,
    required ProductReviewModel review,
  }) async {
    if (review != const ProductReviewModel()) {
      final user = await firestore.get(
        docId: review.userId!,
        collectionName: 'users',
        fromJson: authFromJson,
      );

      UserModel newUser = FakeLogic().getUserWithNewReviews(user, review);

      final isUserUpdated = await firestore.update(
        docId: user.userID!,
        collectionName: 'users',
        objectModel: newUser,
      );
    }

    final product = await getProductDatails(productId: productId);

    ProductDatailModel newProductDatail =
        FakeLogic().getProductWithNewRatingAndReviews(
      product,
      review,
      rating,
    );

    ProductModel newProduct = ProductModel(
      id: newProductDatail.id,
      category: newProductDatail.category,
      brand: newProductDatail.brand,
      color: newProductDatail.color,
      isNew: newProductDatail.isNew,
      isSale: newProductDatail.isSale,
      sale: newProductDatail.sale,
      price: newProductDatail.price,
      newPrice: newProductDatail.newPrice,
      totalRating: newProductDatail.totalRating,
      totalUser: newProductDatail.totalUser,
      mainImgUrl: newProductDatail.mainImgUrl,
    );

    final isProductUpdated = await firestore.update(
      docId: productId,
      objectModel: newProduct,
      collectionName: 'products',
    );

    final isProductDatailUpdated = await firestore.updateSecondCollection(
      firstCollectionName: 'products',
      secondCollectionName: 'productDatails',
      firstDocId: productId,
      secondDocId: productId,
      objectModel: newProductDatail,
    );

    if (isProductUpdated || isProductDatailUpdated) {
      return true;
    } else {
      return false;
    }
  }

  // @override
  // Future<List<ProductSizeModel>> getProductSizesList({
  //   required String productID,
  // }) async {
  //   return await firestore.getListFromCollectionByProductID(
  //     firstCollection: 'products',
  //     secondCollection: 'productSizes',
  //     productID: productID,
  //     fromJson: productSizeFromJson,
  //   );
  //   // return FakeProductData().getProductsByQuery(
  //   //   fieldName: fieldName,
  //   //   query: query,
  //   // );
  // }

  // @override
  // Future<ProductSizeModel> getProductQuantity({
  //   required String productID,
  //   required String productSize,
  // }) async {
  //   return await firestore.getProductQuantity(
  //     firstCollection: 'products',
  //     secondCollection: 'productSizes',
  //     productID: productID,
  //     fieldName: 'size',
  //     query: productSize,
  //     fromJson: productSizeFromJson,
  //   );
  //   // return FakeProductData().getProductsByQuery(
  //   //   fieldName: fieldName,
  //   //   query: query,
  //   // );
  // }
}
