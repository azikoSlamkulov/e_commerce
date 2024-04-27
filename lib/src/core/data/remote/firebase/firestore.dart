import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/lib.dart';

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
  Future<String> getID({
    required String collectionName,
  });
  Future<String> getCollectionIdById({
    required String firstCollectionName,
    required String secondCollectionName,
    required String userID,
  });
  Future<List<T>> getList<T>({
    required String collectionName,
    required T Function(Map<String, dynamic> body) fromJson,
  });
  Future<List<T>> getListFromCollectionByUserID<T>({
    required String firstCollection,
    required String secondCollection,
    required String userID,
    required T Function(Map<String, dynamic> body) fromJson,
  });
  Future<List<T>> getListFromCollectionByProductID<T>({
    required String firstCollection,
    required String secondCollection,
    required String productID,
    required T Function(Map<String, dynamic> body) fromJson,
  });
  Future<T> getProductQuantity<T>({
    required String firstCollection,
    required String secondCollection,
    required String productID,
    required String fieldName,
    required dynamic query,
    required T Function(Map<String, dynamic> body) fromJson,
  });

  Future<List<T>> getCategoriesList<T>({
    required String typeName,
    required String collectionName,
    required T Function(Map<String, dynamic> body) fromJson,
  });
  Future<List<T>> getSortedListByQuery<T>({
    required String collectionName,
    required String fieldName,
    required dynamic query,
    required T Function(Map<String, dynamic> body) fromJson,
  });
  Future<List<ProductModel>> getSortedFakeListByQuery<T>({
    required String collectionName,
    required String fieldName,
    required dynamic query,
    required ProductModel Function(Map<String, dynamic> body) fromJson,
  });
  Future<List<T>> getListByQueryWithTwoValues<T>({
    required String collectionName,
    required String mainFieldName,
    required String firstFieldName,
    required String secondFieldName,
    required dynamic firstQuery,
    required dynamic secondQuery,
    required T Function(Map<String, dynamic> body) fromJson,
  });
  Future<List<T>> getListByQueryWithThreeValues<T>({
    required String collectionName,
    required String mainFieldName,
    required String firstFieldName,
    required String secondFieldName,
    required String thirdFieldName,
    required dynamic firstQuery,
    required dynamic secondQuery,
    required dynamic thirdQuery,
    required T Function(Map<String, dynamic> body) fromJson,
  });
  Future<List<T>> getSortedListByQueryWithFourValues<T>({
    required String collectionName,
    required String firstFieldName,
    required String secondFieldName,
    required String thirdFieldName,
    required String fourthFieldName,
    required dynamic firstQuery,
    required dynamic secondQuery,
    required dynamic thirdQuery,
    required dynamic fourthQuery,
    required T Function(Map<String, dynamic> body) fromJson,
  });

  Future<List<T>> getSortedListByQueryWithfiveValues<T>({
    required String collectionName,
    required String firstFieldName,
    required String secondFieldName,
    required String thirdFieldName,
    required String fourthFieldName,
    required String fifthFieldName,
    required dynamic firstQuery,
    required dynamic secondQuery,
    required dynamic thirdQuery,
    required dynamic fourthQuery,
    required dynamic fifthQuery,
    required T Function(Map<String, dynamic> body) fromJson,
  });

  Future<bool> create({
    //required objectEntity,
    required objectModel,
    required String collectionName,
  });
  Future<bool> setReview({
    //required objectEntity,
    required objectModel,
    //required String collectionName,
  });
  Future<bool> setProduct({
    //required objectEntity,
    required objectModel,
    // required String collectionName,
    // required String typeName,
    // required String categoryName,
  });
  Future<bool> setToCollection({
    required String firstCollection,
    required String secondCollection,
    required String firstID,
    required String secondID,
    required objectModel,
  });
  Future<bool> createCategory({
    //required objectEntity,
    required objectModel,
    required String typeName,
    required String collectionName,
    required String categoryName,
  });
  Future<bool> update({
    required objectEntity,
    required objectModel,
    required String collectionName,
  });
  Future<bool> delete({
    required String id,
    required String collectionName,
  });
  Future<bool> deleteFromCollection({
    required String firstCollection,
    required String secondCollection,
    required String userID,
    required String productID,
  });
}

