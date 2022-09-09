import 'package:e_commerce/src/util/app_constants/spaces/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth/presentation/logic/auth_bloc.dart';
import '../auth/presentation/logic/auth_event.dart';

class ProfileViwe extends StatefulWidget {
  const ProfileViwe({Key? key}) : super(key: key);

  @override
  State<ProfileViwe> createState() => _ProfileViweState();
}

class _ProfileViweState extends State<ProfileViwe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Profile Viwe'),
            AppSized.h20,
            ElevatedButton(
              onPressed: () async {
                BlocProvider.of<AuthBloc>(context).add(
                  SignOutEvent(),
                );
              },
              child: const Text('Выход'),
            ),
            AppSized.h20,
            ElevatedButton(
              onPressed: () async {
                BlocProvider.of<AuthBloc>(context).add(
                  GetCurrentUserEvent(),
                );
              },
              child: const Text('Профиль'),
            )
          ],
        ),
      ),
    );
  }
}
