import 'package:e_commerce/lib.dart';

abstract class RemoteShippingAddress {
  Future<String> getShippingAddresID({
    required String userID,
  });
  Future<List<AddressModel>> getAllShippingAddress({
    required String userId,
  });
  Future<bool> addShippingAddress({required AddressModel address});
}

class RemoteShippingAddressImpl implements RemoteShippingAddress {
  final FirestoreCore firestore;

  RemoteShippingAddressImpl({required this.firestore});

  @override
  Future<String> getShippingAddresID({
    required String userID,
  }) async {
    return await firestore.getCollectionIdById(
      firstCollectionName: 'users',
      secondCollectionName: 'shippingAddress',
      userID: userID,
    );
  }

  @override
  Future<List<AddressModel>> getAllShippingAddress({
    required String userId,
  }) async {
    return await firestore.getListFromCollectionByUserID(
      firstCollection: 'users',
      secondCollection: 'shippingAddress',
      userID: userId,
      fromJson: addressFromJson,
    );
  }

  @override
  Future<bool> addShippingAddress({required AddressModel address}) async {
    return await firestore.setToCollection(
      firstCollection: 'users',
      secondCollection: 'shippingAddress',
      firstID: address.userId!,
      secondID: address.id!,
      objectModel: address,
    );
    //return FakeBrandData().brands;
  }
}
