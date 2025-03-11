import 'package:another_chance/Core/Shared/default_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/Const/colors.dart';
import '../../../Profile/View/Widgets/header_text_widget.dart';
import '../Widgets/cart_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: .02.sw),
          child: Column(
            children: [
              HeaderTextWidget(
                title: "Cart",
              ),
              CartWidget(),

              Spacer(),
              DefaultButton(height: .05.sh, color: cPrimaryColor, text: "Add more products"),
              SizedBox(height: .02.sh),
              DefaultButton(height: .05.sh, color: Colors.white, text: "Complete the order",borderColor: cPrimaryColor,textColor: cPrimaryColor,),
              SizedBox(height: .02.sh),

            ],
          ),
        ),
      ),
    );
  }
}
