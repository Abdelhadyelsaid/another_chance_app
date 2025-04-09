import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/Const/colors.dart';
import '../Widgets/header_text_widget.dart';
import '../Widgets/order_card_widgets.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBackground,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: .04.sw),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: HeaderTextWidget(
                  title: "My Orders",
                ),
              ),
              SizedBox(height: 16.h),
              ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(), // Important!
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: OrderCard(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
