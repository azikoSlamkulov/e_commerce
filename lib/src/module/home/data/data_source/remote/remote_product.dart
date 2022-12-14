import '../../../../../core/data/remote/firebase/firestore.dart';
import '../../models/product_model.dart';

abstract class RemoteProduct {
  //Future<bool> checkUserExists({required String? userID});
  Future<ProductModel> getProduct({required String productID});
  Future<List<ProductModel>> getAllProducts();
  Future<List<ProductModel>> getAllSortedProductsByQuery({
    required String fieldName,
    required dynamic query,
  });
  Future<bool?> checkProductExist({required productID});
}

class RemoteProductImpl implements RemoteProduct {
  final FirestoreCore firestore;

  RemoteProductImpl({required this.firestore});

  @override
  Future<ProductModel> getProduct({required String productID}) async {
    return await firestore.get(
      id: productID,
      collectionName: 'products',
      fromJson: productFromJson,
    );
  }

  @override
  Future<List<ProductModel>> getAllProducts() async {
    return await firestore.getList(
      collectionName: 'products',
      fromJson: productFromJson,
    );
  }

  @override
  Future<List<ProductModel>> getAllSortedProductsByQuery({
    required String fieldName,
    required dynamic query,
  }) async {
    return await firestore.getSortedListByQuery(
      fieldName: fieldName,
      query: query,
      collectionName: 'products',
      fromJson: productFromJson,
    );
  }

  @override
  Future<bool?> checkProductExist({required productID}) {
    // TODO: implement checkProductExist
    throw UnimplementedError();
  }
}

// class RemoteProductImpl implements RemoteProduct {
//   //final List<ProductModel> destinations;

//   RemoteProductImpl();

//   List<ProductModel> destinations = [
//     ProductModel(
//       productID: '1',
//       brandName: 'adidas',
//       item: 'afff',
//       rating: 5,
//       price: 100,
//       photoURL: '/',
//     ),
//     ProductModel(
//       productID: '2',
//       brandName: 'nike',
//       item: 'aaaa',
//       rating: 5,
//       price: 200,
//       photoURL: '/',
//     ),
//     ProductModel(
//       productID: '3',
//       brandName: 'asa',
//       item: '',
//       rating: 5,
//       price: 50,
//       photoURL: '/',
//     ),
//     ProductModel(
//       productID: '4',
//       brandName: 'fafa',
//       item: '',
//       rating: 5,
//       price: 300,
//       photoURL: '/',
//     ),
//     ProductModel(
//       productID: '5',
//       brandName: 'sdf',
//       item: '',
//       rating: 5,
//       price: 400,
//       photoURL: '/',
//     ),
//   ];

//   // @override
//   // Future<ProductModel> getProduct({required String productID}) async {
//   //   return ProductModel(
//   //     productID: productID,
//   //     brandName: destinations.brandName,
//   //     item: destinations.item,
//   //     rating: destinations.rating,
//   //     price: destinations.price,
//   //     photoURL: destinations.photoURL,
//   //   );
//   // }

//   @override
//   Future<List<ProductModel>> getAllProducts() async {
//     // final allProducts = ProductModel(
//     //   productID: destinations.productID,
//     //   brandName: destinations.brandName,
//     //   item: destinations.item,
//     //   rating: destinations.rating,
//     //   price: destinations.price,
//     //   photoURL: destinations.photoURL,
//     // );

//     final allProducts = destinations;

//     return allProducts;
//   }

//   @override
//   Future<bool?> checkProductExist({required productID}) {
//     // TODO: implement checkProductExist
//     throw UnimplementedError();
//   }

//   @override
//   Future<ProductModel> getProduct({required String productID}) {
//     // TODO: implement getProduct
//     throw UnimplementedError();
//   }
// }
