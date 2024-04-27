import 'package:e_commerce/lib.dart';

// allProducts: allProducts.where((i) => i.isNew == true).toList(),
//                 allProducts: allProducts
//                     .where((i) =>
//                         DateTimeFormatter().isNew(i.createdDate!) == true)
//                     .toList(),

// final allNewProducts =
//     FakeProductData().allFakeProducts.where((i) => i.isNew == true).toList();

// class FakeProductData {
//   // Future<ProductModel> getProduct({required String productID}) async {
//   //   return await firestore.get(
//   //     id: productID,
//   //     collectionName: 'products',
//   //     fromJson: productFromJson,
//   //   );
//   // }

//   Future<List<ProductModel>> getAllProducts() async {
//     // List<ProductModel>? fakeProductsList;
//     // Future.delayed(const Duration(seconds: 2), () {});
//     final fakeProductsList = allFakeProducts.toList();
//     return fakeProductsList;
//   }

//   Future<List<ProductModel>> getProductsByQuery({
//     required String fieldName,
//     required dynamic query,
//   }) async {
//     final fakeProductsList = allFakeProducts
//         .where((i) => i.type == fieldName)
//         .toList()
//         .where((i) => i.collectionName == query)
//         .toList();
//     return fakeProductsList;
//   }

//   Future<List<ProductModel>> getProductsWithTwoValues({
//     required String type,
//     required String collection,
//   }) async {
//     final fakeProductsList = allFakeProducts
//         .where((i) => i.type == type)
//         .toList()
//         .where((i) => i.collectionName == collection)
//         .toList();
//     return fakeProductsList;
//   }

class FakeData {
  Future<List<ProductModel>> getNewAndSaleProducts() async {
    final List<ProductModel> fakeProductsList = [];
    final allNewProducts = allFakeProducts
        .where(
          (i) => i.isNew == true,
        )
        .toList();
    final allSaleProducts =
        allFakeProducts.where((i) => i.isSale == true).toList();
    fakeProductsList.addAll(allNewProducts);
    fakeProductsList.addAll(allSaleProducts);
    return fakeProductsList;
  }

  Future<List<ProductModel>> getProductsWithTwoValues({
    required String type,
    required String collection,
  }) async {
    final fakeProductsList = allFakeProducts
        .where((i) => i.category!.typeName == type)
        .toList()
        .where((i) => i.category!.collectionName == collection)
        .toList();
    return fakeProductsList;
  }

  List<ProductModel> getProductsWithThreeValues({
    required String type,
    required String collection,
    required String category,
  }) {
    final fakeProductsList = allFakeProducts
        .where((i) => i.category!.typeName == type)
        .toList()
        .where((i) => i.category!.collectionName == collection)
        .toList()
        .where((i) => i.category!.categoryName == category)
        .toList();
    return fakeProductsList;
  }

  List<ProductModel> getNewProducts() {
    return allFakeProducts.where((i) => i.isNew == true).toList();
  }

