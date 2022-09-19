import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter/material.dart';

import '../../util/app_constants/colors/app_colors.dart';

class OnboardingLayout extends StatefulWidget {
  final String title, description, imageLink;
  final Color color;
  final Color? topBGColor;
  final Color textColor;

  const OnboardingLayout({
    super.key,
    required this.title,
    required this.description,
    required this.imageLink,
    required this.color,
    this.topBGColor,
    this.textColor = AppColors.black,
  });
  @override
  _OnboardingLayoutState createState() => _OnboardingLayoutState();
}

class _OnboardingLayoutState extends State<OnboardingLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.color,
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Поскольку мы использовали SafeArea, нам нужно предоставить ему полную ширину приложения, чтобы оно растягивалось на весь экран.
          Container(
            width: double.infinity,
          ),

          //Image
          Stack(
            children: <Widget>[
              Arc(
                arcType: ArcType.CONVEX,
                edge: Edge.BOTTOM,
                height: (MediaQuery.of(context).size.width) / 20,
                child: Container(
                    height: (MediaQuery.of(context).size.height) / 1.7,
                    width: MediaQuery.of(context).size.width,
                    color: widget.topBGColor ?? AppColors.mainColor2),
              ),
              SafeArea(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: (MediaQuery.of(context).size.height) / 1.7,
                  alignment: Alignment.center,
                  child: Image.asset(widget.imageLink,
                      width: 300,
                      height: (MediaQuery.of(context).size.height) / 2.8),
                ),
              ),
            ],
          ),
          //Title
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text(
                widget.title,
                style: TextStyle(
                  fontSize: 22,
                  color: widget.textColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Flexible(
            child: SizedBox(
              height: 40.0,
            ),
          ),
          //Description
          SizedBox(
            width: 300.0,
            child: Text(
              widget.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: widget.textColor,
                //fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 40.0),
        ],
      ),
    );
  }
}
