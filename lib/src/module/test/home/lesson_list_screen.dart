// import 'package:flutter/material.dart';
// import 'package:flutter_kurs/generated/l10n.dart';
// import 'package:flutter_kurs/app/providers/kurs_provider.dart';
// import 'package:flutter_kurs/app/screens/lesson_9/welcom_screen.dart';
// import 'package:flutter_kurs/app/widgets/home/home_screen_list_button.dart';
// import 'package:provider/provider.dart';

// class LessonListScreen extends StatelessWidget {
//   const LessonListScreen({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<KursProvider>(
//       builder: (context, provider, snapshot) {
//         return Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: ListView(
//             children: [
//               HomeScreenListButton(
//                 leading: const Icon(Icons.filter_1),
//                 title: 'Counttracker',
//                 subtitle: S.of(context).homeScreenListButton_subtitle_1,
//                 startroute: '/lesson_1',
//                 notesroute: '/note_1',
//               ),
//               HomeScreenListButton(
//                 leading: const Icon(Icons.filter_3),
//                 title: 'Diamond',
//                 subtitle: S.of(context).homeScreenListButton_subtitle_3,
//                 startroute: '/lesson_3',
//                 notesroute: '/note_3',
//               ),
//               HomeScreenListButton(
//                 leading: const Icon(Icons.filter_4),
//                 title: 'Dice',
//                 subtitle: S.of(context).homeScreenListButton_subtitle_4,
//                 startroute: '/lesson_4',
//                 notesroute: '/note_4',
//               ),
//               HomeScreenListButton(
//                 leading: const Icon(Icons.filter_5),
//                 title: 'Xylophone',
//                 subtitle: S.of(context).homeScreenListButton_subtitle_5,
//                 startroute: '/lesson_5',
//                 notesroute: '/note_5',
//               ),
//               HomeScreenListButton(
//                 leading: const Icon(Icons.filter_6),
//                 title: 'Quizz',
//                 subtitle: S.of(context).homeScreenListButton_subtitle_6,
//                 startroute: '/lesson_6',
//                 notesroute: '/note_6',
//               ),
//               HomeScreenListButton(
//                 leading: const Icon(Icons.filter_7),
//                 title: 'BMI Calculator',
//                 subtitle: S.of(context).homeScreenListButton_subtitle_7,
//                 startroute: '/lesson_7',
//                 notesroute: '/note_7',
//               ),
//               HomeScreenListButton(
//                 leading: const Icon(Icons.filter_8),
//                 title: 'Weather',
//                 subtitle: S.of(context).homeScreenListButton_subtitle_8,
//                 startroute: '/lesson_8',
//                 notesroute: '/note_8',
//               ),
//               HomeScreenListButton(
//                 leading: const Icon(Icons.filter_9),
//                 title: 'Flach Chat',
//                 subtitle: S.of(context).homeScreenListButton_subtitle_9,
//                 startroute: WelcomeScreen.id,
//                 notesroute: '/note_9',
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
