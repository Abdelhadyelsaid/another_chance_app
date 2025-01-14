import 'package:another_chance/Core/Shared/default_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/Const/colors.dart';
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
              const SearchTextfieldWidget(),
              SizedBox(
                height: .05.sh,
              ),
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
                      // Handle "See All" button
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
                height: .3.sh, // Adjust height based on card size
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5, // Adjust based on your data
                  itemBuilder: (context, index) {
                    return ProductWidget();
                  },
                ),
              ),
              SizedBox(
                height: .05.sh,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      // Handle "See All" button
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
                height: .3.sh, // Adjust height based on card size
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5, // Adjust based on your data
                  itemBuilder: (context, index) {
                    return ProductWidget();
                  },
                ),
              ),
              SizedBox(
                height: .05.sh,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      // Handle "See All" button
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
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 10.0, // Spacing between columns
                  mainAxisSpacing: 10.0, // Spacing between rows
                  childAspectRatio: 0.75, // Adjust based on your card size
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ProductWidget(),
                  );
                },
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: .25.sw, vertical: .1.sh),
                child: DefaultButton(
                    height: .05.sh,
                    color: cPrimaryColor,
                    text: "Show All Products"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