// ------------------------------------------------------------------------------------------

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

  @override
  Future<String> getID({
    required String collectionName,
  }) async {
    return firestoreDB.collection(collectionName).doc().id;
  }

  @override
  Future<String> getCollectionIdById({
    required String firstCollectionName,
    required String secondCollectionName,
    required String userID,
  }) async {
    return firestoreDB
        .collection(firstCollectionName)
        .doc(userID)
        .collection(secondCollectionName)
        .doc()
        .id;
  }

  // @override
  // Future<String> getCollectionIdById({
  //   required String firstCcollectionName,
  //   required String secondCollectionName,
  //   required objectModel,
  // }) async {
  //   return firestoreDB
  //       .collection(firstCcollectionName)
  //       .doc(objectModel.userId)
  //       .collection(secondCollectionName)
  //       .doc()
  //       .id;
  // }

  @override
  Future<List<T>> getListFromCollectionByUserID<T>({
    required String firstCollection,
    required String secondCollection,
    required String userID,
    required T Function(Map<String, dynamic> body) fromJson,
  }) async {
    List<T> _list = <T>[];
    final _response = await firestoreDB
        .collection(firstCollection)
        .doc(userID)
        .collection(secondCollection)
        .get();
    for (final _doc in _response.docs) {
      //final _doc = <T>.fromJson(doc.data() as Map<String, dynamic>);
      final _object = fromJson(_doc.data());
      _list.add(_object);
    }
    return _list;
  }

  @override
  Future<List<T>> getListFromCollectionByProductID<T>({
    required String firstCollection,
    required String secondCollection,
    required String productID,
    required T Function(Map<String, dynamic> body) fromJson,
  }) async {
    List<T> _list = <T>[];
    final _response = await firestoreDB
        .collection(firstCollection)
        .doc(productID)
        .collection(secondCollection)
        .get();
    for (final _doc in _response.docs) {
      //final _doc = <T>.fromJson(doc.data() as Map<String, dynamic>);
      final _object = fromJson(_doc.data());
      _list.add(_object);
    }
    return _list;
  }

  Future<T> getProductQuantity<T>({
    required String firstCollection,
    required String secondCollection,
    required String productID,
    required String fieldName,
    required dynamic query,
    required T Function(Map<String, dynamic> body) fromJson,
  }) async {
    T? object;
    final _response = await firestoreDB
        .collection(firstCollection)
        .doc(productID)
        .collection(secondCollection)
        .where(
          fieldName,
          isEqualTo: query,
        )
        .get();
    for (final _doc in _response.docs) {
      //final _doc = <T>.fromJson(doc.data() as Map<String, dynamic>);
      object = fromJson(_doc.data());
    }
    return object!;
  }

  @override
  Future<List<T>> getSortedListByQuery<T>({
    required String collectionName,
    required String fieldName,
    required dynamic query,
    required T Function(Map<String, dynamic> body) fromJson,
  }) async {
    List<T> _list = <T>[];
    //final _response = await firestoreDB.collection(collectionName).get();
    final _response = await firestoreDB
        .collection(collectionName)
        .where(
          fieldName,
          isEqualTo: query,
        )
        .get();
    for (final _doc in _response.docs) {
      //final _doc = <T>.fromJson(doc.data() as Map<String, dynamic>);
      final _object = fromJson(_doc.data());
      _list.add(_object);
    }
    return _list;
  }

  @override
  Future<List<ProductModel>> getSortedFakeListByQuery<T>({
    required String collectionName,
    required String fieldName,
    required dynamic query,
    required ProductModel Function(Map<String, dynamic> body) fromJson,
  }) async {
    // List<ProductsListModel> _list = FakeProductData().allFakeProducts;
    // return _list;
    // TODO: implement getSortedFakeListByQuery
    throw UnimplementedError();
  }

  @override
  Future<List<T>> getListByQueryWithTwoValues<T>({
    required String collectionName,
    required String mainFieldName,
    required String firstFieldName,
    required String secondFieldName,
    required dynamic firstQuery,
    required dynamic secondQuery,
    required T Function(Map<String, dynamic> body) fromJson,
  }) async {
    List<T> _list = <T>[];
    //final _response = await firestoreDB.collection(collectionName).get();
    final _response = await firestoreDB
        .collection(collectionName)
        .where(
          mainFieldName + firstFieldName,
          isEqualTo: firstQuery,
        )
        .where(
          mainFieldName + secondFieldName,
          isEqualTo: secondQuery,
        )
        .get();
    for (final _doc in _response.docs) {
      //final _doc = <T>.fromJson(doc.data() as Map<String, dynamic>);
      final _object = fromJson(_doc.data());
      _list.add(_object);
    }
    return _list;
  }

  @override
  Future<List<T>> getListByQueryWithThreeValues<T>({
    required String collectionName,
    required String mainFieldName,
    required String firstFieldName,
    required String secondFieldName,
    required String thirdFieldName,
    required dynamic firstQuery,
    required dynamic secondQuery,
    required dynamic thirdQuery,
    required T Function(Map<String, dynamic> body) fromJson,
  }) async {
    List<T> _list = <T>[];
    //final _response = await firestoreDB.collection(collectionName).get();
    final _response = await firestoreDB
        .collection(collectionName)
        .where(
          mainFieldName + firstFieldName,
          isEqualTo: firstQuery,
        )
        .where(
          mainFieldName + secondFieldName,
          isEqualTo: secondQuery,
        )
        .where(
          mainFieldName + thirdFieldName,
          isEqualTo: thirdQuery,
        )
        .get();
    for (final _doc in _response.docs) {
      //final _doc = <T>.fromJson(doc.data() as Map<String, dynamic>);
      final _object = fromJson(_doc.data());
      _list.add(_object);
    }
    return _list;
  }

  @override
  Future<List<T>> getSortedListByQueryWithFourValues<T>({
    required String collectionName,
    required String firstFieldName,
    required String secondFieldName,
    required String thirdFieldName,
    required String fourthFieldName,
    required dynamic firstQuery,
    required dynamic secondQuery,
    required dynamic thirdQuery,
    required dynamic fourthQuery,
    required T Function(Map<String, dynamic> body) fromJson,
  }) async {
    List<T> _list = <T>[];
    //final _response = await firestoreDB.collection(collectionName).get();
    final _response = await firestoreDB
        .collection(collectionName)
        .where(
          firstFieldName,
          isEqualTo: firstQuery,
        )
        .where(
          secondFieldName,
          isEqualTo: secondQuery,
        )
        .where(
          thirdFieldName,
          isEqualTo: thirdQuery,
        )
        .where(
          fourthFieldName,
          isEqualTo: fourthQuery,
        )
        .get();
    for (final _doc in _response.docs) {
      //final _doc = <T>.fromJson(doc.data() as Map<String, dynamic>);
      final _object = fromJson(_doc.data());
      _list.add(_object);
    }
    return _list;
  }

  @override
  Future<List<T>> getSortedListByQueryWithfiveValues<T>({
    required String collectionName,
    required String firstFieldName,
    required String secondFieldName,
    required String thirdFieldName,
    required String fourthFieldName,
    required String fifthFieldName,
    required dynamic firstQuery,
    required dynamic secondQuery,
    required dynamic thirdQuery,
    required dynamic fourthQuery,
    required dynamic fifthQuery,
    required T Function(Map<String, dynamic> body) fromJson,
  }) async {
    List<T> _list = <T>[];
    //final _response = await firestoreDB.collection(collectionName).get();
    final _response = await firestoreDB
        .collection(collectionName)
        .where(
          firstFieldName,
          whereIn: firstQuery,
        )
        .where(
          secondFieldName,
          whereIn: secondQuery,
        )
        .where(
          thirdFieldName,
          whereIn: thirdQuery,
        )
        .where(
          fourthQuery,
          whereIn: fourthQuery,
        )
        .where(
          fifthFieldName,
          whereIn: fifthQuery,
        )
        .get();
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

  // @override
  // Future<bool> create({
  //   //required objectEntity,
  //   required objectModel,
  //   required String collectionName,
  // }) async {
  //   return await firestoreDB
  //       .collection(collectionName)
  //       // .doc(user.userID)
  //       // .collection('profile')
  //       .doc(objectModel.userID)
  //       .get()
  //       .then((_doc) {
  //     final newObject = objectModel.toJson();
  //     if (!_doc.exists) {
  //       firestoreDB
  //           .collection(collectionName)
  //           .doc(objectModel.userID)
  //           .set(newObject, SetOptions(merge: true));
  //     }
  //     return true;
  //   }).onError((error, stackTrace) {
  //     return false;
  //   });
  // }

  @override
  Future<bool> setToCollection({
    required String firstCollection,
    required String secondCollection,
    required String firstID,
    required String secondID,
    required objectModel,
  }) async {
    return await firestoreDB
        .collection(firstCollection)
        .doc(firstID)
        .collection(secondCollection)
        .doc(secondID)
        .get()
        .then((_doc) {
      final newObject = objectModel.toJson();
      if (!_doc.exists) {
        firestoreDB
            .collection(firstCollection)
            .doc(firstID)
            .collection(secondCollection)
            .doc(secondID)
            .set(newObject, SetOptions(merge: true));
      }
      return true;
    }).onError((error, stackTrace) {
      return false;
    });
  }

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
        .doc(objectModel.id)
        .get()
        .then((_doc) {
      final newObject = objectModel.toJson();
      if (!_doc.exists) {
        firestoreDB
            .collection(collectionName)
            .doc(objectModel.id)
            .set(newObject, SetOptions(merge: true));
        //log('newObject ====>>>> $newObject');
      }
      return true;
    }).onError((error, stackTrace) {
      return false;
    });
  }

  @override
  Future<bool> setReview({
    required objectModel,
    //required String collectionName,
  }) async {
    return await firestoreDB
        .collection('products')
        .doc(objectModel.productID)
        .collection('reviews')
        .doc(objectModel.userID)
        .get()
        .then((_doc) {
      final newObject = objectModel.toJson();
      if (!_doc.exists) {
        firestoreDB
            .collection('products')
            .doc(objectModel.productID)
            .collection('reviews')
            .doc(objectModel.userID)
            .set(newObject, SetOptions(merge: true));
      } else {
        firestoreDB
            .collection('products')
            .doc(objectModel.productID)
            .collection('reviews')
            .doc(objectModel.userID)
            .update(newObject);
      }
      return true;
    }).onError((error, stackTrace) {
      return false;
    });
  }

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
  Future<bool> setProduct({
    //required objectEntity,
    required objectModel,
    //required String typeName,
    // required String collectionName,
    // required String categoryName,
  }) async {
    return await firestoreDB
        .collection('products')
        .doc(objectModel.type)
        .collection(objectModel.type)
        .doc(objectModel.collection)
        .collection(objectModel.collection)
        .doc(objectModel.category)
        .collection(objectModel.category)
        .doc()
        .get()
        .then((_doc) {
      final newObject = objectModel.toJson();
      if (!_doc.exists) {
        firestoreDB
            .collection('products')
            .doc(objectModel.type)
            .collection(objectModel.type)
            .doc(objectModel.collection)
            .collection(objectModel.collection)
            .doc(objectModel.category)
            .collection(objectModel.category)
            .doc()
            .set(newObject, SetOptions(merge: true));
      }
      return true;
    }).onError((error, stackTrace) {
      return false;
    });
  }

  Future<List<T>> getCategoriesList<T>({
    required String typeName,
    required String collectionName,
    required T Function(Map<String, dynamic> body) fromJson,
  }) async {
    List<T> list = <T>[];
    final response = await firestoreDB
        .collection('categories')
        .where('type', isEqualTo: typeName)
        .where('collection', isEqualTo: collectionName)
        .get();
    for (final doc in response.docs) {
      //final _doc = <T>.fromJson(doc.data() as Map<String, dynamic>);
      final object = fromJson(doc.data());
      list.add(object);
    }
    return list;
  }

  @override
  Future<bool> createCategory({
    //required objectEntity,
    required objectModel,
    required String typeName,
    required String collectionName,
    required String categoryName,
  }) async {
    return await firestoreDB
        .collection('categories')
        .doc(typeName)
        .collection(typeName)
        // .doc(user.userID)
        // .collection('profile')
        .doc(collectionName)
        .collection(collectionName)
        // .doc('2')
        // .collection(categoryName)
        .doc()
        .get()
        .then((_doc) {
      final newObject = objectModel.toJson();
      if (!_doc.exists) {
        firestoreDB
            .collection('categories')
            .doc(typeName)
            .collection(typeName)
            .doc(collectionName)
            .collection(collectionName)
            // .doc('2')
            // .collection(categoryName)
            .doc()
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
  Future<bool> delete({
    required String id,
    required String collectionName,
  }) async {
    return await firestoreDB
        .collection(collectionName)
        .doc(id)
        .delete()
        .then((value) => true)
        .onError((error, stackTrace) => false);
  }

  @override
  Future<bool> deleteFromCollection({
    required String firstCollection,
    required String secondCollection,
    required String userID,
    required String productID,
  }) async {
    return await firestoreDB
        .collection(firstCollection)
        .doc(userID)
        .collection(secondCollection)
        .doc(productID)
        .delete()
        .then((value) => true)
        .onError((error, stackTrace) => false);
  }
}
