import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  final String? labelText;
  final bool? readOnly;
  final Color? borderColor;
  final TextStyle? labelStyle;
  final String? prefixText;
  final String? suffixText;
  final bool? obscureText;
  final TextEditingController? controller;
  final TextDirection? textDirection;
  final double? height;
  final double? width;
  final FocusNode? focusNode;
  final Color fillcolor;
  final bool profile;
  final String hintText;
  final Function(String)? onChanged;
  final bool? enabled;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? textInputType;
  final TextAlign? textAlign;
  final Function()? onTap;
  final Color? cursorColor;

  final int? maxLines;

  final double? borderRadius;

  DefaultTextFormField(
      {super.key,
      this.prefixText,
      this.maxLines = 1,
      this.controller,
      this.obscureText,
      this.textDirection,
      this.suffixText,
      this.height,
      this.width,
      this.focusNode,
      this.onChanged,
      this.fillcolor = Colors.white,
      this.profile = false,
      this.hintText = '',
      this.enabled,
      this.suffixIcon,
      this.textAlign,
      this.textInputType,
      this.prefixIcon,
      this.labelText,
      this.labelStyle,
      this.borderColor,
      this.cursorColor,
      this.readOnly,
      this.borderRadius,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        readOnly: readOnly ?? false,
        cursorColor: cursorColor,
        textAlign: textAlign ?? TextAlign.start,
        maxLines: maxLines,
        style: const TextStyle(
          fontFamily: "Readex Pro",
        ),
        enabled: enabled ?? true,
        focusNode: focusNode,
        onChanged: onChanged,
        textDirection: textDirection,
        obscureText: obscureText ?? false,
        controller: controller,
        keyboardType: textInputType ?? TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          prefixText: prefixText,
          suffixText: suffixText,
          labelText: labelText,
          labelStyle: labelStyle,
          fillColor: fillcolor,
          // Fill color
          filled: true,
          suffixStyle: const TextStyle(
              color: Colors.grey, fontFamily: "Readex Pro", fontSize: 16),
          prefixStyle: const TextStyle(
              color: Colors.grey, fontFamily: "Readex Pro", fontSize: 16),
          // Adjusted opacity for better visibility if needed
          hintStyle: const TextStyle(
              color: Colors.grey,
              fontFamily: "Readex Pro",
              fontSize: 14,
              fontWeight: FontWeight.w400),
          contentPadding: const EdgeInsets.fromLTRB(12, 12, 20, 12),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 6),
            borderSide: BorderSide(
                color: borderColor ??
                    Colors.grey.withOpacity(0.7)), // Changed to grey color
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 6),
            borderSide: BorderSide(
                color: profile
                    ? Colors.white
                    : borderColor ??
                        Colors.grey.withOpacity(0.2)), // Changed to grey color
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 6),
            borderSide: BorderSide(
                color: profile
                    ? Colors.white
                    : borderColor ??
                        Colors.grey.withOpacity(0.2)), // Changed to grey color
          ),
        ),
      ),
    );
  }
}
