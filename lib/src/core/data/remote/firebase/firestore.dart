//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/core/data/remote/firebase/firebase.dart';

//import '../../../../module/shop/data/models/product_model.dart';
//import '../../../../module/shop/domain/entities/product_entity.dart';
//import '../fake_data/fake_product_data.dart';

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
  Future<List<T>> getListFromCart<T>({
    required String userID,
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
  Future<List<T>> getSortedListByQueryWithTwoValues<T>({
    required String collectionName,
    required String firstFieldName,
    required String secondFieldName,
    required dynamic firstQuery,
    required dynamic secondQuery,
    required T Function(Map<String, dynamic> body) fromJson,
  });
  Future<List<T>> getSortedListByQueryWithThreeValues<T>({
    required String collectionName,
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
  Future<bool> setProduct({
    //required objectEntity,
    required objectModel,
    // required String collectionName,
    // required String typeName,
    // required String categoryName,
  });
  Future<bool> setProductToCart({
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
    required String userID,
    required String collectionName,
  });
  Future<bool> deleteProductFromCart({
    required String userID,
    required String productID,
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

  @override
  Future<List<T>> getListFromCart<T>({
    required String userID,
    required T Function(Map<String, dynamic> body) fromJson,
  }) async {
    List<T> _list = <T>[];
    final _response = await firestoreDB
        .collection('users')
        .doc(userID)
        .collection('bags')
        .get();
    for (final _doc in _response.docs) {
      //final _doc = <T>.fromJson(doc.data() as Map<String, dynamic>);
      final _object = fromJson(_doc.data());
      _list.add(_object);
    }
    return _list;
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
    List<ProductModel> _list = FakeProductData().allFakeProducts;
    return _list;
  }

  @override
  Future<List<T>> getSortedListByQueryWithTwoValues<T>({
    required String collectionName,
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
          firstFieldName,
          isEqualTo: firstQuery,
        )
        .where(
          secondFieldName,
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
  Future<List<T>> getSortedListByQueryWithThreeValues<T>({
    required String collectionName,
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
          fourthQuery,
          isEqualTo: fourthQuery,
        )
        .where(
          fifthFieldName,
          isEqualTo: fifthQuery,
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
  Future<bool> setProductToCart({
    required objectModel,
  }) async {
    return await firestoreDB
        .collection('users')
        .doc(objectModel.userID)
        .collection('bags')
        .doc(objectModel.productID)
        .get()
        .then((_doc) {
      final newObject = objectModel.toJson();
      if (!_doc.exists) {
        firestoreDB
            .collection('users')
            .doc(objectModel.userID)
            .collection('bags')
            .doc(objectModel.productID)
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
        .doc()
        .get()
        .then((_doc) {
      final newObject = objectModel.toJson();
      if (!_doc.exists) {
        firestoreDB
            .collection(collectionName)
            .doc()
            .set(newObject, SetOptions(merge: true));
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

  @override
  Future<bool> deleteProductFromCart({
    required String userID,
    required String productID,
  }) async {
    return await firestoreDB
        .collection('users')
        .doc(userID)
        .collection('bags')
        .doc(productID)
        .delete()
        .then((value) => true)
        .onError((error, stackTrace) => false);
  }
}
