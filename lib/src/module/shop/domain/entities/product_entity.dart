import 'package:e_commerce/lib.dart';

class ProductEntity extends Equatable {
  final String? id;
  //final String? name;
  final String? type;
  final String? collectionName;
  final String? categoryName;
  final String? brand;
  final String? color;
  final String? size;
  final bool? isNew;
  final bool? isSale;
  final int? sale;
  final double? price;
  final double? newPrice;
  final int? quantity;
  final String? description;
  //final List<String>? rating;
  final String? imgUrl;
  final String? createdDate;

  const ProductEntity({
    this.id,
    //this.name,
    this.type,
    this.collectionName,
    this.categoryName,
    this.brand,
    this.color,
    this.size,
    this.isNew,
    this.isSale,
    this.sale,
    this.price,
    this.newPrice,
    this.quantity,
    this.description,
    //this.rating,
    this.imgUrl,
    this.createdDate,
  });

  @override
  List<Object?> get props => [
        id,
        //name,
        brand,
        type,
        collectionName,
        price,
        categoryName,
        brand,
        color,
        size,
        isNew,
        isSale,
        sale,
        price,
        newPrice,
        quantity,
        description,
        //rating,
        imgUrl,
        createdDate,
      ];
}
