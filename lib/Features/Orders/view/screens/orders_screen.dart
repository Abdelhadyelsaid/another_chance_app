// import 'dart:developer';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:bazar_app/Core/Const/assets.dart';
// import 'package:bazar_app/Core/Const/colors.dart';
// import 'package:bazar_app/Features/Account/screens/home_account_screen.dart';
// import 'package:bazar_app/Features/Home/view/widgets/stores_loading_widget.dart';
// import 'package:bazar_app/core/Shared/widgets/custom_icon_button.dart';
// import 'package:bazar_app/core/Shared/widgets/default_scaffold.dart';
// import 'package:intl/intl.dart';
//
// import '../../../../Core/Const/app_urls.dart';
// import '../../../../routing/routes.dart';
// import '../../cubit/orders_cubit.dart';
// import 'order_details_screen.dart';
//
// class OrdersScreen extends StatelessWidget {
//   const OrdersScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     return BlocProvider(
//       create: (context) => OrdersCubit()..getOrders(),
//       child: BlocBuilder<OrdersCubit, OrdersState>(
//         builder: (context, state) {
//           var ordersCubit = OrdersCubit.get(context);
//           return DefaultScaffold(
//             leading: CustomIconButton(
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//                 svgAssetIcon: Assets.backButtonIcon),
//             stringTitle: "الطلبات",
//             body: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   ordersCubit.orders.isEmpty
//                           ? Center(
//                               child: Text(
//                               "لا يوجد طلبات",
//                               style: TextStyle(
//                                   color: cTextColor,
//                                   fontSize: 16.sp,
//                                   fontWeight: FontWeight.w500,
//                                   fontFamily: "Readex Pro"),
//                             ))
//                           : ListView.separated(
//                               padding: EdgeInsets.symmetric(vertical: 25.h),
//                               scrollDirection: Axis.vertical,
//                               physics: const NeverScrollableScrollPhysics(),
//                               shrinkWrap: true,
//                               itemBuilder: (context, index) => InkWell(
//                                     onTap: () {
//                                       // log("This is data:${ ordersCubit
//                                       //     .orders[index]}");
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) =>
//                                                   OrderDetailsScreen(
//                                                     orderData: ordersCubit
//                                                         .orders[index],
//                                                   )));
//                                     },
//                                     child: Stack(
//                                       clipBehavior: Clip.none,
//                                       children: [
//                                         Container(
//                                           padding: EdgeInsets.all(10),
//                                           height: 100.h,
//                                           width: 378.w,
//                                           decoration: BoxDecoration(
//                                             color: Colors.white,
//                                             borderRadius:
//                                                 BorderRadius.circular(10.r),
//                                           ),
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.end,
//                                             children: [
//                                               GestureDetector(
//                                                   onTap: () {
//                                                     context.pushNamed(
//                                                         Routes
//                                                             .storeDetailsScreen
//                                                             .name,
//                                                         extra: {
//                                                           "storeId": ordersCubit.orders[index]['storeId'],
//                                                           "storeName": ordersCubit.orders[index]['storeName']
//                                                         });
//                                                   },
//                                                   child: Text(
//                                                     "${ordersCubit.orders[index]['storeName']}",
//                                                     style: TextStyle(
//                                                         fontSize: 16.sp,
//                                                         fontWeight:
//                                                             FontWeight.w500,
//                                                         color: Colors.black,
//                                                         fontFamily:
//                                                             "Readex Pro"),
//                                                   )),
//                                               SizedBox(
//                                                 height: 12.h,
//                                               ),
//                                               Text(
//                                                 "${ordersCubit.orders[index]['orderId']} : رقم الطلب ",
//                                                 style: TextStyle(
//                                                     fontSize: 12.sp,
//                                                     fontWeight: FontWeight.w400,
//                                                     color: cSecondTextColor,
//                                                     fontFamily: "Readex Pro"),
//                                               ),
//                                               SizedBox(
//                                                 height: 12.h,
//                                               ),
//                                               Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.end,
//                                                 children: [
//                                                   Text(
//                                                     " جنيه",
//                                                     style: TextStyle(
//                                                         fontSize: 12.sp,
//                                                         fontWeight:
//                                                         FontWeight.w400,
//                                                         color: cSecondTextColor,
//                                                         fontFamily:
//                                                         "Readex Pro"),
//                                                   ),
//                                                   Text(
//                                                     " ${ordersCubit.orders[index]['totalPrice']} ",
//                                                     style: TextStyle(
//                                                         fontSize: 12.sp,
//                                                         fontWeight:
//                                                             FontWeight.w400,
//                                                         color: cSecondTextColor,
//                                                         fontFamily:
//                                                             "Readex Pro"),
//                                                   ),
//
//                                                   SizedBox(
//                                                     width: 40.w,
//                                                   ),
//                                                   Text(
//                                                     DateFormat('yyyy/MM/dd HH:mm').format(DateTime.parse(ordersCubit.orders[index]["createdAt"])),
//                                                     style: TextStyle(
//                                                         fontSize: 12.sp,
//                                                         fontWeight:
//                                                             FontWeight.w400,
//                                                         color: cSecondTextColor,
//                                                         fontFamily:
//                                                             "Readex Pro"),
//                                                   ),
//                                                 ],
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                         Positioned(
//                                             left: 16.w,
//                                             bottom: 14.h,
//                                             child: GestureDetector(
//                                               onTap: () {
//                                                 context.pushNamed(
//                                                     Routes
//                                                         .storeDetailsScreen
//                                                         .name,
//                                                     extra: {
//                                                       "storeId": ordersCubit.orders[index]['storeId'],
//                                                       "storeName": ordersCubit.orders[index]['storeName']
//                                                     });
//                                               },
//                                               child: ClipRRect(
//                                                 borderRadius:
//                                                     BorderRadius.circular(10),
//                                                 child: CachedNetworkImage(
//                                                   fit: BoxFit.cover,
//                                                   height: 105.h,
//                                                   width: 105.w,
//                                                   imageUrl:
//                                                       "${ordersCubit.orders[index]["logo"]}",
//                                                   placeholder: (context, url) =>
//                                                       SizedBox(),
//                                                   errorWidget:
//                                                       (context, url, error) =>
//                                                           Icon(Icons.error),
//                                                 ),
//                                               ),
//                                             ))
//                                       ],
//                                     ),
//                                   ),
//                               separatorBuilder: (context, index) => SizedBox(
//                                     height: 40.h,
//                                   ),
//                               itemCount:
//                                   ordersCubit.orders.length),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
