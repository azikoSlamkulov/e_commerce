import '../../../../../../lib.dart';

abstract class RemoteFavorites {
  Future<List<ProductsListModel>> getAllFavoritesProducts(
      {required String userID});

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
  Future<List<ProductsListModel>> getAllFavoritesProducts(
      {required String userID}) async {
    List<ProductsListModel> list = [];
    // return await firestore.getListFromCollection(
    //   firstCollection: 'users',
    //   secondCollection: 'favorites',
    //   userID: userID,
    //   fromJson: favoriteProductFromJson,
    // );
    final favoriteList = await firestore.getListFromCollectionByUserID(
      firstCollection: 'users',
      secondCollection: 'favorites',
      userID: userID,
      fromJson: favoriteProductFromJson,
    );
    for (var item in favoriteList) {
      final product = await firestore.get(
        id: item.productID!,
        collectionName: 'products',
        fromJson: productFromJson,
      );
      list.add(product);
    }
    return list;
  }

  @override
  Future<bool> addProductToFavorites({
    //required String userID,
    required FavoriteModel product,
  }) async {
    return await firestore.setToCollection(
      firstCollection: 'users',
      secondCollection: 'favorites',
      //userID: userID,
      objectModel: product,
      //collectionName: 'bag',
    );
  }

  @override
  Future<bool> deleteProductFromFavorites({
    required String userID,
    required String productID,
  }) async {
    return await firestore.deleteFromCollection(
      firstCollection: 'users',
      secondCollection: 'favorites',
      userID: userID,
      productID: productID,
    );
  }
}
