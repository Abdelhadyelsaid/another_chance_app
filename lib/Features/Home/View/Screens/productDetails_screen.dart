import 'package:another_chance/Features/Product/cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../Core/Const/colors.dart';
import '../../../../Core/Shared/snack_bar.dart';
import '../../../../routing/routes.dart';
import '../Widgets/description_widget.dart';
import '../Widgets/quantity_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductCubit()..getProductDetails(productId: productId),
      child: Scaffold(
        floatingActionButton: Padding(
          padding: EdgeInsets.only(left: .07.sw),
          child: Opacity(
            opacity: .8,
            child: Container(
              width: double.infinity,
              height: 80.0,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(27),
                    blurRadius: 6.0,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: BlocConsumer<ProductCubit, ProductState>(
                listener: (context, state) {
                  if (state is AddProductToCartSuccess) {
                    context.pushNamed(Routes.cartScreen.name);
                  }
                  if (state is AddProductToCartError) {
                    customSnackBarr(
                        context: context,
                        text: "Error adding product to cart!",
                        color: Colors.red);
                  }
                },
                builder: (context, state) {
                  var cubit = ProductCubit.get(context);
                  return state is GetProductByIdLoading
                      ? const SizedBox()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Total Price',
                                  style: TextStyle(
                                      fontSize: 16.0, color: Colors.grey),
                                ),
                                SizedBox(
                                  height: .02.sh,
                                ),
                                Text(
                                  '${cubit.productCount * cubit.productSnapshot!["price"]} EGP',
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            state is AddProductToCartLoading
                                ? Center(
                                    child: CircularProgressIndicator(
                                    color: cPrimaryColor,
                                  ))
                                : ElevatedButton(
                                    onPressed: () {
                                      cubit.addProductToCart(
                                          productId, cubit.productCount);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: cPrimaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24.0, vertical: 12.0),
                                    ),
                                    child: const Text(
                                      'Add To Cart',
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                  ),
                          ],
                        );
                },
              ),
            ),
          ),
        ),
        body: BlocConsumer<ProductCubit, ProductState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = ProductCubit.get(context);
            return state is GetProductByIdLoading
                ? Center(
                    child: CircularProgressIndicator(
                    color: cPrimaryColor,
                  ))
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          cubit.productSnapshot!["image"],
                          width: double.infinity,
                          height: .45.sh,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: .05.sh,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: .05.sw),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const QuantityWidget(),
                              SizedBox(height: 16.h),
                              const Text(
                                "Description",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              ProductDescriptionCard(),
                              SizedBox(height: 15.h),
                              const Text(
                                "Related Products",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // GridView.builder(
                              //   gridDelegate:
                              //       const SliverGridDelegateWithFixedCrossAxisCount(
                              //     crossAxisCount: 2, // Number of columns
                              //     crossAxisSpacing: 10.0, // Spacing between columns
                              //     mainAxisSpacing: 10.0, // Spacing between rows
                              //     childAspectRatio:
                              //         0.75, // Adjust based on your card size
                              //   ),
                              //   shrinkWrap: true,
                              //   physics: const NeverScrollableScrollPhysics(),
                              //   itemCount: 4,
                              //   itemBuilder: (context, index) {
                              //     return InkWell(
                              //         onTap: () {
                              //           context.pushNamed(Routes.productScreen.name);
                              //         },
                              //         child: ProductWidget());
                              //   },
                              // ),
                              SizedBox(height: .1.sh),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
