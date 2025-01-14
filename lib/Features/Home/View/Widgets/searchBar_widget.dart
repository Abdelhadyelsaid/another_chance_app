import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../Core/Shared/default_textform_widget.dart';
import '../../../../routing/routes.dart';
class SearchTextfieldWidget extends StatelessWidget {
  const SearchTextfieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        //context.pushNamed(Routes.searchScreen.name);
      },
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: DefaultTextFormField(
            enabled: false,
            borderRadius: 10,
            borderColor: Colors.white,
            prefixIcon:Icon(Icons.search) ,
            hintText: "Search Products..." ,
          )),
    );
  }
}