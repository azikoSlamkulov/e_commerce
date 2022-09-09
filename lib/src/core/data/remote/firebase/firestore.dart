import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirestoreCore {
  Future<bool> checkExists({
    required String id,
    required String collectionName,
  });
  Future<T> get<T>({
    required String id,
    required String collectionName,
    required T Function(Map body) fromJson,
  });
  Future<List<T>> getList<T>({
    required String collectionName,
    required T Function(Map<String, dynamic> body) fromJson,
  });
  Future<bool> create({
    //required objectEntity,
    required objectModel,
    required String collectionName,
  });
  Future<bool> update({
    required objectEntity,
    required objectModel,
    required String collectionName,
  });
  Future<bool> delete({
    required String userID,
    required String collectionName,
  });
}

class FirestoreCoreImpl implements FirestoreCore {
  final FirebaseFirestore firestoreDB;

  FirestoreCoreImpl({required this.firestoreDB});

  @override
  Future<bool> checkExists({
    required String id,
    required String collectionName,
  }) async {
    DocumentSnapshot _doc =
        await firestoreDB.collection(collectionName).doc(id).get();
    return _doc.exists;
  }

  @override
  Future<T> get<T>({
    required String id,
    required String collectionName,
    required T Function(Map body) fromJson,
  }) async {
    DocumentSnapshot doc =
        await firestoreDB.collection(collectionName).doc(id).get();
    final docMap = doc.data() as Map<String, dynamic>;
    final object = fromJson(docMap);
    return object;
    // if (_doc.exists) {
    //   final _docMap = _doc.data() as Map<String, dynamic>;
    //   final _object = fromJson(_docMap);
    //   return _object;
    // } else {
    //   T _object = T();
    //   return _object;
    // }
  }

  @override
  Future<List<T>> getList<T>({
    required String collectionName,
    required T Function(Map<String, dynamic> body) fromJson,
  }) async {
    List<T> _list = <T>[];
    final _response = await firestoreDB.collection(collectionName).get();
    for (final _doc in _response.docs) {
      //final _doc = <T>.fromJson(doc.data() as Map<String, dynamic>);
      final _object = fromJson(_doc.data());
      _list.add(_object);
    }
    return _list;
  }

  // @override
  // Future<bool?> create({
  //   //required objectEntity,
  //   required objectModel,
  //   required String collectionName,
  // }) async {
  //   await firestoreDB
  //       .collection(collectionName)
  //       .doc(objectModel.uid)
  //       .set(objectModel, SetOptions(merge: true))
  //       .onError((error, stackTrace) => false);
  // }

  @override
  Future<bool> create({
    //required objectEntity,
    required objectModel,
    required String collectionName,
  }) async {
    return await firestoreDB
        .collection(collectionName)
        // .doc(user.userID)
        // .collection('profile')
        .doc(objectModel.userID)
        .get()
        .then((_doc) {
      final newObject = objectModel.toJson();
      if (!_doc.exists) {
        firestoreDB
            .collection(collectionName)
            .doc(objectModel.userID)
            .set(newObject, SetOptions(merge: true));
      }
      return true;
    }).onError((error, stackTrace) {
      return false;
    });
  }

  // @override
  // Future<bool?> createNewUser({required UserEntity user}) async {
  //   return await firestoreDB
  //       .collection("users")
  //       // .doc(user.userID)
  //       // .collection('profile')
  //       .doc(user.userID)
  //       .get()
  //       .then((_userDoc) {
  //     final _newUser = UserModel(
  //       userID: user.userID,
  //       name: user.name,
  //       lastName: user.lastName,
  //       email: user.email,
  //       mainPhoneNumber: user.mainPhoneNumber,
  //       mark: user.mark,
  //       role: _user.role,
  //     ).toJson();
  //     if (!_userDoc.exists) {
  //       firestoreDB
  //           .collection("users")
  //           .doc(user.userID)
  //           .set(_newUser, SetOptions(merge: true));
  //     }
  //     return true;
  //   }).onError((error, stackTrace) {
  //     return false;
  //   });
  // }

  @override
  Future<bool> update({
    required objectEntity,
    required objectModel,
    required String collectionName,
  }) async {
    return await firestoreDB
        .collection(collectionName)
        .doc(objectEntity.userID)
        .get()
        .then((_userDoc) {
      final _newUser = objectModel.toJson();
      if (_userDoc.exists) {
        firestoreDB
            .collection(collectionName)
            .doc(objectEntity.userID)
            .update(_newUser);
      }
      return true;
    }).onError((error, stackTrace) {
      return false;
    });
  }

  @override
  Future<bool> delete({
    required String userID,
    required String collectionName,
  }) async {
    return await firestoreDB
        .collection(collectionName)
        .doc(userID)
        .delete()
        .then((value) => true)
        .onError((error, stackTrace) => false);
  }
}
