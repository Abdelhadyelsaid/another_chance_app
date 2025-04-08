import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Home/View/Widgets/quantity_widget.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: .15.sh,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                Image.asset(
                  "assets/icons/appIcon.png",
                  height: 100,
                )
              ],
            ),
          ),
          const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Summer Jar Set"), Text("500")]),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            // Aligns icon to the left
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.close)),
              Spacer(), // Pushes QuantityWidget to center
              QuantityWidget(
                isCart: true,
              ),
              Spacer(), // Pushes everything evenly
            ],
          )
        ],
      ),
    );
  }
}
