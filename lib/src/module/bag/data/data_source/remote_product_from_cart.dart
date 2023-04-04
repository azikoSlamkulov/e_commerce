import 'package:e_commerce/src/module/bag/data/models/bag_model.dart';
import 'package:e_commerce/src/module/bag/domain/entities/bag_entity.dart';

import '../../../../core/data/remote/firebase/firestore.dart';

abstract class RemoteProductsFromCart {
  Future<List<BagEntity>> getAllProductsFromCart({required String userID});

  Future<bool> setProductToCart({
    required BagEntity product,
  });
  Future<bool> deleteProductFromCart({
    required String userID,
    required String productID,
  });
}

class RemoteProductsFromCartImpl implements RemoteProductsFromCart {
  final FirestoreCore firestore;

  RemoteProductsFromCartImpl({required this.firestore});

  @override
  Future<List<BagEntity>> getAllProductsFromCart(
      {required String userID}) async {
    return await firestore.getListFromCart(
      userID: userID,
      fromJson: bagProductFromJson,
    );
  }

  @override
  Future<bool> setProductToCart({required BagEntity product}) async {
    return await firestore.setProductToCart(
      objectModel: product,
      //collectionName: 'bag',
    );
  }

  @override
  Future<bool> deleteProductFromCart({
    required String userID,
    required String productID,
  }) async {
    return await firestore.deleteProductFromCart(
      userID: userID,
      productID: productID,
    );
  }
}
