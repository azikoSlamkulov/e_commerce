import 'dart:developer';

import 'package:e_commerce/lib.dart';

abstract class RemoteCategories {
  Future<String> getCategoryID();
  Future<List<CategoryModel>> getCategories({
    required String type,
    required String collection,
  });
  Future<List<CategoryModel>> getAllCategories();
  Future<bool> addCategory({
    required String id,
    required String typeName,
    required String collectionName,
    required String categoryName,
  });
  Future<bool> deleteCategory({
    required String id,
  });
}

class RemoteCategoriesImpl implements RemoteCategories {
  final FirestoreCore firestore;

  RemoteCategoriesImpl({required this.firestore});

  @override
  Future<String> getCategoryID() async {
    return await firestore.getID(
      collectionName: 'categories',
    );
  }

  @override
  Future<List<CategoryModel>> getCategories({
    required String type,
    required String collection,
  }) async {
    return await firestore.getCategoriesList(
      typeName: type,
      collectionName: collection,
      fromJson: categoryFromJson,
    );
    // return FakeCategoriesData().getCategories(
    //   type: type,
    //   collection: collection,
    // );
  }

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    return await firestore.getList(
      collectionName: 'categories',
      fromJson: categoryFromJson,
    );
  }

  @override
  Future<bool> addCategory({
    required String id,
    required String typeName,
    required String collectionName,
    required String categoryName,
  }) async {
    final categoryModel = CategoryModel(
      id: id,
      typeName: typeName,
      collectionName: collectionName,
      categoryName: categoryName,
    );

    return await firestore.create(
      objectModel: categoryModel,
      collectionName: 'categories',
    );
  }

  @override
  Future<bool> deleteCategory({
    required String id,
  }) async {
    return await firestore.delete(
      id: id,
      collectionName: 'categories',
    );
  }
}
