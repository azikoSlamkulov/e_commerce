import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';

class WidgetBtnGoogle extends StatelessWidget {
  final VoidCallback? onTap;

  const WidgetBtnGoogle({
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
              color: const Color(0xffFFF1F0),
              border: Border.all(
                width: 0.5,
                color: const Color.fromARGB(255, 240, 129, 121),
              ),
              shape: BoxShape.rectangle),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AppAssets.googleLogo(
                  width: 24,
                  height: 24,
                ),
              ),
              Text(
                'Google',
                style: AppTextStyles.black14,
                //style: FONT_CONST.REGULAR_GRAY4_12,
              )
            ],
          ),
        ),
      ),
    );
  }
}
