import 'package:another_chance/Features/Product/Model/make_order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../Core/Const/colors.dart';
import '../../../../Core/Const/styles.dart';
import '../../../../Core/Helper/cache_helper.dart';
import '../../../../Core/Shared/default_button_widget.dart';
import '../../../../routing/routes.dart';
import '../Widgets/thankyou_order_details_widget.dart';

class ThanksScreen extends StatelessWidget {
  const ThanksScreen({super.key, required this.makeOrderModel});

  final MakeOrderModel makeOrderModel;

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
              Text(
                "${CacheHelper.getData(key: "userName")}!",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              SizedBox(
                height: .05.sh,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Order Number: ${makeOrderModel.data!.orderId}",
                      style: Styles.labelStyle().copyWith(fontSize: 17.sp)),
                ],
              ),
              SizedBox(
                height: .02.sh,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Order Date: ${DateFormat('yyyy-MM-dd').format(DateTime.parse(makeOrderModel.data!.createdAt!))}",
                    style: Styles.labelStyle().copyWith(fontSize: 17.sp),
                  ),
                ],
              ),
              SizedBox(
                height: .04.sh,
              ),
              ThankYouOrderDetailsWidget(
                makeOrderModel: makeOrderModel,
              ),
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
                  context.goNamed(Routes.layoutScreen.name);
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
