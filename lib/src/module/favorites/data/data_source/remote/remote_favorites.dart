import '../../../../../../lib.dart';

abstract class RemoteFavorites {
  Future<List<FavoriteModel>> getAllFavoritesProducts({required String userID});

  Future<bool> addProductToFavorites({
    //required String userID,
    required FavoriteModel product,
  });
  Future<bool> deleteProductFromFavorites({
    required String userID,
    required String productID,
  });
}

class RemoteFavoritesImpl implements RemoteFavorites {
  final FirestoreCore firestore;

  RemoteFavoritesImpl({required this.firestore});

  @override
  Future<List<FavoriteModel>> getAllFavoritesProducts(
      {required String userID}) async {
    List<ProductModel> list = [];
    // return await firestore.getListFromCollection(
    //   firstCollection: 'users',
    //   secondCollection: 'favorites',
    //   userID: userID,
    //   fromJson: favoriteProductFromJson,
    // );
    final favoriteList = await firestore.getListFromSecondCollection(
      firstCollectionName: 'users',
      secondCollectionName: 'favorites',
      firstDocId: userID,
      fromJson: favoriteProductFromJson,
    );
    // for (var item in favoriteList) {
    //   final product = await firestore.get(
    //     id: item.productID!,
    //     collectionName: 'products',
    //     fromJson: productFromJson,
    //   );
    //   list.add(product);
    // }
    // return list;
    return favoriteList;
  }

  @override
  Future<bool> addProductToFavorites({
    //required String userID,
    required FavoriteModel product,
  }) async {
    return await firestore.setTwoCollections(
      firstCollectionName: 'users',
      secondCollectionName: 'favorites',
      firstDocId: product.userID!,
      secondDocId: product.productID!,
      objectModel: product,
    );
  }

  @override
  Future<bool> deleteProductFromFavorites({
    required String userID,
    required String productID,
  }) async {
    return await firestore.deleteDocFromSecondCollection(
      firstCollectionName: 'users',
      secondCollectionName: 'favorites',
      firstDocId: userID,
      secondDocId: productID,
    );
  }
}
