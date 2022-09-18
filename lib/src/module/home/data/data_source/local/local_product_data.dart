// import 'package:e_commerce/src/module/home/data/models/product_model.dart';

// class LocalProduct {
//   List<ProductModel> localProduct = [
//     ProductModel(
//       productID: '1',
//       brand: 'brand',
//       isFavorite: false,
//       isNew: false,
//       isSale: true,
//       item: 'item',
//       newPrice: 60,
//       price: 80,
//       photoURL:
//           'https://firebasestorage.googleapis.com/v0/b/e-commerce-dab1e.appspot.com/o/product_images%2Fimage1.jpg?alt=media&token=ccec8222-e535-4c7c-9340-400f05f6e5f3',
//       rating: 5,
//       sale: 15,
//     ),
//     ProductModel(
//       productID: '2',
//       brand: 'brand',
//       isFavorite: false,
//       isNew: false,
//       isSale: true,
//       item: 'item',
//       newPrice: 60,
//       price: 80,
//       photoURL:
//           'https://firebasestorage.googleapis.com/v0/b/e-commerce-dab1e.appspot.com/o/product_images%2Fimage1.jpg?alt=media&token=ccec8222-e535-4c7c-9340-400f05f6e5f3',
//       rating: 5,
//       sale: 15,
//     ),
//     ProductModel(
//       productID: '3',
//       brand: 'brand',
//       isFavorite: false,
//       isNew: false,
//       isSale: true,
//       item: 'item',
//       newPrice: 60,
//       price: 80,
//       photoURL:
//           'https://firebasestorage.googleapis.com/v0/b/e-commerce-dab1e.appspot.com/o/product_images%2Fimage1.jpg?alt=media&token=ccec8222-e535-4c7c-9340-400f05f6e5f3',
//       rating: 5,
//       sale: 15,
//     ),
//     ProductModel(
//       productID: '4',
//       brand: 'brand',
//       isFavorite: false,
//       isNew: false,
//       isSale: true,
//       item: 'item',
//       newPrice: 60,
//       price: 80,
//       photoURL:
//           'https://firebasestorage.googleapis.com/v0/b/e-commerce-dab1e.appspot.com/o/product_images%2Fimage1.jpg?alt=media&token=ccec8222-e535-4c7c-9340-400f05f6e5f3',
//       rating: 5,
//       sale: 15,
//     ),
//     ProductModel(
//       productID: '5',
//       brand: 'brand',
//       isFavorite: false,
//       isNew: false,
//       isSale: true,
//       item: 'item',
//       newPrice: 60,
//       price: 80,
//       photoURL:
//           'https://firebasestorage.googleapis.com/v0/b/e-commerce-dab1e.appspot.com/o/product_images%2Fimage1.jpg?alt=media&token=ccec8222-e535-4c7c-9340-400f05f6e5f3',
//       rating: 5,
//       sale: 15,
//     ),
//   ];
// }





// import 'dart:convert';

// import '../../../../../core/data/local/sharedpreferences/local_storage.dart';
// import '../../../../../util/app_constants/texts/app_texts.dart';
// import '../../models/product_model.dart';

// abstract class LocalProduct {
//   Future<bool>? addAllProductsToCache(List<ProductModel> allProducts);
//   List<ProductModel>? getAllProductsFromCache();
//   Future<bool?> clearProductsCache();
// }

// class ProductSharedPreferencesImpl implements LocalProduct {
//   final SharedPreferencesDB productPreferences;
//   ProductSharedPreferencesImpl({required this.productPreferences});

//   @override
//   Future<bool>? addAllProductsToCache(List<ProductModel> allProducts) async {
//     String? allProductsData;
//     for (final _doc in allProducts) {
//       final _allProductsData = json.encode(_doc.toJson());
//       allProductsData = _allProductsData;
//     }
//     //final _allProductsData = json.encode(allProducts.toJson());
//     return await productPreferences.setString(
//         key: AppTexts.allProductsToCacheKey, value: allProductsData!)!;
//   }

//   @override
//   List<ProductModel>? getAllProductsFromCache() {
//     List<ProductModel> _list = <ProductModel>[];
//     final allProducts =
//         productPreferences.getString(key: AppTexts.allProductsToCacheKey);
//     if (allProducts == null) {
//       return null;
//     }
//     final _response = ProductModel.fromJson(json.decode(allProducts));
//     _list.add(_response);
//     return _list;
//   }

//   @override
//   Future<bool?> clearProductsCache() async {
//     return await productPreferences.remove(key: AppTexts.allProductsToCacheKey);
//   }
// }

// // class LocalAuthImpl implements LocalAuth {
// //   final SharedPreferences preferences;
// //   LocalAuthImpl({required this.preferences});

// //   @override
// //   Future<bool>? addUserToCache(AuthModel authModel) async {
// //     final _userData = json.encode(authModel.toJson());
// //     return await preferences.setString(AppTexts.userToCacheKey, _userData);
// //   }

// //   @override
// //   AuthModel? getUserFromCache() {
// //     final _user = preferences.getString(AppTexts.userToCacheKey);
// //     if (_user == null) {
// //       return null;
// //     }
// //     return AuthModel.fromCacheJson(json.decode(_user));
// //   }

// //   @override
// //   Future<bool?> clearCache() async {
// //     return await preferences.remove(AppTexts.userToCacheKey);
// //   }
// //}
