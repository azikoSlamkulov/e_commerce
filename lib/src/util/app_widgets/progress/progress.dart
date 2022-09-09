import 'package:flutter/material.dart';

import '../../app_constants/colors/app_colors.dart';

class ProgressIndicator {
  Container circularProgress({semanticsLabel}) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 10.0),
      child: CircularProgressIndicator(
        backgroundColor: AppColors.mainColor.withOpacity(0.5),
        valueColor:
            AlwaysStoppedAnimation(AppColors.mainColor.withOpacity(0.8)),
      ),
    );
  }

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

ProgressIndicator progressIndicator = ProgressIndicator();
