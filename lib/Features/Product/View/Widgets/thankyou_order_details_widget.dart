import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/Const/colors.dart';
import '../../Model/make_order_model.dart';

class ThankYouOrderDetailsWidget extends StatelessWidget {
  final MakeOrderModel? makeOrderModel;

  const ThankYouOrderDetailsWidget({super.key, this.makeOrderModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "OrderDetails",
              style: TextStyle(
                  color: Color(0xff2B2B2B),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Readex Pro"),
            ),
          ],
        ),
        SizedBox(
          height: 12.h,
        ),
        Container(
          width: 378.w,
          // height: 130.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.r),
                topLeft: Radius.circular(10.r)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Product",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Readex Pro"),
                    ),
                    SizedBox(
                      width: 200.w,
                    ),
                    Text(
                      "Quantity",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Readex Pro"),
                    ),
                    SizedBox(
                      width: 40.w,
                    ),
                    Text(
                      "price",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Readex Pro"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Text(
                                  // "${(makeOrderModel.data!.products[index].price)! * (makeOrderModel.data!.products[index].count!)}\tجنيه",
                                  "",
                                  textAlign: TextAlign.left,
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Readex Pro"),
                                )),
                            Expanded(
                                flex: 1,
                                child: Text(
                                  // "${makeOrderModel.data!.products[index].count!}",
                                  "",

                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Readex Pro"),
                                )),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  // "${makeOrderModel.data!.products[index].name}",
                                  "",

                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Readex Pro"),
                                )),
                          ],
                        ),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 4.h,
                        ),
                    itemCount: 2
                    //  makeOrderModel.data!.products.length
                    ),
              ],
            ),
          ),
        ),
        Container(
          width: 378.w,
          height: 42.h,
          decoration: BoxDecoration(
            color: cPrimaryColor.withOpacity(0.3),
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10.r),
                bottomLeft: Radius.circular(10.r)),
          ),
          child: Center(
            child: Text(
                //"الإجمالي ${makeOrderModel.data!.totalPrice} جنيه",
                "",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Readex Pro")),
          ),
        ),
      ],
    );
  }
}
