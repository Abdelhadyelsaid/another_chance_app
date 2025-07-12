import 'package:another_chance/Core/Const/colors.dart';
import 'package:another_chance/Features/Home/View/Widgets/product_widget.dart';
import 'package:another_chance/Features/Home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key, required this.products, required this.title});

  final List<Map<String, dynamic>> products;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // SizedBox(
          //   height: .04.sh,
          // ),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns
              crossAxisSpacing: 10.0, // Spacing between columns
              mainAxisSpacing: 10.0, // Spacing between rows
              childAspectRatio: 0.75, // Adjust based on your card size
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ProductWidget(products: products[index]),
              );
            },
          ),
        ],
      ),
    );
  }
}
