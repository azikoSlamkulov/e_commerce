import 'package:flutter/material.dart';

import '../../../../util/app_constants/assets/app_assets.dart';

class WidgetBtnFacebook extends StatelessWidget {
  final VoidCallback? onTap;

  const WidgetBtnFacebook({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color.fromARGB(255, 219, 228, 243),
              border: Border.all(
                width: 0.5,
                color: const Color.fromARGB(255, 138, 165, 223),
              ),
              shape: BoxShape.rectangle),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AppAssets.facebookLogo(
                  width: 24,
                  height: 24,
                ),
              ),
              const Text(
                'Facebook',
                //style: FONT_CONST.REGULAR_GRAY4_12,
              )
            ],
          ),
        ),
      ),
    );
  }
}
