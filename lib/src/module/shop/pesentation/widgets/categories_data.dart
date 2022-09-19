import 'package:e_commerce/src/module/home/domain/entities/product_entity.dart';

import '../../domain/entities/categories_entity.dart';

class CategoriesData {
  List<CategoryEntity> categories = [
    const CategoryEntity(
      categoryID: '0',
      categoryName: 'Sale',
      imageURL:
          'https://www.seekpng.com/png/detail/70-707010_collar-polo-t-shirts-collar-t-shirt-png.png',
    ),
    const CategoryEntity(
      categoryID: '1',
      categoryName: 'New',
      imageURL:
          'https://www.seekpng.com/png/detail/70-707010_collar-polo-t-shirts-collar-t-shirt-png.png',
    ),
    const CategoryEntity(
      categoryID: '2',
      categoryName: 'Clothes',
      imageURL:
          'https://www.seekpng.com/png/detail/70-707010_collar-polo-t-shirts-collar-t-shirt-png.png',
    ),
    const CategoryEntity(
      categoryID: '3',
      categoryName: 'Shoes',
      imageURL:
          'https://www.seekpng.com/png/detail/70-707010_collar-polo-t-shirts-collar-t-shirt-png.png',
    ),
    const CategoryEntity(
      categoryID: '4',
      categoryName: 'Accesories',
      imageURL:
          'https://www.seekpng.com/png/detail/70-707010_collar-polo-t-shirts-collar-t-shirt-png.png',
    ),
  ];
}
