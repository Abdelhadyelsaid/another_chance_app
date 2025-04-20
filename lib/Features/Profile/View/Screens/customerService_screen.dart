import 'package:another_chance/Core/Const/colors.dart';
import 'package:another_chance/Core/Shared/default_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/Helper/cache_helper.dart';
import '../../../../Core/Shared/default_textform_widget.dart';
import '../Widgets/contactWidget.dart';
import '../Widgets/header_text_widget.dart';

class CustomerServiceScreen extends StatelessWidget {
  const CustomerServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: .05.sw),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const HeaderTextWidget(
                  title: "Customer Service",
                ),
                SizedBox(height: .7.sh, child: const ContactUsWidget()),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
