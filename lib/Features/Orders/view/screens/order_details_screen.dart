// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:bazar_app/core/Shared/widgets/custom_icon_button.dart';
// import 'package:bazar_app/core/Shared/widgets/default_scaffold.dart';
//
// import 'package:intl/intl.dart';
//
// import '../../../../Core/Const/assets.dart';
// import '../../../../Core/Const/colors.dart';
// import '../../../Cart/view/wdgets/thankyou_order_details_widget.dart';
// import '../../../Cart/view/wdgets/thankyou_store_card_widget.dart';
//
// class OrderDetailsScreen extends StatelessWidget {
//   final dynamic orderData;
//
//   const OrderDetailsScreen({super.key, required this.orderData});
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultScaffold(
//       leading: CustomIconButton(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           svgAssetIcon: Assets.backButtonIcon),
//       stringTitle: "طلب رقم: ${orderData["orderId"]}",
//       body: Column(
//         children: [
//           SizedBox(
//             height: 10.h,
//           ),
//           Padding(
//             padding: EdgeInsets.only(
//                 top: 10.h, bottom: 10.h, left: 40.w, right: 40.w),
//             child: Text(
//               "هذا لا يعني ان طلبكم تم تأكيده، او انه جاهز للاستلام. الرجاء التواصل مع المتجر و تزويده برقم الطلب لتأكيد الطلب و اتمام عملية الدفع",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   color: cPrimaryColor.withOpacity(0.8),
//                   fontSize: 14.sp,
//                   fontWeight: FontWeight.w400,
//                   fontFamily: "Readex Pro"),
//             ),
//           ),
//           SizedBox(
//             height: 30.h,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 "${orderData["orderId"]}",
//                 style: TextStyle(
//                     color: cPrimaryColor,
//                     fontSize: 16.sp,
//                     fontWeight: FontWeight.w700,
//                     fontFamily: "Readex Pro"),
//               ),
//               Text(
//                 " : رقم الطلب ",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 14.sp,
//                     fontWeight: FontWeight.w600,
//                     fontFamily: "Readex Pro"),
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 DateFormat('yyyy/MM/dd')
//                     .format(DateTime.parse(orderData["createdAt"])),
//                 style: TextStyle(
//                     color: cPrimaryColor,
//                     fontSize: 16.sp,
//                     fontWeight: FontWeight.w700,
//                     fontFamily: "Readex Pro"),
//               ),
//               Text(
//                 " : تاريخ الطلب ",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 14.sp,
//                     fontWeight: FontWeight.w600,
//                     fontFamily: "Readex Pro"),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 24.h,
//           ),
//           Column(
//             children: [
//               /// store card
//               OrderDetailsStoreCardWidget(
//                 orderData: orderData,
//               ),
//               //
//               // /// order details
//               OrderDetailsWidget(
//                 orderData: orderData['products'], total: orderData["totalPrice"],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
