import 'dart:convert';
import 'package:e_commerce/lib.dart';

ProductModel productFromJson(Map docMap) =>
    ProductModel.fromJson(docMap as Map<String, dynamic>);

String productToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel extends ProductEntity {
  const ProductModel({
    productID,
    category,
    brand,
    colors,
    sizes,
    isNew,
    isSale,
    sale,
    price,
    newPrice,
    quantity,
    description,
    rating,
    //review,
    imgUrl,
    createdDate,
  }) : super(
          productID: productID,
          category: category,
          brand: brand,
          colors: colors,
          sizes: sizes,
          isNew: isNew,
          isSale: isSale,
          sale: sale,
          price: price,
          newPrice: newPrice,
          quantity: quantity,
          description: description,
          rating: rating,
          //review: review,
          imgUrl: imgUrl,
          createdDate: createdDate,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        productID: json['id'] as String,
        category: json['category'] != null
            ? CategoryModel.fromJson(json['category'])
            : const CategoryModel(),
        brand: json['brand'] as String,
        // colors: json['colors'] != null
        //     ? ProductColorModel.fromJson(json['colors'])
        //     : const ProductColorModel(),
        colors: (json['colors'] as List<dynamic>)
            .map((e) => ProductColorModel.fromJson(e))
            .toList(),
        // sizes: json['sizes'] != null
        //     ? ProductSizeModel.fromJson(json['sizes'])
        //     : const ProductSizeModel(),
        sizes: (json['sizes'] as List<dynamic>)
            .map((e) => ProductSizeModel.fromJson(e))
            .toList(),
        isNew: json['isNew'] as bool,
        isSale: json['isSale'] as bool,
        sale: json['sale'] as int,
        price: json['price'] as double,
        newPrice: json['newPrice'] as double,
        quantity: json['quantity'] as int,
        description: json['description'] as String,
        rating: json['rating'] != null
            ? ProductRatingModel.fromJson(json['rating'])
            : const ProductRatingModel(),
        // review: (json['review'] as List<dynamic>)
        //     .map((e) => ReviewModel.fromJson(e))
        //     .toList(),
        imgUrl: json['imgUrl'] as String,
        createdDate: json['createdDate'] as String,
      );

  Map<String, dynamic> toJson() => {
        "id": productID ?? '',
        "category": CategoryModel(
          id: '',
          typeName: category!.typeName,
          collectionName: category!.collectionName,
          categoryName: category!.categoryName,
        ).toJson(),
        "brand": brand ?? '',
        "colors": colors!
            .map((item) => ProductColorModel(
                  quantity: item.quantity,
                  color: item.color,
                ).toJson())
            .toList(),
        "sizes": sizes!
            .map((item) => ProductSizeModel(
                  quantity: item.quantity,
                  size: item.size,
                ).toJson())
            .toList(),
        "isNew": isNew ?? true,
        "isSale": isSale ?? false,
        "sale": sale ?? 0,
        "price": price ?? 0.0,
        "newPrice": newPrice ?? 0.0,
        "quantity": quantity ?? 0,
        "description": description ?? '',
        "rating": rating ??
            const ProductRatingModel(
              totalRating: 0,
              totalUser: 0,
              one: 0,
              two: 0,
              three: 0,
              four: 0,
              five: 0,
            ).toJson(),
        // "review": review!
        //     .map((item) => ReviewModel(
        //           reviewID: item.reviewID,
        //           productID: item.productID,
        //           userID: item.userID,
        //           userName: item.userName,
        //           rate: item.rate,
        //           reviewText: item.reviewText,
        //           userImg: item.userImg,
        //           imgUrlList: item.imgUrlList,
        //           createdDate: createdDate,
        //         ).toJson())
        //     .toList(),
        "imgUrl": imgUrl ?? '',
        "createdDate": createdDate ?? DateTime.now().toString(),
      };
}
