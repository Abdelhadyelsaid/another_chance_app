import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/Const/colors.dart';
import '../../../../Core/Const/styles.dart';

class OrderDetailsWidget extends StatelessWidget {
  final Map<String, dynamic> orderDetails;

  const OrderDetailsWidget({super.key, required this.orderDetails});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Order Details",
          style: TextStyle(
            color: const Color(0xff2B2B2B),
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            fontFamily: "Readex Pro",
          ),
        ),
        SizedBox(height: 12.h),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(10.r)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: .02.sh, horizontal: .05.sw),
            child: Column(
              children: [
                // Header Row (titles pinned at top)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Product",
                        style: Styles.labelStyle(),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          "Quantity",
                          style: Styles.labelStyle(),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Price",
                          style: Styles.labelStyle(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),

                // List of products
                ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: orderDetails["products"].length,
                  separatorBuilder: (context, index) => SizedBox(height: 6.h),
                  itemBuilder: (context, index) {
                    final product = orderDetails["products"][index];
                    final totalPrice = product["price"] * product["count"];

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "${product["name"]}",
                            style: Styles.valueStyle(),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Text(
                              "${product["count"]}",
                              style: Styles.valueStyle(),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "${product["price"]} EGP",
                              style: Styles.valueStyle(),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        // Total section
        Container(
          height: 42.h,
          decoration: BoxDecoration(
            color: cPrimaryColor.withOpacity(0.3),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(10.r)),
          ),
          child: Center(
            child: Text(
              "Total: ${orderDetails["totalPrice"]} EGP",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                fontFamily: "Readex Pro",
              ),
            ),
          ),
        ),
      ],
    );
  }
}
