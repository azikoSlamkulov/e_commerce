import 'package:e_commerce/src/core/data/remote/firebase/firestore.dart';
import 'package:e_commerce/src/module/shop/data/models/category_model.dart';

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
  }
}
