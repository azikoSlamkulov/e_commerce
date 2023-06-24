import 'package:e_commerce/lib.dart';

class FakeFavoritesData {
  List<FavoriteModel> getFavoritesList() {
    final fakeFavoritesList = allFakeFavorites.toList();
    return fakeFavoritesList;
  }

  // List<BagEntity> getBag({
  //   required String type,
  //   required String collection,
  // }) {
  //   final fakeBagsList = allFakeBags
  //       .where((i) => i.type == type)
  //       //.toList()
  //       .where((i) => i.collectionName == collection)
  //       .toList();
  //   return fakeBagsList;
  // }

  List<FavoriteModel> allFakeFavorites = [
    FavoriteModel(
      productID: '0',
      userID: 'Women',
      // categoryName: 'Wedding dress',
      // color: 'White',
      // size: 'L',
      // price: 100,
      // newPrice: 80,
      // isSale: false,
      // sale: 15,
      // productImgUrl:
      //     'https://i.pinimg.com/474x/83/cf/18/83cf1832e706ec7e19fe53382aa398f9.jpg',
      // createdDate: '2023-03-09 21:13:20.136108',
    ),
  ];
}
