import 'package:e_commerce/lib.dart';

abstract class RemoteProduct {
  //Future<bool> checkUserExists({required String? userID});
  //Future<ProductModel> getProductDatails({required String productID});
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
  });

  Future<bool?> checkProductExist({required productID});

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

  // @override
  // Future<ProductModel> getProductDatails({required String productID}) async {
  //   return await firestore.get(
  //     id: productID,
  //     collectionName: 'products',
  //     fromJson: productFromJson,
  //   );
  // }

  @override
  Future<String> getProductID() async {
    return await firestore.getID(
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
    // return await firestore.getListByQueryWithTwoValues(
    //   collectionName: 'products',
    //   mainFieldName: 'category.',
    //   firstFieldName: 'type',
    //   secondFieldName: 'collection',
    //   firstQuery: typeName,
    //   secondQuery: collectionName,
    //   fromJson: productFromJson,
    // );
    return FakeData().getProductsWithTwoValues(
      type: typeName,
      collection: collectionName,
      //category: thirdQuery,
    );
  }

  @override
  Future<List<ProductModel>> getProductsOfTheCategory({
    required String typeName,
    required String collectionName,
    required String categoryName,
  }) async {
    // return await firestore.getListByQueryWithThreeValues(
    //   collectionName: 'products',
    //   mainFieldName: 'category.',
    //   firstFieldName: 'type',
    //   secondFieldName: 'collection',
    //   thirdFieldName: 'category',
    //   firstQuery: typeName,
    //   secondQuery: collectionName,
    //   thirdQuery: categoryName,
    //   fromJson: productFromJson,
    // );
    return FakeData().getProductsWithThreeValues(
      type: typeName,
      collection: collectionName,
      category: categoryName,
    );
  }

  @override
  Future<List<ProductModel>> getSortedProductsByQuery({
    required String fieldName,
    required dynamic query,
  }) async {
    return await firestore.getSortedListByQuery(
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
    // final List<ProductModel> newAndSaleProducts = [];
    // final newProducts = await firestore.getSortedListByQuery(
    //   collectionName: 'products',
    //   fieldName: 'isNew',
    //   query: true,
    //   fromJson: productFromJson,
    // );
    // final saleProducts = await firestore.getSortedListByQuery(
    //   collectionName: 'products',
    //   fieldName: 'isSale',
    //   query: true,
    //   fromJson: productFromJson,
    // );
    // newAndSaleProducts.addAll(newProducts);
    // newAndSaleProducts.addAll(saleProducts);
    // return newAndSaleProducts;

    return FakeData().getNewAndSaleProducts();
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
  Future<bool> setProduct({required ProductModel product}) async {
    return await firestore.create(
      objectModel: product,
      collectionName: 'products',
    );
  }

  @override
  Future<bool?> checkProductExist({required productID}) {
    // TODO: implement checkProductExist
    throw UnimplementedError();
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
