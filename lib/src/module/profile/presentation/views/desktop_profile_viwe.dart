import 'dart:developer';

import 'package:e_commerce/src/util/app_constants/sized/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/presentation/logic/auth_bloc.dart';
import '../../../auth/presentation/logic/auth_event.dart';

class DesktopProfileViwe extends StatefulWidget {
  const DesktopProfileViwe({Key? key}) : super(key: key);

  @override
  State<DesktopProfileViwe> createState() => _DesktopProfileViweState();
}

class _DesktopProfileViweState extends State<DesktopProfileViwe> {
  TextEditingController heightController = TextEditingController();
  TextEditingController widthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //int? widthValue = widthController.text.compareTo(_);
    double? heightValue = 0;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Profile View'),
            AppSized.h50,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('heigh'),
                AppSized.w20,
                Text(heightController.text),
              ],
            ),
            AppSized.h20,
            AppSized.h20,
            ElevatedButton(
              onPressed: () async {
                log('screenWidth ===>>>> ${MediaQuery.of(context).size.width}');
                log('screenHeight ===>>>> ${MediaQuery.of(context).size.height}');
              },
              child: const Text('Размер экрана'),
            ),
            AppSized.h100,
            ElevatedButton(
              onPressed: () async {
                BlocProvider.of<AuthBloc>(context).add(
                  SignOutEvent(),
                );
              },
              child: const Text('Выход'),
            ),
          ],
        ),
      ),
    );
  }
}
