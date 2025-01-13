import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> customSnackBarr({required BuildContext context, required String text , required Color color}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      showCloseIcon: true,
      content:  Text("${text}",
          style:const  TextStyle(
              fontFamily: "Readex Pro",
              fontSize: 13,
              fontWeight: FontWeight.w600)),
      duration: const Duration(seconds: 4),
      backgroundColor: color ,
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      // padding: const EdgeInsets.all(10),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
