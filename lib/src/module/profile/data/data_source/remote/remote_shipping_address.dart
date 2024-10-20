import 'package:e_commerce/src/module/profile/data/model/model.dart';

import '../../../../../core/core.dart';
import '../../../../auth/data/data.dart';

abstract class RemoteShippingAddress {
  Future<String> getShippingAddresID({
    required String userID,
  });
  Future<List<ShippingAddressModel>> getAllShippingAddress({
    required String userId,
  });
  Future<bool> addShippingAddress({
    required ShippingAddressModel address,
  });
}

class RemoteShippingAddressImpl implements RemoteShippingAddress {
  final FirestoreCore firestore;

  RemoteShippingAddressImpl({required this.firestore});

  @override
  Future<String> getShippingAddresID({
    required String userID,
  }) async {
    return await firestore.getDocIdFromSecondCollection(
      firstCollectionName: 'users',
      secondCollectionName: 'shippingAddress',
      firstDocId: userID,
    );
  }

  @override
  Future<List<ShippingAddressModel>> getAllShippingAddress({
    required String userId,
  }) async {
    final user = await firestore.get(
      docId: userId,
      collectionName: 'users',
      fromJson: authFromJson,
    );
    return user.shippingAddresses as List<ShippingAddressModel>;
  }

  @override
  Future<bool> addShippingAddress({
    required ShippingAddressModel address,
  }) async {
    final user = await firestore.get(
      docId: address.userId!,
      collectionName: 'users',
      fromJson: authFromJson,
    );
    List<ShippingAddressModel> addressList = [];
    addressList = user.shippingAddresses as List<ShippingAddressModel>;
    addressList.add(address);
    return await firestore.update(
      collectionName: 'users',
      docId: user.userID!,
      objectModel: UserModel(
        userID: user.userID,
        name: user.name,
        phoneNumber: user.phoneNumber,
        email: user.email,
        orders: user.orders,
        shippingAddresses: addressList,
        paymentMethods: user.paymentMethods,
        //promocodes: user.promocodes,
        reviews: user.reviews,
        photoURL: user.photoURL,
        role: user.role,
      ),
    );
    // return await firestore.setTwoCollections(
    //   firstCollectionName: 'users',
    //   secondCollectionName: 'shippingAddress',
    //   firstDocId: address.userId!,
    //   secondDocId: address.id!,
    //   objectModel: address,
    // );
    //return FakeBrandData().brands;
  }

  // @override
  // Future<bool> addShippingAddress({required AddressModel address}) async {
  //   return await firestore.setTwoCollections(
  //     firstCollectionName: 'users',
  //     secondCollectionName: 'shippingAddress',
  //     firstDocId: address.userId!,
  //     secondDocId: address.id!,
  //     objectModel: address,
  //   );
  //   //return FakeBrandData().brands;
  // }
}
