import 'package:another_chance/Features/Profile/View/Widgets/order_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../Core/Const/colors.dart';
import '../../../../Core/Shared/default_button_widget.dart';
import '../../../../routing/routes.dart';
import '../../../Product/View/Widgets/thankyou_order_details_widget.dart';
import '../Widgets/header_text_widget.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key, required this.orderDetails});

  final Map<String, dynamic> orderDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: .04.sw),
        child: Column(
          children: [
             SafeArea(
              child: HeaderTextWidget(
                title: "Order Number: ${orderDetails["orderId"]}",
              ),
            ),
            SizedBox(
              height: .1.sh,
            ),
            OrderDetailsWidget(orderDetails: orderDetails),
            const Spacer(),
            DefaultButton(
              height: .05.sh,
              color: const Color(0xffFFAEAF),
              text: "Cancel Order",
              textColor: Colors.black,
              onTap: () {},
            ),
            SizedBox(height: .02.sh),
            DefaultButton(
              height: .05.sh,
              color: Colors.white,
              text: "Customer Service",
              borderColor: cPrimaryColor,
              textColor: cPrimaryColor,
              onTap: () {
                context.pushNamed(Routes.customerServiceScreen.name);
              },
            ),
            SizedBox(height: .02.sh),
          ],
        ),
      ),
    );
  }
}
