import 'package:another_chance/Features/Home/cubit/home_cubit.dart';
import 'package:another_chance/Features/Product/cubit/product_cubit.dart';
import 'package:another_chance/Features/Product/cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/Const/colors.dart';

class QuantityWidget extends StatelessWidget {
  const QuantityWidget(
      {super.key, this.isCart = false, this.quantity, this.name});

  final bool isCart;
  final int? quantity;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ProductCubit.get(context);
        return Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  isCart
                      ? const SizedBox()
                      : Column(
                          children: [
                            Text(
                              name ?? "",
                              softWrap: true,
                              maxLines: 2, // Adjust as needed
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(
                              "${quantity ?? 22} In Stock",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.grey),
                            )
                          ],
                        ),
                ],
              ),
            ),
            SizedBox(
              width: .1.sw,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    cubit.decreaseProductCount();
                  },
                  child: Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      color: cPrimaryColor,
                    ),
                    child: const Center(
                        child: Text(
                      "-",
                      style: TextStyle(
                          fontFamily: "Readex Pro",
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  "${cubit.productCount}",
                  style: const TextStyle(
                      fontFamily: "Readex Pro",
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const SizedBox(
                  width: 15,
                ),
                InkWell(
                  onTap: () {
                    cubit.increaseProductCount();
                  },
                  child: Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      color: cPrimaryColor,
                    ),
                    child: const Center(
                        child: Text(
                      "+",
                      style: TextStyle(
                          fontFamily: "Readex Pro",
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
