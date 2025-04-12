import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../Core/Const/colors.dart';
import '../../../../Core/Shared/default_button_widget.dart';
import '../../../../routing/routes.dart';
import '../Widgets/thankyou_order_details_widget.dart';

class ThanksScreen extends StatelessWidget {
  const ThanksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: .05.sw),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: .05.sh,
              ),
              Image.asset(
                "assets/images/check.png",
                height: 120,
              ),
              SizedBox(
                height: .01.sh,
              ),
              const Text(
                "Thank You",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const Text(
                "John!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              SizedBox(
                height: .03.sh,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Order Number: 12345"),
                  Text("Order Date: 20-2-2025"),
                ],
              ),
              SizedBox(
                height: .03.sh,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Your Order",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
              ThankYouOrderDetailsWidget(),
              const Spacer(),
              DefaultButton(
                height: .05.sh,
                color: cPrimaryColor,
                text: "My orders",
                onTap: () {
                  context.pushNamed(Routes.ordersScreen.name);
                },
              ),
              SizedBox(height: .02.sh),
              DefaultButton(
                height: .05.sh,
                color: Colors.white,
                text: "Home",
                borderColor: cPrimaryColor,
                textColor: cPrimaryColor,
                onTap: () {
                  context.go(Routes.layoutScreen.name);
                },
              ),
              SizedBox(height: .02.sh),
            ],
          ),
        ),
      ),
    );
  }
}
