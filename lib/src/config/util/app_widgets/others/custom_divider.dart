import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
    required this.text,
    this.textFontSize = 14,
    this.alignColor = const Color(0xFFFFAFAFA),
  }) : super(key: key);

  final String text;
  final double? textFontSize;
  final Color? alignColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        const Align(
          alignment: Alignment.center,
          child: Divider(
            color: Colors.black45,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            color: alignColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
              child: Text(
                text,
                style: TextStyle(fontSize: textFontSize, color: Colors.black45),
              ),
            ),
          ),
        )
      ],
    );
  }
}
