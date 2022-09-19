import 'package:e_commerce/src/module/shop/domain/entities/categories_entity.dart';
import 'package:e_commerce/src/module/shop/pesentation/widgets/colered_tab_bar.dart';
import 'package:e_commerce/src/util/app_constants/colors/app_colors.dart';
import 'package:e_commerce/src/util/app_constants/sized/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../widgets/categories_data.dart';

class MobileCategoriesView extends StatelessWidget {
  const MobileCategoriesView({Key? key}) : super(key: key);

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
        body: const TabBarView(
          children: [
            MenView(),
            WomenView(),
            KidsView(),
            // WomenView(categories: CategoriesData().categories),
            // kidsView(categories: CategoriesData().categories),
          ],
        ),
      ),
    );
  }
}

const items = ['Men', 'Women', 'Kids'];

class MenView extends StatelessWidget {
  const MenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        saleCard(),
        categoriesCard(
          //256 x 154
          'New',
          'https://media.istockphoto.com/photos/stylish-business-clothing-for-businessman-picture-id504742864?k=20&m=504742864&s=612x612&w=0&h=nuy8uRAuB6xVTfuXeTOd8wFSBWwNNGZ0nK1qViA-Nv0=',
        ),
        categoriesCard(
          'Clothes',
          'https://media.istockphoto.com/photos/shirts-hanging-in-a-closet-picture-id1305969463?k=20&m=1305969463&s=612x612&w=0&h=S5p7G7KPKntYBGErCgRQCQbVWlDkAr1MdGUWZH-K6g0=',
        ),
        categoriesCard(
          'Shoes',
          'https://5.imimg.com/data5/MB/FL/MY-8852934/whatsapp-image-2017-03-24-at-13-44-53-250x250.jpeg',
        ),
        categoriesCard(
          'Accesories',
          'https://media.istockphoto.com/photos/table-top-flat-lay-men-accessories-picture-id652278092?b=1&k=20&m=652278092&s=170667a&w=0&h=wj-nCkX3fthse1Se6JiX4J1LgPyDUVYDsYdfo-sASyE=',
        ),
      ],
    );
  }
}

class WomenView extends StatelessWidget {
  const WomenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        saleCard(),
        categoriesCard(
          //256 x 154
          'New',
          'https://media.istockphoto.com/photos/summer-womens-fashion-clothes-set-moms-jeans-suede-sneakers-cotton-picture-id1131409615?k=20&m=1131409615&s=612x612&w=0&h=vCKp5Oqkc7ISE2efeeclmO9aiyoab-4Dy5uoC5z5qlY=',
        ),
        categoriesCard(
          'Clothes',
          'https://media.istockphoto.com/photos/women-clothes-hanging-on-hangers-clothing-rails-fashion-design-picture-id916092484?k=20&m=916092484&s=612x612&w=0&h=2aTLAucj_-qbbfhBiJEXfdiY3-k0gx0el8OrKFpi3O8=',
        ),
        categoriesCard(
          'Shoes',
          'https://media.istockphoto.com/photos/stylish-woman-wearing-black-summer-shoes-with-straw-sole-outdoors-picture-id1034457896?b=1&k=20&m=1034457896&s=170667a&w=0&h=vlFVkXs8fmbhIHBgxwJf3UxMMBFf-NmRAMR2WHeBXTA=',
        ),
        categoriesCard(
          'Accesories',
          'https://s3.envato.com/files/294648781/202005205327.JPG',
        ),
      ],
    );
  }
}

class KidsView extends StatelessWidget {
  const KidsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        saleCard(),
        categoriesCard(
          //256 x 154
          'New',
          'https://thumbs.dreamstime.com/b/baby-child-clothes-toys-box-second-hand-apparel-idea-circular-fashion-donation-charity-concept-baby-child-clothes-toys-245994968.jpg',
        ),
        categoriesCard(
          'Clothes',
          'https://media.istockphoto.com/photos/dressing-closet-with-baby-clothes-arranged-on-hangers-picture-id477001758?k=20&m=477001758&s=612x612&w=0&h=aEdpVIWMz_cxdWi3KpDbt2sqlEXG_pwYIZBCVCtd6E4=',
        ),
        categoriesCard(
          'Shoes',
          'https://apistage.rogansshoes.com/Data/Media/562ededb-271d-4473-a1d7-db5e2bb62385GIRLS_SHOES-MB.jpg',
        ),
        categoriesCard(
          'Accesories',
          'https://m.media-amazon.com/images/I/71SlJWBKqSL._AC_UL320_.jpg',
        ),
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

saleCard() {
  return SizedBox(
    height: 115,
    child: Card(
      color: AppColors.mainColor,
      clipBehavior: Clip.hardEdge,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
      //color: Colors.redAccent.shade100,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'SUMMER SALES',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
            AppSized.h10,
            const Text(
              'Up to 50% off',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    ),
  );
}
