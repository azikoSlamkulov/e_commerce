import 'package:e_commerce/lib.dart';

abstract class RemoteBrands {
  Future<List<BrandModel>> getAllBrands();
}

class RemoteBrandsImpl implements RemoteBrands {
  final FirestoreCore firestore;

  RemoteBrandsImpl({required this.firestore});

  @override
  Future<List<BrandModel>> getAllBrands() async {
    return await firestore.getList(
      collectionName: 'brands',
      fromJson: brandFromJson,
    );
    //return FakeBrandData().brands;
  }
}
