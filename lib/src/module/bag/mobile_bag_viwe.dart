import 'package:e_commerce/src/module/shop/pesentation/widgets/colered_tab_bar.dart';
import 'package:flutter/material.dart';

// class BagViwe extends StatefulWidget {
//   const BagViwe({Key? key}) : super(key: key);

//   @override
//   State<BagViwe> createState() => _BagViweState();
// }

// class _BagViweState extends State<BagViwe> {
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Text('Bag Viwe'),
//       ),
//     );
//   }
// }

class MobileBagViwe extends StatelessWidget {
  const MobileBagViwe({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
                  color: Colors.red,
                  height: 70,
                  tabBar: TabBar(
                    isScrollable: false,
                    tabs: items.map((e) => Tab(text: e)).toList(),
                  ),
                ),
              ),
            ];
          },
          // body: TabBarView(
          //   children: items.map((e) => SampleView(text: e)).toList(),
          // ),
          body: Center(child: Text('asdasd')),
        ),
      ),
    );
  }
}

const items = ['Men', 'Women', 'Kids'];

class SampleView extends StatelessWidget {
  const SampleView({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return ListTile(
          title: Text(text),
        );
      },
    );
  }
}
