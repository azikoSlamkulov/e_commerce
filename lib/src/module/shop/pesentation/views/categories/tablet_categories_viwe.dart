import 'package:e_commerce/src/module/shop/domain/entities/categories_entity.dart';
import 'package:e_commerce/src/module/shop/pesentation/widgets/colered_tab_bar.dart';
import 'package:e_commerce/src/util/app_constants/sized/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../widgets/categories_data.dart';

class TabletCategoriesView extends StatelessWidget {
  const TabletCategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Categories',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          actions: [],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: true,
                //expandedHeight: context.height * 0.3,
                expandedHeight: 30,
                // flexibleSpace: FlexibleSpaceBar(
                //   background: Image.network(
                //     'https://picsum.photos/200/300',
                //     fit: BoxFit.cover,
                //   ),
                //   title: Text('aaaaaa'),
                // ),
                bottom: ColoredTabBar(
                  //color: context.colors.surfaceVariant,
                  color: Colors.white,
                  height: 70,
                  tabBar: TabBar(
                    isScrollable: false,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.black45,
                    indicatorColor: Colors.red,
                    tabs: items.map((e) => Tab(text: e)).toList(),
                  ),
                ),
              ),
            ];
          },
          // body: TabBarView(
          //   children: items
          //       .map((e) => SampleView(categories: CategoriesData().categories))
          //       .toList(),
          // ),
          body: TabBarView(
            children: [
              MenView(categories: CategoriesData().categories),
              MenView(categories: CategoriesData().categories),
              MenView(categories: CategoriesData().categories),
              // WomenView(categories: CategoriesData().categories),
              // kidsView(categories: CategoriesData().categories),
            ],
          ),
        ),
      ),
    );
  }
}

const items = ['Men', 'Women', 'Kids'];

class MenView extends StatelessWidget {
  const MenView({super.key, required this.categories});

  final List<CategoryEntity> categories;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        categoriesCard('Sale',
            'https://www.seekpng.com/png/detail/70-707010_collar-polo-t-shirts-collar-t-shirt-png.png'),
        categoriesCard('New',
            'https://www.seekpng.com/png/detail/70-707010_collar-polo-t-shirts-collar-t-shirt-png.png'),
        categoriesCard('Clothes',
            'https://www.seekpng.com/png/detail/70-707010_collar-polo-t-shirts-collar-t-shirt-png.png'),
        categoriesCard('Shoes',
            'https://www.seekpng.com/png/detail/70-707010_collar-polo-t-shirts-collar-t-shirt-png.png'),
        categoriesCard('Accesories',
            'https://www.seekpng.com/png/detail/70-707010_collar-polo-t-shirts-collar-t-shirt-png.png'),
      ],
    );
  }
}

categoriesCard(String categoryName, String imageURL) {
  return SizedBox(
    height: 115,
    child: Card(
      clipBehavior: Clip.hardEdge,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
      //color: Colors.redAccent.shade100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              categoryName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
          ),
          Image.network(
            imageURL,
            fit: BoxFit.fill,
            width: 171,
            height: 100,
          ),
        ],
      ),
    ),
  );
}

// class MenView extends StatelessWidget {
//   const MenView({super.key, required this.categories});

//   final List<CategoryEntity> categories;

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: categories.length,
//       itemBuilder: (ctx, index) {
//         final category = categories[index];
//         return SizedBox(
//           height: 100,
//           child: Card(
//             clipBehavior: Clip.hardEdge,
//             elevation: 10,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//             margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
//             //color: Colors.redAccent.shade100,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(23.0),
//                   child: Text(
//                     category.categoryName!,
//                     style: const TextStyle(
//                         fontSize: 18, fontWeight: FontWeight.bold),
//                     textAlign: TextAlign.start,
//                   ),
//                 ),
//                 Image.network(
//                   category.imageURL!,
//                   fit: BoxFit.fill,
//                   width: 171,
//                   height: 100,
//                 ),
//               ],
//             ),
//             // child: ListTile(
//             //   title: Text(category.categoryName!),
//             // ),
//           ),
//         );
//       },
//     );
//   }
// }

class WomenView extends StatelessWidget {
  const WomenView({super.key, required this.categories});

  final List<CategoryEntity> categories;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (ctx, index) {
        final category = categories[index];
        return ListTile(
          title: Text(category.categoryName!),
        );
      },
    );
  }
}

class kidsView extends StatelessWidget {
  const kidsView({super.key, required this.categories});

  final List<CategoryEntity> categories;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (ctx, index) {
        final category = categories[index];
        return ListTile(
          title: Text(category.categoryName!),
        );
      },
    );
  }
}
