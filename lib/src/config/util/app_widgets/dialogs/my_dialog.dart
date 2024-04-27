import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';

class MyDialog {
  static getDialog({
    required BuildContext context,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: Text(
              'В разработке!',
              style: AppTextStyles.black18Bold,
            ),
          ),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Ok"),
              ),
            ),
          ],
        );
      },
    );
  }
}
