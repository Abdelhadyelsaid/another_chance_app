import 'package:another_chance/Core/Const/colors.dart';
import 'package:another_chance/Features/Home/View/Widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:number_paginator/number_paginator.dart';

import '../../../../routing/routes.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: .04.sh,
            ),
            SizedBox(
              height: .75.sh,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 10.0, // Spacing between columns
                  mainAxisSpacing: 10.0, // Spacing between rows
                  childAspectRatio: 0.75, // Adjust based on your card size
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: InkWell(
                        onTap: (){
                          context.pushNamed(Routes.productScreen.name);
                        },
                        child: ProductWidget()),
                  );
                },
              ),
            ),
            NumberPaginator(
              // by default, the paginator shows numbers as center content
              numberPages: 5,
              onPageChange: (int index) {
                // setState(() {
                //   _currentPage = index; // _currentPage is a variable within State of StatefulWidget
                // });
              },
              initialPage: 0,
              config: NumberPaginatorUIConfig(
                // default height is 48
                height: 45,
                buttonShape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
                buttonSelectedForegroundColor: Colors.white,
                buttonUnselectedForegroundColor: Colors.black,
                buttonUnselectedBackgroundColor: Colors.white,
                buttonSelectedBackgroundColor: cSecondaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
