import 'package:flutter/material.dart';

import '../../../../util/app_constants/assets/app_assets.dart';

class HomeView extends StatelessWidget {
  HomeView({
    Key? key,
    //required this.user,
  }) : super(key: key);

  //final AuthUser user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: AppColors.bgColorMain,
      //drawer: MainDrawer(user: user),
      // appBar: AppBar(
      //   title: const Text('Home View'),
      //   centerTitle: true,
      //   actions: [
      //     ElevatedButton(
      //       onPressed: () async {
      //         BlocProvider.of<AuthBloc>(context).add(
      //           SignOutEvent(),
      //         );
      //       },
      //       child: const Text('Выход'),
      //     )
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                //color: Colors.red,
                height: 500,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AppAssets.bgImage(),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                color: Colors.blue,
                height: 400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
