import '../../../../../lib.dart';

class FakeBrandsData {
  List<BrandEntity> getBrandsList({
    required String type,
    required String collection,
  }) {
    final fakeBrandsList = allFakeBrands.toList();
    return fakeBrandsList;
  }

  List<BrandEntity> getBrand({
    required String name,
    required bool isCheked,
  }) {
    final fakeBrandsList = allFakeBrands
        .where((i) => i.name == name)
        //.toList()
        .where((i) => i.isCheked == isCheked)
        .toList();
    return fakeBrandsList;
  }

  List<BrandModel> allFakeBrands = [
    BrandModel(
      id: '0',
      name: 'Adidas',
      isCheked: false,
    ),
    BrandModel(
      id: '1',
      name: 'Nike',
      isCheked: false,
    ),
    BrandModel(
      id: '2',
      name: 'Polo',
      isCheked: false,
    ),
    BrandModel(
      id: '3',
      name: 'Gucci',
      isCheked: false,
    ),
    BrandModel(
      id: '4',
      name: 'Reebok',
      isCheked: false,
    ),
    BrandModel(
      id: '5',
      name: 'Patagonia',
      isCheked: false,
    ),
    BrandModel(
      id: '6',
      name: 'Everlane',
      isCheked: false,
    ),
    BrandModel(
      id: '7',
      name: 'Reformation',
      isCheked: false,
    ),
  ];
}
