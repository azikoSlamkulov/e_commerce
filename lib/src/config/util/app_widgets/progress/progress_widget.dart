import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';

class CustomProgressIndicator {
  circularProgress({semanticsLabel}) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: AppColors.white.withOpacity(0.5),
        valueColor: AlwaysStoppedAnimation(AppColors.white.withOpacity(0.8)),
      ),
    );
  }
  // Container circularProgress({semanticsLabel}) {
  //   return Container(
  //     alignment: Alignment.center,
  //     padding: const EdgeInsets.only(top: 10.0),
  //     child: CircularProgressIndicator(
  //       backgroundColor: AppColors.white.withOpacity(0.5),
  //       valueColor: AlwaysStoppedAnimation(AppColors.white.withOpacity(0.8)),
  //     ),
  //   );
  // }

  Container linearProgress() {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: LinearProgressIndicator(
        backgroundColor: AppColors.mainColor.withOpacity(0.5),
        valueColor:
            AlwaysStoppedAnimation(AppColors.mainColor.withOpacity(0.8)),
      ),
    );
  }

  CircularProgressIndicator inputCircularProgress() {
    return CircularProgressIndicator(
      backgroundColor: AppColors.mainColor.withOpacity(0.5),
      valueColor: AlwaysStoppedAnimation(AppColors.mainColor.withOpacity(0.8)),
    );
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.transparent,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Container(
            //margin: EdgeInsets.only(left: 7),
            child: Text(""),
          ),
        ],
      ),
    );
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

CustomProgressIndicator progressIndicator = CustomProgressIndicator();
