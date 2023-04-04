// // ignore: unused_import
// import 'package:flutter/material.dart';

// import 'package:provider/provider.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key key}) : super(key: key);

//   static final List<Widget> _widgetOptions = <Widget>[
//     const LessonListScreen(),
//     ReferenceListScreen(),
//     const TestScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<KursProvider>(builder: (context, provider, snapshot) {
//       return Scaffold(
//         drawer: MainDrawer(),
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         appBar: AppBar(
//           backgroundColor: AppBarTheme.of(context).backgroundColor,
//           title: Text(provider.getSelectedTab == 0
//               ? S.of(context).home_app_bar_title_1
//               : S.of(context).home_app_bar_title_2),
//           centerTitle: true,
//         ),
//         body: Center(
//           child: _widgetOptions[provider.getSelectedTab],
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           currentIndex: provider.getSelectedTab,
//           backgroundColor: AppBarTheme.of(context).backgroundColor,
//           selectedItemColor: Theme.of(context).selectedRowColor,
//           unselectedItemColor: Theme.of(context).unselectedWidgetColor,
//           items: [
//             BottomNavigationBarItem(
//               icon: const Icon(Icons.book),
//               label: S.of(context).home_app_bar_title_1,
//             ),
//             BottomNavigationBarItem(
//               icon: const Icon(Icons.directions),
//               label: S.of(context).home_app_bar_title_2,
//             ),
//             BottomNavigationBarItem(
//               icon: const Icon(Icons.home),
//               label: S.of(context).home_app_bar_title_3,
//             ),
//           ],
//           onTap: provider.onSelectTab,
//         ),
//       );
//     });
//   }
// }
