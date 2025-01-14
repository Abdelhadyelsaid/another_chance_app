// import 'package:another_chance/Core/Shared/default_textform_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
//
//
//
// class SearchScreen extends StatelessWidget {
//   const SearchScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => SearchCubit(),
//       child: BlocBuilder<SearchCubit, SearchState>(
//         builder: (context, state) {
//           var searchCubit = SearchCubit.get(context);
//           return DefaultScaffold(
//             leading: CustomIconButton(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               svgAssetIcon: Assets.backButtonIcon,
//             ),
//             stringTitle: "البحث",
//             body: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Directionality(
//                     textDirection: TextDirection.rtl,
//                     child: DefaultTextFormField(
//                       cursorColor: cTextColor,
//                       enabled: true,
//                       borderRadius: 10,
//                       borderColor: Colors.white,
//                       prefixIcon: Icon(
//                         Icons.search,
//                         color: cTextColor,
//                       ),
//                       hintText: "ابحث عن متجر او منتج",
//                       onChanged: (value) {
//                         searchCubit.getSearchResult(value);
//                       },
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20.h,
//                   ),
//                   state is SearchSuccess
//                       ? Directionality(
//                     textDirection: TextDirection.rtl,
//                     child: SizedBox(
//                       height: 720.h,
//                       child: ListView.separated(
//                           shrinkWrap: true,
//                           // physics: const NeverScrollableScrollPhysics(),
//                           itemBuilder: (context, index) =>
//                               BlocListener<SearchCubit, SearchState>(
//                                 listener: (context, state) {
//                                   // TODO: implement listener
//                                   if(state is GetStoreDetailsSuccess){
//
//                                   }
//                                 },
//                                 child: GestureDetector(
//                                   onTap: () async {
//                                     if (searchCubit.searchResult!
//                                         .data[index].type ==
//                                         "store") {
//                                       context.pushNamed(
//                                           Routes.storeDetailsScreen.name,
//                                           extra: {
//                                             "storeId": searchCubit
//                                                 .searchResult!
//                                                 .data[index]
//                                                 .id,
//                                             "storeName": searchCubit
//                                                 .searchResult!
//                                                 .data[index]
//                                                 .name
//                                           });
//                                     } else {
//
//                                       context.pushNamed(
//                                           Routes
//                                               .productDetailsScreen.name,
//                                           extra: {
//                                             "productId": searchCubit
//                                                 .searchResult!
//                                                 .data[index]
//                                                 .id,
//                                             "productName": searchCubit
//                                                 .searchResult!
//                                                 .data[index]
//                                                 .name,
//                                             "storeData": searchCubit
//                                                 .searchResult!
//                                                 .data[index]
//                                                 .store
//                                           });
//                                     }
//                                   },
//                                   child: Container(
//                                     padding: EdgeInsets.symmetric(
//                                         horizontal: 20.w),
//                                     child: Center(
//                                       child: Row(
//                                         mainAxisAlignment:
//                                         MainAxisAlignment
//                                             .spaceBetween,
//                                         children: [
//                                           Column(
//                                             children: [
//                                               Text(
//                                                   "${searchCubit.searchResult!.data[index].name}",
//                                                   style: TextStyle(
//                                                       color: cTextColor2,
//                                                       fontSize: 16.sp,
//                                                       fontFamily:
//                                                       "Readex Pro",
//                                                       fontWeight:
//                                                       FontWeight
//                                                           .w700)),
//                                               SizedBox(
//                                                 height: 5.h,
//                                               ),
//                                               searchCubit
//                                                   .searchResult!
//                                                   .data[index]
//                                                   .type ==
//                                                   "store"
//                                                   ? Text("متجر",
//                                                   style: TextStyle(
//                                                       color:
//                                                       cPrimaryColor,
//                                                       fontSize: 14.sp,
//                                                       fontFamily:
//                                                       "Readex Pro"))
//                                                   : Text("منتج",
//                                                   style: TextStyle(
//                                                       color:
//                                                       cPrimaryColor,
//                                                       fontSize: 14.sp,
//                                                       fontFamily:
//                                                       "Readex Pro")),
//                                             ],
//                                           ),
//                                           ClipRRect(
//                                               borderRadius:
//                                               BorderRadius.circular(
//                                                   20),
//                                               child: CachedNetworkImage(
//                                                 fit: BoxFit.cover ,
//                                                 imageUrl:
//                                                 "${AppUrls.imageBaseUrl}${searchCubit.searchResult!.data[index].img}",
//                                                 height: 100.h,
//                                                 width: 100.w,
//                                               )),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                           separatorBuilder: (context, index) => SizedBox(
//                             height: 10.h,
//                           ),
//                           itemCount:
//                           searchCubit.searchResult!.data.length),
//                     ),
//                   )
//                       : SizedBox(),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
