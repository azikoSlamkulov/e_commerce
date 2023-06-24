import 'package:e_commerce/lib.dart';

abstract class RemoteProduct {
  //Future<bool> checkUserExists({required String? userID});
  Future<ProductModel> getProductDatails({required String productID});
  Future<List<ProductsListModel>> getAllProducts();
  Future<List<ProductsListModel>> getAllSortedProductsByQuery({
    required String fieldName,
    required dynamic query,
  });
  Future<List<ProductsListModel>> getSortedListByQueryWithTwoValues({
    required dynamic firstQuery,
    required dynamic secondQuery,
  });
  Future<List<ProductsListModel>> getSortedListByQueryWithThreeValues({
    required dynamic firstQuery,
    required dynamic secondQuery,
    required dynamic thirdQuery,
  });
  Future<bool?> checkProductExist({required productID});
  Future<List<ProductSizeModel>> getProductSizesList({
    required String productID,
  });
  Future<ProductSizeModel> getProductQuantity({
    required String productID,
    required String productSize,
  });
}

class RemoteProductImpl implements RemoteProduct {
  final FirestoreCore firestore;
  //final FakeData fakeData;

  RemoteProductImpl({
    required this.firestore,
    //required this.fakeData,
  });

  @override
  Future<ProductModel> getProductDatails({required String productID}) async {
    return await firestore.get(
      id: productID,
      collectionName: 'products',
      fromJson: productDatailsFromJson,
    );
  }

  @override
  Future<List<ProductsListModel>> getAllProducts() async {
    return await firestore.getList(
      collectionName: 'products',
      fromJson: productFromJson,
    );
    //return FakeProductData().allFakeProducts;
  }

  @override
  Future<List<ProductsListModel>> getAllSortedProductsByQuery({
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
  Future<List<ProductsListModel>> getSortedListByQueryWithTwoValues({
    required dynamic firstQuery,
    required dynamic secondQuery,
  }) async {
    return await firestore.getSortedListByQueryWithTwoValues(
      collectionName: 'products',
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
  Future<List<ProductsListModel>> getSortedListByQueryWithThreeValues({
    required dynamic firstQuery,
    required dynamic secondQuery,
    required dynamic thirdQuery,
  }) async {
    return await firestore.getSortedListByQueryWithThreeValues(
      collectionName: 'products',
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
  Future<bool?> checkProductExist({required productID}) {
    // TODO: implement checkProductExist
    throw UnimplementedError();
  }

  @override
  Future<List<ProductSizeModel>> getProductSizesList({
    required String productID,
  }) async {
    return await firestore.getListFromCollectionByProductID(
      firstCollection: 'products',
      secondCollection: 'productSizes',
      productID: productID,
      fromJson: productSizeFromJson,
    );
    // return FakeProductData().getProductsByQuery(
    //   fieldName: fieldName,
    //   query: query,
    // );
  }

  @override
  Future<ProductSizeModel> getProductQuantity({
    required String productID,
    required String productSize,
  }) async {
    return await firestore.getProductQuantity(
      firstCollection: 'products',
      secondCollection: 'productSizes',
      productID: productID,
      fieldName: 'size',
      query: productSize,
      fromJson: productSizeFromJson,
    );
    // return FakeProductData().getProductsByQuery(
    //   fieldName: fieldName,
    //   query: query,
    // );
  }
}
