import 'dart:developer';

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
    //required UserEntity user,
    required OrderModel order,
  });

  Future<String> getOrderID();
}

class RemoteProductsFromCartImpl implements RemoteProductsFromCart {
  final FirestoreCore firestore;

  RemoteProductsFromCartImpl({required this.firestore});

  @override
  Future<String> getOrderID() async {
    return await firestore.getId(
      collectionName: 'orders',
    );
  }

  @override
  Future<List<BagEntity>> getAllProductsFromCart(
      {required String userID}) async {
    return await firestore.getListFromSecondCollection(
      firstCollectionName: 'users',
      secondCollectionName: 'bags',
      firstDocId: userID,
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
    return await firestore.deleteDocFromSecondCollection(
      firstCollectionName: 'users',
      secondCollectionName: 'bags',
      firstDocId: userID,
      secondDocId: productID,
    );
  }

  @override
  Future<bool> setOrder({
    //required UserEntity user,
    required OrderModel order,
  }) async {
    final user = await firestore.get(
      docId: order.userID!,
      collectionName: 'users',
      fromJson: authFromJson,
    );
    List<OrderModel> ordersList = [];
    ordersList = user.orders as List<OrderModel>;
    ordersList.add(order);

    return await firestore.update(
      docId: user.userID!,
      objectModel: UserModel(
        userID: user.userID,
        name: user.name,
        phoneNumber: user.phoneNumber,
        email: user.email,
        orders: ordersList,
        shippingAddresses: user.shippingAddresses,
        paymentMethods: user.paymentMethods,
        //promocodes: promocodes,
        reviews: user.reviews,
        photoURL: user.photoURL,
        role: user.role,
      ),
      collectionName: 'users',
    );
  }
}
