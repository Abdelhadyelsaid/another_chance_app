import 'package:another_chance/Core/Const/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../Core/Shared/default_textform_widget.dart';
import '../../../routing/routes.dart';
import '../cubit/search_cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          var searchCubit = SearchCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: DefaultTextFormField(
                        cursorColor: cPrimaryColor.withAlpha(120),
                        enabled: true,
                        borderRadius: 10,
                        borderColor: Colors.white,
                        prefixIcon: Icon(
                          Icons.search,
                          color: cPrimaryColor,
                        ),
                        hintText: "Search for a product !",
                        onChanged: (value) {
                          searchCubit.getSearchResult(value);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    state is SearchSuccess
                        ? Directionality(
                            textDirection: TextDirection.rtl,
                            child: SizedBox(
                              height: 720.h,
                              child: ListView.separated(
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) =>
                                      BlocListener<SearchCubit, SearchState>(
                                        listener: (context, state) {},
                                        child: GestureDetector(
                                          onTap: () {
                                            context.pushNamed(
                                                Routes.productScreen.name,
                                                extra: {
                                                  "productId": searchCubit
                                                      .results[index]["id"],
                                                });
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20.w),
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                            "${searchCubit.results[index]["name"]}",
                                                            style: TextStyle(
                                                                color: Colors.grey,
                                                                fontSize: 16.sp,
                                                                fontFamily:
                                                                    "Readex Pro",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700)),
                                                      ],
                                                    ),
                                                  ),
                                                  ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      child: Image.network(
                                                        fit: BoxFit.cover,
                                                            "${searchCubit.results[index]["image"]}",
                                                        height: 100.h,
                                                        width: 159.w,
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                  separatorBuilder: (context, index) => SizedBox(
                                        height: 10.h,
                                      ),
                                  itemCount: searchCubit.results.length),
                            ),
                          )
                        : state is SearchNotFound
                            ? Center(
                                child: Text(
                                "Not Found......!",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Readex Pro"),
                              ))
                            : const SizedBox(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