  List<ProductModel> allFakeProducts = [
    /// Women, Clothes, Wedding dress
    const ProductModel(
      productID: '0',
      category: CategoryModel(
        typeName: 'Women',
        collectionName: 'Clothes',
        categoryName: 'Wedding dress',
      ),
      brand: 'Chanel',
      colors: [
        ProductColorModel(quantity: 2, color: 'Black'),
        ProductColorModel(quantity: 5, color: 'White'),
        ProductColorModel(quantity: 2, color: 'Red'),
        ProductColorModel(quantity: 0, color: 'Grey'),
        ProductColorModel(quantity: 0, color: 'Yellow'),
        ProductColorModel(quantity: 2, color: 'Blue'),
      ],
      sizes: [
        ProductSizeModel(quantity: 10, size: 'XS'),
        ProductSizeModel(quantity: 3, size: 'S'),
        ProductSizeModel(quantity: 5, size: 'M'),
        ProductSizeModel(quantity: 0, size: 'L'),
        ProductSizeModel(quantity: 0, size: 'XL')
      ],
      isNew: true,
      isSale: false,
      sale: 15,
      price: 100.00,
      newPrice: 45.00,
      quantity: 100,
      description:
          'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.',
      rating: ProductRatingModel(
        five: 3,
        four: 2,
        three: 2,
        two: 2,
        one: 2,
        totalRating: 3,
        totalUser: 11,
      ),
      imgUrl:
          'https://i.pinimg.com/236x/63/b2/82/63b2824753f907b2acbfdee108153654.jpg',
      createdDate: '2023-03-09 21:13:20.136108',
    ),
    const ProductModel(
      productID: '1',
      category: CategoryModel(
        typeName: 'Women',
        collectionName: 'Clothes',
        categoryName: 'Wedding dress',
      ),
      brand: 'Chanel',
      colors: [
        ProductColorModel(quantity: 2, color: 'Black'),
        ProductColorModel(quantity: 5, color: 'White'),
        ProductColorModel(quantity: 2, color: 'Red'),
        ProductColorModel(quantity: 0, color: 'Grey'),
        ProductColorModel(quantity: 0, color: 'Yellow'),
        ProductColorModel(quantity: 2, color: 'Blue'),
      ],
      sizes: [
        ProductSizeModel(quantity: 10, size: 'XS'),
        ProductSizeModel(quantity: 3, size: 'S'),
        ProductSizeModel(quantity: 5, size: 'M'),
        ProductSizeModel(quantity: 0, size: 'L'),
        ProductSizeModel(quantity: 0, size: 'XL')
      ],
      isNew: false,
      isSale: true,
      sale: 15,
      price: 50.00,
      newPrice: 45.00,
      quantity: 100,
      description:
          'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.',
      rating: ProductRatingModel(
        five: 3,
        four: 2,
        three: 2,
        two: 2,
        one: 2,
        totalRating: 3,
        totalUser: 11,
      ),
      imgUrl:
          'https://cdn-1.azazie.com/upimg/s600/73/89/297895639955097f6462530799c97389.jpg',
      createdDate: '2023-03-09 21:13:20.136108',
    ),
    const ProductModel(
      productID: '2',
      category: CategoryModel(
        typeName: 'Women',
        collectionName: 'Clothes',
        categoryName: 'Wedding dress',
      ),
      brand: 'Chanel',
      colors: [
        ProductColorModel(quantity: 2, color: 'Black'),
        ProductColorModel(quantity: 5, color: 'White'),
        ProductColorModel(quantity: 2, color: 'Red'),
        ProductColorModel(quantity: 0, color: 'Grey'),
        ProductColorModel(quantity: 0, color: 'Yellow'),
        ProductColorModel(quantity: 2, color: 'Blue'),
      ],
      sizes: [
        ProductSizeModel(quantity: 10, size: 'XS'),
        ProductSizeModel(quantity: 3, size: 'S'),
        ProductSizeModel(quantity: 5, size: 'M'),
        ProductSizeModel(quantity: 0, size: 'L'),
        ProductSizeModel(quantity: 0, size: 'XL')
      ],
      isNew: false,
      isSale: false,
      sale: 15,
      price: 40.00,
      newPrice: 35.00,
      quantity: 100,
      description:
          'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.',
      rating: ProductRatingModel(
        five: 3,
        four: 2,
        three: 2,
        two: 2,
        one: 2,
        totalRating: 3,
        totalUser: 11,
      ),
      imgUrl:
          'https://i.pinimg.com/474x/83/cf/18/83cf1832e706ec7e19fe53382aa398f9.jpg',
      createdDate: '2023-03-09 21:13:20.136108',
    ),
    const ProductModel(
      productID: '3',
      category: CategoryModel(
        typeName: 'Women',
        collectionName: 'Clothes',
        categoryName: 'Wedding dress',
      ),
      brand: 'Polo',
      colors: [
        ProductColorModel(quantity: 2, color: 'Black'),
        ProductColorModel(quantity: 5, color: 'White'),
        ProductColorModel(quantity: 2, color: 'Red'),
        ProductColorModel(quantity: 0, color: 'Grey'),
        ProductColorModel(quantity: 0, color: 'Yellow'),
        ProductColorModel(quantity: 2, color: 'Blue'),
      ],
      sizes: [
        ProductSizeModel(quantity: 10, size: 'XS'),
        ProductSizeModel(quantity: 3, size: 'S'),
        ProductSizeModel(quantity: 5, size: 'M'),
        ProductSizeModel(quantity: 0, size: 'L'),
        ProductSizeModel(quantity: 0, size: 'XL')
      ],
      isNew: false,
      isSale: false,
      sale: 15,
      price: 70.00,
      newPrice: 45.00,
      quantity: 100,
      description:
          'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.',
      rating: ProductRatingModel(
        five: 3,
        four: 2,
        three: 2,
        two: 2,
        one: 2,
        totalRating: 3,
        totalUser: 11,
      ),
      imgUrl:
          'https://www.kleinfeldbridal.com/wp-content/uploads/2023/02/mikaella-crepe-fit-and-flare-wedding-dress-with-detachable-off-the-shoulder-sleeves-34648337-400x580.jpg',
      createdDate: '2023-03-09 21:13:20.136108',
    ),
    const ProductModel(
      productID: '4',
      category: CategoryModel(
        typeName: 'Women',
        collectionName: 'Clothes',
        categoryName: 'Wedding dress',
      ),
      brand: 'Polo',
      colors: [
        ProductColorModel(quantity: 2, color: 'Black'),
        ProductColorModel(quantity: 5, color: 'White'),
        ProductColorModel(quantity: 2, color: 'Red'),
        ProductColorModel(quantity: 0, color: 'Grey'),
        ProductColorModel(quantity: 0, color: 'Yellow'),
        ProductColorModel(quantity: 2, color: 'Blue'),
      ],
      sizes: [
        ProductSizeModel(quantity: 10, size: 'XS'),
        ProductSizeModel(quantity: 3, size: 'S'),
        ProductSizeModel(quantity: 5, size: 'M'),
        ProductSizeModel(quantity: 0, size: 'L'),
        ProductSizeModel(quantity: 0, size: 'XL')
      ],
      isNew: false,
      isSale: false,
      sale: 15,
      price: 150.00,
      newPrice: 45.00,
      quantity: 100,
      description:
          'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.',
      rating: ProductRatingModel(
        five: 3,
        four: 2,
        three: 2,
        two: 2,
        one: 2,
        totalRating: 3,
        totalUser: 11,
      ),
      imgUrl:
          'https://images.squarespace-cdn.com/content/v1/580edd8946c3c44e7d444f1a/1597314609635-AAI95UUPFMSUJJNW477J/Cooper_1.jpg?format=300w',
      createdDate: '2023-03-09 21:13:20.136108',
    ),

    ////////////////////////////////////////////////////////////////
    const ProductModel(
      productID: '5',
      category: CategoryModel(
        typeName: 'Women',
        collectionName: 'Clothes',
        categoryName: 'Sweater',
      ),
      brand: 'Polo',
      colors: [
        ProductColorModel(quantity: 2, color: 'Black'),
        ProductColorModel(quantity: 5, color: 'White'),
        ProductColorModel(quantity: 2, color: 'Red'),
        ProductColorModel(quantity: 0, color: 'Grey'),
        ProductColorModel(quantity: 0, color: 'Yellow'),
        ProductColorModel(quantity: 2, color: 'Blue'),
      ],
      sizes: [
        ProductSizeModel(quantity: 10, size: 'XS'),
        ProductSizeModel(quantity: 3, size: 'S'),
        ProductSizeModel(quantity: 5, size: 'M'),
        ProductSizeModel(quantity: 0, size: 'L'),
        ProductSizeModel(quantity: 0, size: 'XL')
      ],
      isNew: true,
      isSale: false,
      sale: 15,
      price: 40.00,
      newPrice: 35.00,
      quantity: 100,
      description:
          'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.',
      rating: ProductRatingModel(
        five: 3,
        four: 2,
        three: 2,
        two: 2,
        one: 2,
        totalRating: 3,
        totalUser: 11,
      ),
      imgUrl:
          'https://rukminim1.flixcart.com/image/612/612/kg2l47k0/sweater/u/e/h/s-lt2614-lightbeige-cayman-original-imafwdy2ezyrhgu3.jpeg?q=70',
      createdDate: '2023-03-09 21:13:20.136108',
    ),
    const ProductModel(
      productID: '6',
      category: CategoryModel(
        typeName: 'Women',
        collectionName: 'Clothes',
        categoryName: 'Sweater',
      ),
      brand: 'Polo',
      colors: [
        ProductColorModel(quantity: 2, color: 'Black'),
        ProductColorModel(quantity: 5, color: 'White'),
        ProductColorModel(quantity: 2, color: 'Red'),
        ProductColorModel(quantity: 0, color: 'Grey'),
        ProductColorModel(quantity: 0, color: 'Yellow'),
        ProductColorModel(quantity: 2, color: 'Blue'),
      ],
      sizes: [
        ProductSizeModel(quantity: 10, size: 'XS'),
        ProductSizeModel(quantity: 3, size: 'S'),
        ProductSizeModel(quantity: 5, size: 'M'),
        ProductSizeModel(quantity: 0, size: 'L'),
        ProductSizeModel(quantity: 0, size: 'XL')
      ],
      isNew: false,
      isSale: true,
      sale: 15,
      price: 75.00,
      newPrice: 45.00,
      quantity: 100,
      description:
          'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.',
      rating: ProductRatingModel(
        five: 3,
        four: 2,
        three: 2,
        two: 2,
        one: 2,
        totalRating: 3,
        totalUser: 11,
      ),
      imgUrl:
          'https://img.guess.com/image/upload/f_auto,q_auto:eco,fl_strip_profile,dpr_1.5,fl_advanced_resize,fl_progressive,w_392,c_scale/v1/NA/Style/ECOMM/W3RR18Z2WL0-G1O6',
      createdDate: '2023-03-09 21:13:20.136108',
    ),
    const ProductModel(
      productID: '7',
      category: CategoryModel(
        typeName: 'Women',
        collectionName: 'Clothes',
        categoryName: 'Sweater',
      ),
      brand: 'Polo',
      colors: [
        ProductColorModel(quantity: 2, color: 'Black'),
        ProductColorModel(quantity: 5, color: 'White'),
        ProductColorModel(quantity: 2, color: 'Red'),
        ProductColorModel(quantity: 0, color: 'Grey'),
        ProductColorModel(quantity: 0, color: 'Yellow'),
        ProductColorModel(quantity: 2, color: 'Blue'),
      ],
      sizes: [
        ProductSizeModel(quantity: 10, size: 'XS'),
        ProductSizeModel(quantity: 3, size: 'S'),
        ProductSizeModel(quantity: 5, size: 'M'),
        ProductSizeModel(quantity: 0, size: 'L'),
        ProductSizeModel(quantity: 0, size: 'XL')
      ],
      isNew: false,
      isSale: false,
      sale: 15,
      price: 70.00,
      newPrice: 45.00,
      quantity: 100,
      description:
          'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.',
      rating: ProductRatingModel(
        five: 3,
        four: 2,
        three: 2,
        two: 2,
        one: 2,
        totalRating: 3,
        totalUser: 11,
      ),
      imgUrl:
          'https://cdn.shopify.com/s/files/1/0895/4002/products/PRODUCTIMAGEcopy3_66.png?v=1666192915&width=533',
      createdDate: '2023-03-09 21:13:20.136108',
    ),
    const ProductModel(
      productID: '8',
      category: CategoryModel(
        typeName: 'Women',
        collectionName: 'Clothes',
        categoryName: 'Sweater',
      ),
      brand: 'Polo',
      colors: [
        ProductColorModel(quantity: 2, color: 'Black'),
        ProductColorModel(quantity: 5, color: 'White'),
        ProductColorModel(quantity: 2, color: 'Red'),
        ProductColorModel(quantity: 0, color: 'Grey'),
        ProductColorModel(quantity: 0, color: 'Yellow'),
        ProductColorModel(quantity: 2, color: 'Blue'),
      ],
      sizes: [
        ProductSizeModel(quantity: 10, size: 'XS'),
        ProductSizeModel(quantity: 3, size: 'S'),
        ProductSizeModel(quantity: 5, size: 'M'),
        ProductSizeModel(quantity: 0, size: 'L'),
        ProductSizeModel(quantity: 0, size: 'XL')
      ],
      isNew: false,
      isSale: false,
      sale: 15,
      price: 50.00,
      newPrice: 45.00,
      quantity: 100,
      description:
          'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.',
      rating: ProductRatingModel(
        five: 3,
        four: 2,
        three: 2,
        two: 2,
        one: 2,
        totalRating: 3,
        totalUser: 11,
      ),
      imgUrl:
          'https://rukminim1.flixcart.com/image/612/612/kfwvcsw0/sweater/v/b/5/xl-lt2614-maroon-cayman-original-imafw9njsr7rcprg.jpeg?q=70',
      createdDate: '2023-03-09 21:13:20.136108',
    ),
    const ProductModel(
      productID: '9',
      category: CategoryModel(
        typeName: 'Women',
        collectionName: 'Clothes',
        categoryName: 'Sweater',
      ),
      brand: 'Polo',
      colors: [
        ProductColorModel(quantity: 2, color: 'Black'),
        ProductColorModel(quantity: 5, color: 'White'),
        ProductColorModel(quantity: 2, color: 'Red'),
        ProductColorModel(quantity: 0, color: 'Grey'),
        ProductColorModel(quantity: 0, color: 'Yellow'),
        ProductColorModel(quantity: 2, color: 'Blue'),
      ],
      sizes: [
        ProductSizeModel(quantity: 10, size: 'XS'),
        ProductSizeModel(quantity: 3, size: 'S'),
        ProductSizeModel(quantity: 5, size: 'M'),
        ProductSizeModel(quantity: 0, size: 'L'),
        ProductSizeModel(quantity: 0, size: 'XL')
      ],
      isNew: false,
      isSale: false,
      sale: 15,
      price: 45.00,
      newPrice: 45.00,
      quantity: 100,
      description:
          'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.',
      rating: ProductRatingModel(
        five: 3,
        four: 2,
        three: 2,
        two: 2,
        one: 2,
        totalRating: 3,
        totalUser: 11,
      ),
      imgUrl:
          'https://media1.popsugar-assets.com/files/thumbor/a1j_EjtrnZXqAYrwwKBZtRfQE1c/fit-in/728xorig/filters:format_auto-!!-:strip_icc-!!-/2020/11/11/975/n/1922564/7f1730ba5a0a7f0c_netimgdVncO3/i/Memela-Women-Cable-Knit-Fleece-Lined-Warm-Hooded-Sweater-Coat.jpg',
      createdDate: '2023-03-09 21:13:20.136108',
    ),

    //////////
    const ProductModel(
      productID: '10',
      category: CategoryModel(
        typeName: 'Women',
        collectionName: 'Clothes',
        categoryName: 'Sweater',
      ),
      brand: 'Polo',
      colors: [
        ProductColorModel(quantity: 2, color: 'Black'),
        ProductColorModel(quantity: 5, color: 'White'),
        ProductColorModel(quantity: 2, color: 'Red'),
        ProductColorModel(quantity: 0, color: 'Grey'),
        ProductColorModel(quantity: 0, color: 'Yellow'),
        ProductColorModel(quantity: 2, color: 'Blue'),
      ],
      sizes: [
        ProductSizeModel(quantity: 10, size: 'XS'),
        ProductSizeModel(quantity: 3, size: 'S'),
        ProductSizeModel(quantity: 5, size: 'M'),
        ProductSizeModel(quantity: 0, size: 'L'),
        ProductSizeModel(quantity: 0, size: 'XL')
      ],
      isNew: true,
      isSale: false,
      sale: 15,
      price: 80.00,
      newPrice: 45.00,
      quantity: 100,
      description:
          'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.',
      rating: ProductRatingModel(
        five: 3,
        four: 2,
        three: 2,
        two: 2,
        one: 2,
        totalRating: 3,
        totalUser: 11,
      ),
      imgUrl: 'https://www.dhresource.com/albu_825883902_00/1.0x0.jpg',
      createdDate: '2023-03-09 21:13:20.136108',
    ),
    const ProductModel(
      productID: '11',
      category: CategoryModel(
        typeName: 'Women',
        collectionName: 'Clothes',
        categoryName: 'Sweater',
      ),
      brand: 'Polo',
      colors: [
        ProductColorModel(quantity: 2, color: 'Black'),
        ProductColorModel(quantity: 5, color: 'White'),
        ProductColorModel(quantity: 2, color: 'Red'),
        ProductColorModel(quantity: 0, color: 'Grey'),
        ProductColorModel(quantity: 0, color: 'Yellow'),
        ProductColorModel(quantity: 2, color: 'Blue'),
      ],
      sizes: [
        ProductSizeModel(quantity: 10, size: 'XS'),
        ProductSizeModel(quantity: 3, size: 'S'),
        ProductSizeModel(quantity: 5, size: 'M'),
        ProductSizeModel(quantity: 0, size: 'L'),
        ProductSizeModel(quantity: 0, size: 'XL')
      ],
      isNew: true,
      isSale: false,
      sale: 15,
      price: 70.00,
      newPrice: 45.00,
      quantity: 100,
      description:
          'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.',
      rating: ProductRatingModel(
        five: 3,
        four: 2,
        three: 2,
        two: 2,
        one: 2,
        totalRating: 3,
        totalUser: 11,
      ),
      imgUrl:
          'https://cdn.shopify.com/s/files/1/0264/0225/8995/products/USASLT220001_A_533x.jpg?v=1665171442',
    ),
    const ProductModel(
      productID: '12',
      category: CategoryModel(
        typeName: 'Women',
        collectionName: 'Clothes',
        categoryName: 'Sweater',
      ),
      brand: 'Polo',
      colors: [
        ProductColorModel(quantity: 2, color: 'Black'),
        ProductColorModel(quantity: 5, color: 'White'),
        ProductColorModel(quantity: 2, color: 'Red'),
        ProductColorModel(quantity: 0, color: 'Grey'),
        ProductColorModel(quantity: 0, color: 'Yellow'),
        ProductColorModel(quantity: 2, color: 'Blue'),
      ],
      sizes: [
        ProductSizeModel(quantity: 10, size: 'XS'),
        ProductSizeModel(quantity: 3, size: 'S'),
        ProductSizeModel(quantity: 5, size: 'M'),
        ProductSizeModel(quantity: 0, size: 'L'),
        ProductSizeModel(quantity: 0, size: 'XL')
      ],
      isNew: false,
      isSale: true,
      sale: 15,
      price: 60.00,
      newPrice: 45.00,
      quantity: 100,
      description:
          'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.',
      rating: ProductRatingModel(
        five: 3,
        four: 2,
        three: 2,
        two: 2,
        one: 2,
        totalRating: 3,
        totalUser: 11,
      ),
      imgUrl:
          'https://cdn.shopify.com/s/files/1/0180/9761/products/018A3642_600x.jpg?v=1537479955',
    ),
    const ProductModel(
      productID: '13',
      category: CategoryModel(
        typeName: 'Women',
        collectionName: 'Clothes',
        categoryName: 'Sweater',
      ),
      brand: 'Polo',
      colors: [
        ProductColorModel(quantity: 2, color: 'Black'),
        ProductColorModel(quantity: 5, color: 'White'),
        ProductColorModel(quantity: 2, color: 'Red'),
        ProductColorModel(quantity: 0, color: 'Grey'),
        ProductColorModel(quantity: 0, color: 'Yellow'),
        ProductColorModel(quantity: 2, color: 'Blue'),
      ],
      sizes: [
        ProductSizeModel(quantity: 10, size: 'XS'),
        ProductSizeModel(quantity: 3, size: 'S'),
        ProductSizeModel(quantity: 5, size: 'M'),
        ProductSizeModel(quantity: 0, size: 'L'),
        ProductSizeModel(quantity: 0, size: 'XL')
      ],
      isNew: false,
      isSale: false,
      sale: 15,
      price: 65.00,
      newPrice: 45.00,
      quantity: 100,
      description:
          'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.',
      rating: ProductRatingModel(
        five: 3,
        four: 2,
        three: 2,
        two: 2,
        one: 2,
        totalRating: 3,
        totalUser: 11,
      ),
      imgUrl:
          'https://rukminim1.flixcart.com/image/400/400/l33cia80/t-shirt/t/w/y/xl-4672-75-funday-fashion-original-imageah3n6svmpwx.jpeg?q=70',
    ),
    const ProductModel(
      productID: '14',
      //name: 'T-shirts',
      category: CategoryModel(
        typeName: 'Women',
        collectionName: 'Clothes',
        categoryName: 'Sweater',
      ),
      brand: 'Polo',
      colors: [
        ProductColorModel(quantity: 2, color: 'Black'),
        ProductColorModel(quantity: 5, color: 'White'),
        ProductColorModel(quantity: 2, color: 'Red'),
        ProductColorModel(quantity: 0, color: 'Grey'),
        ProductColorModel(quantity: 0, color: 'Yellow'),
        ProductColorModel(quantity: 2, color: 'Blue'),
      ],
      sizes: [
        ProductSizeModel(quantity: 10, size: 'XS'),
        ProductSizeModel(quantity: 3, size: 'S'),
        ProductSizeModel(quantity: 5, size: 'M'),
        ProductSizeModel(quantity: 0, size: 'L'),
        ProductSizeModel(quantity: 0, size: 'XL')
      ],
      isNew: false,
      isSale: false,
      sale: 15,
      price: 90.00,
      newPrice: 45.00,
      quantity: 100,
      description:
          'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.',
      rating: ProductRatingModel(
        five: 3,
        four: 2,
        three: 2,
        two: 2,
        one: 2,
        totalRating: 3,
        totalUser: 11,
      ),
      imgUrl:
          'https://rukminim1.flixcart.com/image/612/612/xif0q/t-shirt/b/5/l/xxl-w-necktop-white-base-41-original-imag76qzzkteyasp-bb.jpeg?q=70',
    ),
    const ProductModel(
      productID: '15',
      category: CategoryModel(
        typeName: 'Women',
        collectionName: 'Clothes',
        categoryName: 'Sweater',
      ),
      brand: 'Polo',
      colors: [
        ProductColorModel(quantity: 2, color: 'Black'),
        ProductColorModel(quantity: 5, color: 'White'),
        ProductColorModel(quantity: 2, color: 'Red'),
        ProductColorModel(quantity: 0, color: 'Grey'),
        ProductColorModel(quantity: 0, color: 'Yellow'),
        ProductColorModel(quantity: 2, color: 'Blue'),
      ],
      sizes: [
        ProductSizeModel(quantity: 10, size: 'XS'),
        ProductSizeModel(quantity: 3, size: 'S'),
        ProductSizeModel(quantity: 5, size: 'M'),
        ProductSizeModel(quantity: 0, size: 'L'),
        ProductSizeModel(quantity: 0, size: 'XL')
      ],
      isNew: false,
      isSale: false,
      sale: 15,
      price: 125.00,
      newPrice: 45.00,
      quantity: 100,
      description:
          'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.',
      rating: ProductRatingModel(
        five: 3,
        four: 2,
        three: 2,
        two: 2,
        one: 2,
        totalRating: 3,
        totalUser: 11,
      ),
      imgUrl:
          'https://rukminim1.flixcart.com/image/612/612/ktd9mkw0/t-shirt/q/h/j/l-necktop-red-base-41-original-imag6qdhgygmybkh.jpeg?q=70',
    ),

    // //////////////
    const ProductModel(
      productID: '16',
      category: CategoryModel(
        typeName: 'Women',
        collectionName: 'Clothes',
        categoryName: 'T-shirt',
      ),
      brand: 'Polo',
      colors: [
        ProductColorModel(quantity: 2, color: 'Black'),
        ProductColorModel(quantity: 5, color: 'White'),
        ProductColorModel(quantity: 2, color: 'Red'),
        ProductColorModel(quantity: 0, color: 'Grey'),
        ProductColorModel(quantity: 0, color: 'Yellow'),
        ProductColorModel(quantity: 2, color: 'Blue'),
      ],
      sizes: [
        ProductSizeModel(quantity: 10, size: 'XS'),
        ProductSizeModel(quantity: 3, size: 'S'),
        ProductSizeModel(quantity: 5, size: 'M'),
        ProductSizeModel(quantity: 0, size: 'L'),
        ProductSizeModel(quantity: 0, size: 'XL')
      ],
      isNew: true,
      isSale: false,
      sale: 15,
      price: 150.00,
      newPrice: 45.00,
      quantity: 100,
      description:
          'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.',
      rating: ProductRatingModel(
        five: 3,
        four: 2,
        three: 2,
        two: 2,
        one: 2,
        totalRating: 3,
        totalUser: 11,
      ),
      imgUrl:
          'https://image.spreadshirtmedia.com/image-server/v1/mp/products/T813A645PA4249PT17X57Y125D1043076753W16366H3551/views/1,width=378,height=378,appearanceId=645,backgroundColor=F2F2F2,modelId=344,crop=list/amazing-grace.jpg',
    ),
    const ProductModel(
      productID: '17',
      category: CategoryModel(
        typeName: 'Women',
        collectionName: 'Clothes',
        categoryName: 'T-shirt',
      ),
      brand: 'Polo',
      colors: [
        ProductColorModel(quantity: 2, color: 'Black'),
        ProductColorModel(quantity: 5, color: 'White'),
        ProductColorModel(quantity: 2, color: 'Red'),
        ProductColorModel(quantity: 0, color: 'Grey'),
        ProductColorModel(quantity: 0, color: 'Yellow'),
        ProductColorModel(quantity: 2, color: 'Blue'),
      ],
      sizes: [
        ProductSizeModel(quantity: 10, size: 'XS'),
        ProductSizeModel(quantity: 3, size: 'S'),
        ProductSizeModel(quantity: 5, size: 'M'),
        ProductSizeModel(quantity: 0, size: 'L'),
        ProductSizeModel(quantity: 0, size: 'XL')
      ],
      isNew: false,
      isSale: true,
      sale: 15,
      price: 170.00,
      newPrice: 45.00,
      quantity: 100,
      description:
          'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.',
      rating: ProductRatingModel(
        five: 3,
        four: 2,
        three: 2,
        two: 2,
        one: 2,
        totalRating: 3,
        totalUser: 11,
      ),
      imgUrl: 'https://m.media-amazon.com/images/I/61O4jzwgoDL._AC_SY606_.jpg',
    ),
    const ProductModel(
      productID: '18',
      category: CategoryModel(
        typeName: 'Women',
        collectionName: 'Clothes',
        categoryName: 'T-shirt',
      ),
      brand: 'Polo',
      colors: [
        ProductColorModel(quantity: 2, color: 'Black'),
        ProductColorModel(quantity: 5, color: 'White'),
        ProductColorModel(quantity: 2, color: 'Red'),
        ProductColorModel(quantity: 0, color: 'Grey'),
        ProductColorModel(quantity: 0, color: 'Yellow'),
        ProductColorModel(quantity: 2, color: 'Blue'),
      ],
      sizes: [
        ProductSizeModel(quantity: 10, size: 'XS'),
        ProductSizeModel(quantity: 3, size: 'S'),
        ProductSizeModel(quantity: 5, size: 'M'),
        ProductSizeModel(quantity: 0, size: 'L'),
        ProductSizeModel(quantity: 0, size: 'XL')
      ],
      isNew: false,
      isSale: false,
      sale: 15,
      price: 65.00,
      newPrice: 45.00,
      quantity: 100,
      description:
          'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.',
      rating: ProductRatingModel(
        five: 3,
        four: 2,
        three: 2,
        two: 2,
        one: 2,
        totalRating: 3,
        totalUser: 11,
      ),
      imgUrl:
          'https://image.spreadshirtmedia.com/image-server/v1/products/T348A391PA4286PT17X24Y31D1029601079W20306H24993/views/1,width=378,height=378,appearanceId=391,backgroundColor=F2F2F2,modelId=362,crop=list/4-20-on-4-20-2020-there-will-be-4-twenties.jpg',
    ),
    const ProductModel(
      productID: '19',
      category: CategoryModel(
        typeName: 'Women',
        collectionName: 'Clothes',
        categoryName: 'T-shirt',
      ),
      brand: 'Polo',
      colors: [
        ProductColorModel(quantity: 2, color: 'Black'),
        ProductColorModel(quantity: 5, color: 'White'),
        ProductColorModel(quantity: 2, color: 'Red'),
        ProductColorModel(quantity: 0, color: 'Grey'),
        ProductColorModel(quantity: 0, color: 'Yellow'),
        ProductColorModel(quantity: 2, color: 'Blue'),
      ],
      sizes: [
        ProductSizeModel(quantity: 10, size: 'XS'),
        ProductSizeModel(quantity: 3, size: 'S'),
        ProductSizeModel(quantity: 5, size: 'M'),
        ProductSizeModel(quantity: 0, size: 'L'),
        ProductSizeModel(quantity: 0, size: 'XL')
      ],
      isNew: false,
      isSale: false,
      sale: 15,
      price: 45.00,
      newPrice: 45.00,
      quantity: 100,
      description:
          'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.',
      rating: ProductRatingModel(
        five: 3,
        four: 2,
        three: 2,
        two: 2,
        one: 2,
        totalRating: 3,
        totalUser: 11,
      ),
      imgUrl:
          'https://i5.walmartimages.com/asr/294a5ce1-98d2-4b12-b8d6-b0c522cee9cb_1.e8ef85492ad3831b8af10b6139d0970b.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF',
    ),
    const ProductModel(
      productID: '20',
      category: CategoryModel(
        typeName: 'Women',
        collectionName: 'Clothes',
        categoryName: 'T-shirt',
      ),
      brand: 'Polo',
      colors: [
        ProductColorModel(quantity: 2, color: 'Black'),
        ProductColorModel(quantity: 5, color: 'White'),
        ProductColorModel(quantity: 2, color: 'Red'),
        ProductColorModel(quantity: 0, color: 'Grey'),
        ProductColorModel(quantity: 0, color: 'Yellow'),
        ProductColorModel(quantity: 2, color: 'Blue'),
      ],
      sizes: [
        ProductSizeModel(quantity: 10, size: 'XS'),
        ProductSizeModel(quantity: 3, size: 'S'),
        ProductSizeModel(quantity: 5, size: 'M'),
        ProductSizeModel(quantity: 0, size: 'L'),
        ProductSizeModel(quantity: 0, size: 'XL')
      ],
      isNew: false,
      isSale: false,
      sale: 15,
      price: 50.00,
      newPrice: 45.00,
      quantity: 100,
      description:
          'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.',
      rating: ProductRatingModel(
        five: 3,
        four: 2,
        three: 2,
        two: 2,
        one: 2,
        totalRating: 3,
        totalUser: 11,
      ),
      imgUrl:
          'https://4.imimg.com/data4/AA/HC/MY-26596027/men-s-fancy-t-shirt.jpg',
    ),

    // //////
    const ProductModel(
      productID: '21',
      category: CategoryModel(
        typeName: 'Women',
        collectionName: 'Clothes',
        categoryName: 'Sheath dress',
      ),
      brand: 'Polo',
      colors: [
        ProductColorModel(quantity: 2, color: 'Black'),
        ProductColorModel(quantity: 5, color: 'White'),
        ProductColorModel(quantity: 2, color: 'Red'),
        ProductColorModel(quantity: 0, color: 'Grey'),
        ProductColorModel(quantity: 0, color: 'Yellow'),
        ProductColorModel(quantity: 2, color: 'Blue'),
      ],
      sizes: [
        ProductSizeModel(quantity: 10, size: 'XS'),
        ProductSizeModel(quantity: 3, size: 'S'),
        ProductSizeModel(quantity: 5, size: 'M'),
        ProductSizeModel(quantity: 0, size: 'L'),
        ProductSizeModel(quantity: 0, size: 'XL')
      ],
      isNew: true,
      isSale: false,
      sale: 15,
      price: 130.00,
      newPrice: 45.00,
      quantity: 100,
      description:
          'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.',
      rating: ProductRatingModel(
        five: 3,
        four: 2,
        three: 2,
        two: 2,
        one: 2,
        totalRating: 3,
        totalUser: 11,
      ),
      ////////
      imgUrl:
          'https://slimages.macysassets.com/is/image/MCY/products/9/optimized/15686089_fpx.tif?op_sharpen=1&wid=700&hei=855&fit=fit,1',
    ),
    const ProductModel(
      productID: '22',
      category: CategoryModel(
        typeName: 'Women',
        collectionName: 'Clothes',
        categoryName: 'Sheath dress',
      ),
      brand: 'Polo',
      colors: [
        ProductColorModel(quantity: 2, color: 'Black'),
        ProductColorModel(quantity: 5, color: 'White'),
        ProductColorModel(quantity: 2, color: 'Red'),
        ProductColorModel(quantity: 0, color: 'Grey'),
        ProductColorModel(quantity: 0, color: 'Yellow'),
        ProductColorModel(quantity: 2, color: 'Blue'),
      ],
      sizes: [
        ProductSizeModel(quantity: 10, size: 'XS'),
        ProductSizeModel(quantity: 3, size: 'S'),
        ProductSizeModel(quantity: 5, size: 'M'),
        ProductSizeModel(quantity: 0, size: 'L'),
        ProductSizeModel(quantity: 0, size: 'XL')
      ],
      isNew: false,
      isSale: true,
      sale: 15,
      price: 80.00,
      newPrice: 45.00,
      quantity: 100,
      description:
          'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.',
      rating: ProductRatingModel(
        five: 3,
        four: 2,
        three: 2,
        two: 2,
        one: 2,
        totalRating: 3,
        totalUser: 11,
      ),
      imgUrl:
          'https://n.nordstrommedia.com/id/sr3/ff6f3d6c-4c3c-450a-8db6-78f5f992fcb2.jpeg?h=365&w=240&dpr=2',
    ),
    const ProductModel(
      productID: '23',
      category: CategoryModel(
        typeName: 'Women',
        collectionName: 'Clothes',
        categoryName: 'Sheath dress',
      ),
      brand: 'Polo',
      colors: [
        ProductColorModel(quantity: 2, color: 'Black'),
        ProductColorModel(quantity: 5, color: 'White'),
        ProductColorModel(quantity: 2, color: 'Red'),
        ProductColorModel(quantity: 0, color: 'Grey'),
        ProductColorModel(quantity: 0, color: 'Yellow'),
        ProductColorModel(quantity: 2, color: 'Blue'),
      ],
      sizes: [
        ProductSizeModel(quantity: 10, size: 'XS'),
        ProductSizeModel(quantity: 3, size: 'S'),
        ProductSizeModel(quantity: 5, size: 'M'),
        ProductSizeModel(quantity: 0, size: 'L'),
        ProductSizeModel(quantity: 0, size: 'XL')
      ],
      isNew: false,
      isSale: false,
      sale: 15,
      price: 180.00,
      newPrice: 45.00,
      quantity: 100,
      description:
          'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.',
      rating: ProductRatingModel(
        five: 3,
        four: 2,
        three: 2,
        two: 2,
        one: 2,
        totalRating: 3,
        totalUser: 11,
      ),
      imgUrl:
          'https://cdn.shopify.com/s/files/1/0516/1454/8144/products/A21207P_1976520_6_600x.jpg',
    ),
    const ProductModel(
      productID: '24',
      category: CategoryModel(
        typeName: 'Women',
        collectionName: 'Clothes',
        categoryName: 'Sheath dress',
      ),
      brand: 'Polo',
      colors: [
        ProductColorModel(quantity: 2, color: 'Black'),
        ProductColorModel(quantity: 5, color: 'White'),
        ProductColorModel(quantity: 2, color: 'Red'),
        ProductColorModel(quantity: 0, color: 'Grey'),
        ProductColorModel(quantity: 0, color: 'Yellow'),
        ProductColorModel(quantity: 2, color: 'Blue'),
      ],
      sizes: [
        ProductSizeModel(quantity: 10, size: 'XS'),
        ProductSizeModel(quantity: 3, size: 'S'),
        ProductSizeModel(quantity: 5, size: 'M'),
        ProductSizeModel(quantity: 0, size: 'L'),
        ProductSizeModel(quantity: 0, size: 'XL')
      ],
      isNew: false,
      isSale: false,
      sale: 15,
      price: 70.00,
      newPrice: 45.00,
      quantity: 100,
      description:
          'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.',
      rating: ProductRatingModel(
        five: 3,
        four: 2,
        three: 2,
        two: 2,
        one: 2,
        totalRating: 3,
        totalUser: 11,
      ),
      imgUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIXZz-0xMe1vL2jyzkRH-k3ARowrnBQTI3ba2We_BZl8Dn-xnihjkGdqeM4d_IKuwNHBE&usqp=CAU',
    ),
    const ProductModel(
      productID: '25',
      category: CategoryModel(
        typeName: 'Women',
        collectionName: 'Clothes',
        categoryName: 'Sheath dress',
      ),
      brand: 'Polo',
      colors: [
        ProductColorModel(quantity: 2, color: 'Black'),
        ProductColorModel(quantity: 5, color: 'White'),
        ProductColorModel(quantity: 2, color: 'Red'),
        ProductColorModel(quantity: 0, color: 'Grey'),
        ProductColorModel(quantity: 0, color: 'Yellow'),
        ProductColorModel(quantity: 2, color: 'Blue'),
      ],
      sizes: [
        ProductSizeModel(quantity: 10, size: 'XS'),
        ProductSizeModel(quantity: 3, size: 'S'),
        ProductSizeModel(quantity: 5, size: 'M'),
        ProductSizeModel(quantity: 0, size: 'L'),
        ProductSizeModel(quantity: 0, size: 'XL')
      ],
      isNew: false,
      isSale: false,
      sale: 15,
      price: 140.00,
      newPrice: 45.00,
      quantity: 100,
      description:
          'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.',
      rating: ProductRatingModel(
        five: 3,
        four: 2,
        three: 2,
        two: 2,
        one: 2,
        totalRating: 3,
        totalUser: 11,
      ),
      imgUrl:
          'https://cfcdn.zulily.com/images/cache/product/452x1000/241441/zu48102699_main_tm1495127687.jpg',
    ),

    // /////

    const ProductModel(
      productID: '26',
      category: CategoryModel(
        typeName: 'Women',
        collectionName: 'Clothes',
        categoryName: 'Dress',
      ),
      brand: 'Polo',
      colors: [
        ProductColorModel(quantity: 2, color: 'Black'),
        ProductColorModel(quantity: 5, color: 'White'),
        ProductColorModel(quantity: 2, color: 'Red'),
        ProductColorModel(quantity: 0, color: 'Grey'),
        ProductColorModel(quantity: 0, color: 'Yellow'),
        ProductColorModel(quantity: 2, color: 'Blue'),
      ],
      sizes: [
        ProductSizeModel(quantity: 10, size: 'XS'),
        ProductSizeModel(quantity: 3, size: 'S'),
        ProductSizeModel(quantity: 5, size: 'M'),
        ProductSizeModel(quantity: 0, size: 'L'),
        ProductSizeModel(quantity: 0, size: 'XL')
      ],
      isNew: true,
      isSale: false,
      sale: 15,
      price: 140.00,
      newPrice: 45.00,
      quantity: 100,
      description:
          'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.',
      rating: ProductRatingModel(
        five: 3,
        four: 2,
        three: 2,
        two: 2,
        one: 2,
        totalRating: 3,
        totalUser: 11,
      ),
      imgUrl:
          'https://assets.ajio.com/medias/sys_master/root/20220225/tN6U/6218e92ef997dd03e2f0771d/janasya_pink_printed_tiered_dress_with_waist_tie-up.jpg',
    ),
    const ProductModel(
      productID: '27',
      category: CategoryModel(
        typeName: 'Women',
        collectionName: 'Clothes',
        categoryName: 'Dress',
      ),
      brand: 'Polo',
      colors: [
        ProductColorModel(quantity: 2, color: 'Black'),
        ProductColorModel(quantity: 5, color: 'White'),
        ProductColorModel(quantity: 2, color: 'Red'),
        ProductColorModel(quantity: 0, color: 'Grey'),
        ProductColorModel(quantity: 0, color: 'Yellow'),
        ProductColorModel(quantity: 2, color: 'Blue'),
      ],
      sizes: [
        ProductSizeModel(quantity: 10, size: 'XS'),
        ProductSizeModel(quantity: 3, size: 'S'),
        ProductSizeModel(quantity: 5, size: 'M'),
        ProductSizeModel(quantity: 0, size: 'L'),
        ProductSizeModel(quantity: 0, size: 'XL')
      ],
      isNew: false,
      isSale: true,
      sale: 15,
      price: 160.00,
      newPrice: 45.00,
      quantity: 100,
      description:
          'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.',
      rating: ProductRatingModel(
        five: 3,
        four: 2,
        three: 2,
        two: 2,
        one: 2,
        totalRating: 3,
        totalUser: 11,
      ),
      imgUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRW6tTSeZMgWPZFO8w16OTfWN1PE4ZZOqO19EQlDkN0yXcT7eQgZeWq9n4lOTqAvMXdJXU&usqp=CAU',
    ),
    const ProductModel(
      productID: '28',
      category: CategoryModel(
        typeName: 'Women',
        collectionName: 'Clothes',
        categoryName: 'Dress',
      ),
      brand: 'Polo',
      colors: [
        ProductColorModel(quantity: 2, color: 'Black'),
        ProductColorModel(quantity: 5, color: 'White'),
        ProductColorModel(quantity: 2, color: 'Red'),
        ProductColorModel(quantity: 0, color: 'Grey'),
        ProductColorModel(quantity: 0, color: 'Yellow'),
        ProductColorModel(quantity: 2, color: 'Blue'),
      ],
      sizes: [
        ProductSizeModel(quantity: 10, size: 'XS'),
        ProductSizeModel(quantity: 3, size: 'S'),
        ProductSizeModel(quantity: 5, size: 'M'),
        ProductSizeModel(quantity: 0, size: 'L'),
        ProductSizeModel(quantity: 0, size: 'XL')
      ],
      isNew: false,
      isSale: false,
      sale: 15,
      price: 75.00,
      newPrice: 45.00,
      quantity: 100,
      description:
          'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.',
      rating: ProductRatingModel(
        five: 3,
        four: 2,
        three: 2,
        two: 2,
        one: 2,
        totalRating: 3,
        totalUser: 11,
      ),
      imgUrl:
          'https://rukminim1.flixcart.com/image/612/612/xif0q/dress/k/w/h/s-cheeti-wrinkle-dress-inspire-the-next-original-imagk8ynsrfafjjh.jpeg?q=70',
    ),
    const ProductModel(
      productID: '29',
      category: CategoryModel(
        typeName: 'Women',
        collectionName: 'Clothes',
        categoryName: 'Dress',
      ),
      brand: 'Polo',
      colors: [
        ProductColorModel(quantity: 2, color: 'Black'),
        ProductColorModel(quantity: 5, color: 'White'),
        ProductColorModel(quantity: 2, color: 'Red'),
        ProductColorModel(quantity: 0, color: 'Grey'),
        ProductColorModel(quantity: 0, color: 'Yellow'),
        ProductColorModel(quantity: 2, color: 'Blue'),
      ],
      sizes: [
        ProductSizeModel(quantity: 10, size: 'XS'),
        ProductSizeModel(quantity: 3, size: 'S'),
        ProductSizeModel(quantity: 5, size: 'M'),
        ProductSizeModel(quantity: 0, size: 'L'),
        ProductSizeModel(quantity: 0, size: 'XL')
      ],
      isNew: false,
      isSale: false,
      sale: 15,
      price: 150.00,
      newPrice: 45.00,
      quantity: 100,
      description:
          'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.',
      rating: ProductRatingModel(
        five: 3,
        four: 2,
        three: 2,
        two: 2,
        one: 2,
        totalRating: 3,
        totalUser: 11,
      ),
      imgUrl:
          'https://assets.ajio.com/medias/sys_master/root/20220708/Ku84/62c748acaeb26921af6a679c/janasya_yellow_floral_print_fit_and_flare_dress.jpg',
    ),
    const ProductModel(
      productID: '30',
      category: CategoryModel(
        typeName: 'Women',
        collectionName: 'Clothes',
        categoryName: 'Dress',
      ),
      brand: 'Polo',
      colors: [
        ProductColorModel(quantity: 2, color: 'Black'),
        ProductColorModel(quantity: 5, color: 'White'),
        ProductColorModel(quantity: 2, color: 'Red'),
        ProductColorModel(quantity: 0, color: 'Grey'),
        ProductColorModel(quantity: 0, color: 'Yellow'),
        ProductColorModel(quantity: 2, color: 'Blue'),
      ],
      sizes: [
        ProductSizeModel(quantity: 10, size: 'XS'),
        ProductSizeModel(quantity: 3, size: 'S'),
        ProductSizeModel(quantity: 5, size: 'M'),
        ProductSizeModel(quantity: 0, size: 'L'),
        ProductSizeModel(quantity: 0, size: 'XL')
      ],
      isNew: false,
      isSale: false,
      sale: 15,
      price: 65.00,
      newPrice: 45.00,
      quantity: 100,
      description:
          'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.',
      rating: ProductRatingModel(
        five: 3,
        four: 2,
        three: 2,
        two: 2,
        one: 2,
        totalRating: 3,
        totalUser: 11,
      ),
      imgUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRREklgv1RdHXxPnp4D-soDJ6DlFCJjTdOxQxXaJweWlm5Izrq6Dtparte89v_r899Sh08&usqp=CAU',
    ),
  ];
}

FakeData fakeData = FakeData();
