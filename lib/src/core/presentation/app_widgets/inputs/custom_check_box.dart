import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  final ValueSetter<bool>? isCheckedCallback;
  final bool? isTitle;
  final String? title;

  const CustomCheckBox({
    required this.isCheckedCallback,
    super.key,
    this.isTitle = false,
    this.title,
  });

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool _isChecked = true;

  @override
  Widget build(BuildContext context) {
    return widget.isTitle!
        ? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: _isChecked,
                //onChanged: (value) => onClicked(),
                activeColor: Colors.black,
                onChanged: (value) {
                  _isChecked = value!;
                  widget.isCheckedCallback!(_isChecked);
                  setState(() {});
                },
              ),
              InkWell(
                onTap: () {
                  _isChecked = !_isChecked;
                  widget.isCheckedCallback!(_isChecked);
                  setState(() {});
                },
                child: Text(
                  widget.title!,
                  style: AppTextStyles.black14,
                ),
              ),
            ],
          )
        : Checkbox(
            value: _isChecked,
            //onChanged: (value) => onClicked(),
            activeColor: Colors.black,
            onChanged: (value) {
              _isChecked = value!;
              widget.isCheckedCallback!(_isChecked);
              setState(() {});
            },
          );
  }
}
