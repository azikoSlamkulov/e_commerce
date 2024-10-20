import 'dart:developer';

import 'package:e_commerce/src/module/profile/data/model/model.dart';

import '../../../../../config/helper/fake_remote_data/fake_logic.dart';
import '../../../../../core/core.dart';
import '../../../../auth/data/model/model.dart';
import '../../../domain/entities/entities.dart';

abstract class RemoteProfile {
  Future<UserModel> getUserInfo({required String userID});
  Future<bool> updateUser({required UserModel user});
  Future<String> getShippingAddresID({required String userID});
  Future<List<ShippingAddressModel>> getAllShippingAddress(
      {required String userId});
  Future<bool> addShippingAddress({
    required ShippingAddressModel newAddress,
  });
  Future<bool> updateShippingAddress(
      {required ShippingAddressModel newAddress});
  Future<bool> selectDefaultShippingAddress({
    required String userId,
    required String addressId,
  });

  Future<List<PaymentCardModel>> getAllPaymentCards({required String userId});
  Future<bool> addNewPaymentCard({
    required PaymentCardModel newPaymentCard,
  });
  Future<bool> selectDefaultPaymentCard({
    required String userId,
    required String paymentCardId,
  });
}

class RemoteProfileImpl implements RemoteProfile {
  final FirestoreCore firestore;

  RemoteProfileImpl({required this.firestore});

  @override
  Future<UserModel> getUserInfo({required String userID}) async {
    return await firestore.get(
      docId: userID,
      collectionName: 'users',
      fromJson: authFromJson,
    );
  }

  @override
  Future<bool> updateUser({required UserModel user}) async {
    return await firestore.update(
      docId: user.userID!,
      collectionName: 'users',
      objectModel: user,
    );
  }

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
    required ShippingAddressModel newAddress,
  }) async {
    final currentUser = await firestore.get(
      docId: newAddress.userId!,
      collectionName: 'users',
      fromJson: authFromJson,
    );
    return await firestore.update(
      collectionName: 'users',
      docId: currentUser.userID!,
      objectModel: FakeLogic().addNewShippingAddress(
        currentUser: currentUser,
        newAddress: newAddress,
      ),
    );
  }

  @override
  Future<bool> updateShippingAddress(
      {required ShippingAddressModel newAddress}) async {
    final currentUser = await firestore.get(
      docId: newAddress.userId!,
      collectionName: 'users',
      fromJson: authFromJson,
    );
    return await firestore.update(
      collectionName: 'users',
      docId: currentUser.userID!,
      objectModel: FakeLogic().updateShippingAddress(
        currentUser: currentUser,
        newAddress: newAddress,
      ),
    );
  }

  @override
  Future<bool> selectDefaultShippingAddress({
    required String userId,
    required String addressId,
  }) async {
    final currentUser = await firestore.get(
      docId: userId,
      collectionName: 'users',
      fromJson: authFromJson,
    );
    return await firestore.update(
      collectionName: 'users',
      docId: currentUser.userID!,
      objectModel: FakeLogic().selectDefaultShippingAddress(
        currentUser: currentUser,
        addressId: addressId,
      ),
    );
  }

  // @override
  // Future<String> getPaymentCardsID({
  //   required String userID,
  // }) async {
  //   return await firestore.getDocIdFromSecondCollection(
  //     firstCollectionName: 'users',
  //     secondCollectionName: 'shippingAddress',
  //     firstDocId: userID,
  //   );
  // }

  @override
  Future<List<PaymentCardModel>> getAllPaymentCards({
    required String userId,
  }) async {
    final user = await firestore.get(
      docId: userId,
      collectionName: 'users',
      fromJson: authFromJson,
    );
    return user.paymentMethods as List<PaymentCardModel>;
  }

  @override
  Future<bool> addNewPaymentCard({
    required PaymentCardModel newPaymentCard,
  }) async {
    final currentUser = await firestore.get(
      docId: newPaymentCard.userId!,
      collectionName: 'users',
      fromJson: authFromJson,
    );
    return await firestore.update(
      collectionName: 'users',
      docId: currentUser.userID!,
      objectModel: FakeLogic().addNewPaymentCard(
        currentUser: currentUser,
        newCard: newPaymentCard,
      ),
    );
  }

  @override
  Future<bool> selectDefaultPaymentCard({
    required String userId,
    required String paymentCardId,
  }) async {
    final currentUser = await firestore.get(
      docId: userId,
      collectionName: 'users',
      fromJson: authFromJson,
    );
    return await firestore.update(
      collectionName: 'users',
      docId: currentUser.userID!,
      objectModel: FakeLogic().selectDefaultPaymentCard(
        currentUser: currentUser,
        cardId: paymentCardId,
      ),
    );
  }
}
