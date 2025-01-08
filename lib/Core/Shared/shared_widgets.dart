import 'package:flutter/material.dart';

import '../Const/colors.dart';


class SharedClass {
  static void snackBar(context, String text, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        showCloseIcon: true,
        content: Directionality(
          textDirection: TextDirection.rtl,
          child: Text(text,
              style: const TextStyle(
                  fontFamily: "Readex Pro",
                  fontSize: 13,
                  fontWeight: FontWeight.w600)),
        ),
        duration: const Duration(seconds: 4),
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static void popUpLoading({required BuildContext context}) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            height: 100,
            child: Center(
              child: CircularProgressIndicator(
                color: cPrimaryColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
