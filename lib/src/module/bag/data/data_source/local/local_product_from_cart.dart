import 'package:e_commerce/lib.dart';

abstract class LocalProductsFromCart {
  Future<List<BagModel>> getAllProductsFromCart();

  Future<bool> setProductToCart({
    required BagModel product,
  });

  Future<bool> setNewQuantity({
    required String productID,
    required int newQuantity,
    required double cardTotalPrice,
  });

  Future<bool> deleteProductFromCart({
    required String productID,
  });
}

class LocalProductsFromCartImpl implements LocalProductsFromCart {
  final BagProductDB localDB;

  LocalProductsFromCartImpl({required this.localDB});

  @override
  Future<List<BagModel>> getAllProductsFromCart() async {
    return await localDB.fetchAll();

    //return FakeBagsData().getBagsList();
  }

  @override
  Future<bool> setProductToCart({required BagModel product}) async {
    await localDB.create(product: product);
    return true;
  }

  @override
  Future<bool> setNewQuantity({
    required String productID,
    required int newQuantity,
    required double cardTotalPrice,
  }) async {
    await localDB.update(
      productID: productID,
      newQuantity: newQuantity,
      cardTotalPrice: cardTotalPrice,
    );
    return true;
  }

  @override
  Future<bool> deleteProductFromCart({required String productID}) async {
    await localDB.delete(id: productID);
    return true;
  }
}
