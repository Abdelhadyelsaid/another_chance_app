import 'package:another_chance/Core/Shared/default_button_widget.dart';
import 'package:another_chance/Features/Product/cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../Core/Const/colors.dart';
import '../../../../Core/Shared/snack_bar.dart';
import '../../../../routing/routes.dart';
import '../../../Profile/View/Widgets/header_text_widget.dart';
import '../Widgets/cart_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: .02.sw),
          child: BlocProvider(
            create: (context) => ProductCubit()..getCartProducts(),
            child: BlocConsumer<ProductCubit, ProductState>(
              listener: (context, state) {
                if (state is MakeOrderSuccess) {
                  context.pushNamed(Routes.thanksScreen.name, extra: {
                    "makeOrderModel":
                        context.read<ProductCubit>().makeOrderModel
                  });
                }
                if (state is MakeOrderError) {
                  customSnackBarr(
                      context: context,
                      text: "Error make order",
                      color: Colors.red);
                }
              },
              builder: (context, state) {
                var cubit = ProductCubit.get(context);
                return Column(
                  children: [
                    HeaderTextWidget(
                      title: "Cart",
                      isCart: cubit.cartProducts.isEmpty ? false : true,
                    ),
                    cubit.cartProducts.isEmpty
                        ? Center(
                            child: Padding(
                            padding: EdgeInsets.only(top: .4.sh),
                            child: Text(
                              "Add products to cart",
                              style: TextStyle(fontSize: 20.sp),
                            ),
                          ))
                        : state is GetCartProductsLoading
                            ? Center(
                                child: CircularProgressIndicator(
                                color: cPrimaryColor,
                              ))
                            : SizedBox(
                                height: .6.sh,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: cubit.cartProducts.length,
                                  itemBuilder: (context, index) {
                                    final item = cubit.cartProducts[index];
                                    return CartWidget(
                                      image: item['image'],
                                      name: item['name'],
                                      price: item['price'].toString(),
                                      quantity: item['quantity'],
                                      onRemove: () {
                                        cubit.deleteProductFromCart(
                                            item['productId']);
                                      },
                                    );
                                  },
                                ),
                              ),
                    const Spacer(),
                    // DefaultButton(
                    //     height: .05.sh,
                    //     color: cPrimaryColor,
                    //     onTap: () {
                    //       context.pushNamed(Routes.layoutScreen.name);
                    //     },
                    //     text: "Add more products"),
                    SizedBox(height: .02.sh),
                    if (cubit.cartProducts.isNotEmpty)
                      state is MakeOrderLoading
                          ? CircularProgressIndicator(
                              color: cPrimaryColor,
                            )
                          : DefaultButton(
                              height: .05.sh,
                              color: Colors.white,
                              text: "Complete the order",
                              borderColor: cPrimaryColor,
                              textColor: cPrimaryColor,
                              onTap: () async {
                                await cubit.makeOrder();
                              },
                            ),
                    SizedBox(height: .02.sh),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
