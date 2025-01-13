import 'dart:ui';

import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final double height;
  final double? width;
  final Color color;
  final String text;
  final double fontSize;
  final Color? textColor;
  final FontWeight fontWeight;
  final BorderRadiusGeometry? borderRadius;
  void Function()? onTap;
  final  bool? isLoading;
  final Color? borderColor;

  DefaultButton(
      {super.key,
      required this.height,
      required this.color,
      required this.text,
      this.onTap,
      this.width,
      this.borderRadius,
      this.textColor,
      this.fontWeight = FontWeight.w700,  this.fontSize=16, this.isLoading = false, this.borderColor,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius ?? BorderRadius.circular(10),
          border: borderColor != null ? Border.all(color: borderColor!, width: 2) : null,
        ),
        child: Center(
            child: isLoading! ? const  CircularProgressIndicator(color: Colors.white,) : Text(
          text,
          style: TextStyle(
              color: textColor ?? Colors.white,
              fontFamily: "Readex Pro",
              fontSize: fontSize,
              fontWeight: fontWeight),
        )),
      ),
    );
  }
}
