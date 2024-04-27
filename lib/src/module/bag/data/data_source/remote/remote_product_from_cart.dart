import 'package:e_commerce/lib.dart';

abstract class RemoteProductsFromCart {
  Future<List<BagEntity>> getAllProductsFromCart({required String userID});

  // Future<bool> setProductToCart({
  //   required BagEntity product,
  // });
  Future<bool> deleteProductFromCart({
    required String userID,
    required String productID,
  });

  Future<bool> setOrder({
    required OrderModel order,
  });

  Future<String> getOrderID();
}

class RemoteProductsFromCartImpl implements RemoteProductsFromCart {
  final FirestoreCore firestore;

  RemoteProductsFromCartImpl({required this.firestore});

  @override
  Future<String> getOrderID() async {
    return await firestore.getID(
      collectionName: 'orders',
    );
  }

  @override
  Future<List<BagEntity>> getAllProductsFromCart(
      {required String userID}) async {
    return await firestore.getListFromCollectionByUserID(
      firstCollection: 'users',
      secondCollection: 'bags',
      userID: userID,
      fromJson: bagProductFromJson,
    );

    //return FakeBagsData().getBagsList();
  }

  // @override
  // Future<bool> setProductToCart({required BagEntity product}) async {
  //   return await firestore.setToCollection(
  //     firstCollection: 'users',
  //     secondCollection: 'bags',
  //     firstID: product.!,
  //     secondID: product.userID!,
  //     objectModel: product,
  //   );
  //   //return FakeBagsData().addProductToBag(product: product);
  // }

  @override
  Future<bool> deleteProductFromCart({
    required String userID,
    required String productID,
  }) async {
    return await firestore.deleteFromCollection(
      firstCollection: 'users',
      secondCollection: 'bags',
      userID: userID,
      productID: productID,
    );
  }

  @override
  Future<bool> setOrder({required OrderModel order}) async {
    return await firestore.create(
      objectModel: order,
      collectionName: 'orders',
    );
    //return FakeBagsData().addProductToBag(product: product);
  }
}
