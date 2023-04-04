// import 'package:flutter/material.dart';

// import '../shop/presentation/views/mobile/mobile_home_view.dart';

// class Routes {
//   Map<String, Widget Function(BuildContext)> route = <String, WidgetBuilder>{
//     '/': (context) => const MobileHomeView(),
//     // '/lesson_1': (context) => const FirstScreen(),
//     // '/lesson_3': (context) => const DiamondScreen(),
//     // '/lesson_4': (context) => const DicePage(),
//     // '/lesson_5': (context) => const XylophoneApp(),
//     // '/lesson_6': (context) => const Quizzler(),
//     // '/lesson_7': (context) => const InputScreen(),
//     // '/lesson_8': (context) => MainWeatherScreen2(),
//     // WelcomeScreen.id: (context) => const WelcomeScreen(),
//     // LoginScreen.id: (context) => const LoginScreen(),
//     // RegisterScreen.id: (context) => const RegisterScreen(),
//     // ChatScreen.id: (context) => const ChatScreen(),
//   };
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       //home: const HomeScreen(),
//       initialRoute: '/',
//       routes: Routes().route,
//     );
//   }
// }

// //Navigator.pushNamed(context, screenRouteId!);

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