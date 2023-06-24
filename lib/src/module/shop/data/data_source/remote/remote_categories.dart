import 'package:e_commerce/lib.dart';

abstract class RemoteCategories {
  Future<List<CategoryModel>> getCategories({
    required String type,
    required String collection,
  });
}

class RemoteCategoriesImpl implements RemoteCategories {
  final FirestoreCore firestore;

  RemoteCategoriesImpl({required this.firestore});

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
}
