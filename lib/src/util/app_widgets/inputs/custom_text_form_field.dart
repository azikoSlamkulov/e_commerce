import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    required this.controller,
    this.labelText,
    this.labelStyle,
    this.hintText,
    this.hintStyle,
    this.counterText,
    this.prefix,
    this.prefixIcon,
    this.prefixText,
    this.suffix,
    this.suffixIcon,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.fillColor,
    this.enabledBorderColor,
    //this.border,
    this.autofocus,
    this.sizedBoxHeight = 55.0,
    this.sizedBoxWidth = 200.0,
    Key? key,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? counterText;
  final String? labelText;
  final TextStyle? labelStyle;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefix;
  final Widget? prefixIcon;
  final String? prefixText;
  final Widget? suffix;
  final Widget? suffixIcon;
  final Color? fillColor;
  final Color? enabledBorderColor;
  //final InputBorder? border;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool? autofocus;
  final double? sizedBoxHeight;
  final double? sizedBoxWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sizedBoxHeight,
      width: sizedBoxWidth,
      child: TextFormField(
        controller: controller!,
        keyboardType: keyboardType,
        //style: AppTextStyles.mulishBlack16w600,
        //style: TextStyle(color: AppColors.white),
        decoration: InputDecoration(
          //focusColor: AppColors.red,
          labelText: labelText,
          labelStyle: labelStyle ?? const TextStyle(color: Colors.black26),
          //hintText: hintText!,
          //hintStyle: TextStyle(color: AppColors.black26),
          // hintStyle: AppTextStyles.mulishBlack14w600.copyWith(
          //   color: AppColors.black.withOpacity(0.5),
          // ),
          counterText: counterText,
          prefixText: prefixText,
          prefix: prefix,
          prefixIcon: prefixIcon,
          suffix: suffix,
          suffixIcon: suffixIcon,
          fillColor: fillColor ?? Colors.white,
          filled: true,
          // border: border ??
          //     OutlineInputBorder(
          //       borderSide: BorderSide(
          //         width: 0.0,
          //         style: BorderStyle.none,
          //       ),
          //     ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: enabledBorderColor ?? Colors.black26,
              width: 0.5,
              style: BorderStyle.solid,
            ),
          ),
          // border: OutlineInputBorder(
          //   borderSide: const BorderSide(
          //     color: Colors.red,
          //     width: 2.0,
          //     style: BorderStyle.solid,
          //   ),
          // ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 13, 116, 196),
              //color: Color.fromARGB(255, 20, 126, 24),
              width: 1.0,
              style: BorderStyle.solid,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
              style: BorderStyle.solid,
            ),
          ),
          contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 0.0),
          // errorStyle: AppTextStyles.mulishMainColor16w600,
        ),
        validator: validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return 'Поле не должно быть пустым!';
              }
              return null;
            },
        onChanged: onChanged,
        //autofocus: autofocus!,
      ),
    );
  }
}
