import 'package:another_chance/Features/Home/cubit/home_cubit.dart';
import 'package:another_chance/Features/Product/cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/Const/colors.dart';

class QuantityWidget extends StatelessWidget {
  const QuantityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        var cubit = ProductCubit.get(context);
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cubit.productSnapshot!["name"],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "${cubit.productSnapshot!["stock"]} In Stock",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: .1.sw),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    cubit.decreaseProductCount();
                  },
                  child: Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(color: cPrimaryColor),
                    child: const Center(
                      child: Text(
                        "-",
                        style: TextStyle(
                          fontFamily: "Readex Pro",
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Text(
                  "${cubit.productCount}",
                  style: const TextStyle(
                    fontFamily: "Readex Pro",
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 15),
                InkWell(
                  onTap: () {
                    cubit.increaseProductCount();
                  },
                  child: Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(color: cPrimaryColor),
                    child: const Center(
                      child: Text(
                        "+",
                        style: TextStyle(
                          fontFamily: "Readex Pro",
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
