import 'dart:developer';

import 'package:another_chance/Core/Shared/default_button_widget.dart';
import 'package:another_chance/Features/Home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../Core/Const/colors.dart';
import '../../../../routing/routes.dart';
import '../Widgets/product_widget.dart';
import '../Widgets/searchBar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: .04.sw),
          child: BlocProvider(
            create: (context) => HomeCubit()
              ..getProducts()
              ..getNewArrivalsProducts(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: .1.sh,
                ),
                Image.asset('assets/icons/app_icon.png',
                    height: 0.08.sh, color: cPrimaryColor),
                SizedBox(
                  height: 0.05.sh,
                ),
                const Center(child: SearchTextfieldWidget()),
                SizedBox(
                  height: .05.sh,
                ),
                BlocConsumer<HomeCubit, HomeState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    return
                      state is GetProductsLoading
                          ? Center(
                          child: CircularProgressIndicator(
                            color: cPrimaryColor,
                          ))
                          :
                      Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Bestsellers",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                context.pushNamed(
                                    Routes.productsScreen.name,
                                    extra: {
                                      "products": context
                                          .read<HomeCubit>()
                                          .bestSellerProducts,
                                      "title": "Bestsellers"
                                    });
                              },
                              child: Text(
                                "See All",
                                style: TextStyle(color: cPrimaryColor),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: .3.sh,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: context
                                .read<HomeCubit>()
                                .bestSellerProducts
                                .length,
                            itemBuilder: (context, index) {
                              return ProductWidget(
                                products: context
                                    .read<HomeCubit>()
                                    .bestSellerProducts[index],
                              );
                            },
                          ),
                        )
                      ],
                    );
                  },
                ),
                SizedBox(
                  height: .05.sh,
                ),
                BlocConsumer<HomeCubit, HomeState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    return state is GetNewArrivalsProductsLoading
                        ? Center(
                            child: CircularProgressIndicator(
                            color: cPrimaryColor,
                          ))
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "New Arrivals",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      context.pushNamed(
                                          Routes.productsScreen.name,
                                          extra: {
                                            "products": context
                                                .read<HomeCubit>()
                                                .newArrivalsProducts,
                                            "title": "New Arrivals"
                                          });
                                    },
                                    child: Text(
                                      "See All",
                                      style: TextStyle(color: cPrimaryColor),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height:
                                    .3.sh, // Adjust height based on card size
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: context
                                      .read<HomeCubit>()
                                      .newArrivalsProducts
                                      .length,
                                  // Adjust based on your data
                                  itemBuilder: (context, index) {
                                    return ProductWidget(
                                      products: context
                                          .read<HomeCubit>()
                                          .newArrivalsProducts[index],
                                    );
                                  },
                                ),
                              )
                            ],
                          );
                  },
                ),
                SizedBox(
                  height: .05.sh,
                ),
                BlocConsumer<HomeCubit, HomeState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return state is GetNewArrivalsProductsLoading
                        ? Center(
                            child: CircularProgressIndicator(
                            color: cPrimaryColor,
                          ))
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Products",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      context.pushNamed(
                                          Routes.productsScreen.name,
                                          extra: {
                                            "products": context
                                                .read<HomeCubit>()
                                                .products,
                                            "title": "Products"
                                          });
                                    },
                                    child: Text(
                                      "See All",
                                      style: TextStyle(color: cPrimaryColor),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  // Number of columns
                                  crossAxisSpacing: 10.0,
                                  // Spacing between columns
                                  mainAxisSpacing: 10.0,
                                  // Spacing between rows
                                  childAspectRatio:
                                      0.75, // Adjust based on your card size
                                ),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount:
                                    context.read<HomeCubit>().products.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: ProductWidget(
                                        products: context
                                            .read<HomeCubit>()
                                            .products[index]),
                                  );
                                },
                              )
                            ],
                          );
                  },
                ),
                // Padding(
                //   padding:
                //       EdgeInsets.symmetric(horizontal: .25.sw, vertical: .1.sh),
                //   child: DefaultButton(
                //       onTap: () {
                //         context.pushNamed(Routes.productsScreen.name, extra: {
                //           "products": context.read<HomeCubit>().products,
                //           "title": "Products"
                //         });
                //       },
                //       height: .05.sh,
                //       color: cPrimaryColor,
                //       text: "Show All Products"),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void showTopSnackBar(BuildContext context, String message) {
  // Get the overlay
  final overlay = Overlay.of(context);

  // Create an OverlayEntry
  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: MediaQuery.of(context).padding.top + 10, // Below the status bar
      left: 16,
      right: 16,
      child: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              const Icon(Icons.info_outline, color: Colors.white),
            ],
          ),
        ),
      ),
    ),
  );

  // Insert the OverlayEntry into the overlay
  overlay?.insert(overlayEntry);

  // Remove the OverlayEntry after a duration
  Future.delayed(const Duration(seconds: 3), () {
    overlayEntry.remove();
  });
}
