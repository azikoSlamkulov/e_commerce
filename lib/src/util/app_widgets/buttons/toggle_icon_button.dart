import 'package:flutter/material.dart';

class ToggleIconBtn extends StatefulWidget {
  ToggleIconBtn({
    super.key,
    this.isFavorite = false,
  });

  bool isFavorite;

  @override
  State<ToggleIconBtn> createState() => _ToggleIconBtnState();
}

class _ToggleIconBtnState extends State<ToggleIconBtn> {
  //bool isFavorite = isFavorite1;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: Colors.white,
      ),
      onPressed: () {
        if (widget.isFavorite) {
          setState(() {
            widget.isFavorite = false;
          });
        } else {
          setState(() {
            widget.isFavorite = true;
          });
        }
      },
      child: widget.isFavorite
          ? const Icon(
              Icons.favorite,
              color: Colors.red,
              size: 15,
            )
          : const Icon(
              Icons.favorite_outline,
              color: Colors.grey,
              size: 15,
            ),
    );
  }
}
