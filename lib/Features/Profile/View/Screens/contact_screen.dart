import 'package:another_chance/Core/Const/colors.dart';
import 'package:another_chance/Core/Shared/default_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/Helper/cache_helper.dart';
import '../../../../Core/Shared/default_textform_widget.dart';
import '../Widgets/header_text_widget.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: .05.sw),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderTextWidget(
                title: "Contact US",
              ),
              SizedBox(
                height: 0.05.sh,
              ),
              const Row(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Name",
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: "Readex Pro",
                          fontSize: 13)),
                ],
              ),
              SizedBox(
                height: 0.01.sh,
              ),
              DefaultTextFormField(
                  enabled: true,
                  hintText: CacheHelper.getData(key: "firstName") ?? "N/A"),
              SizedBox(
                height: 0.02.sh,
              ),
              const Row(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Email",
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: "Readex Pro",
                          fontSize: 13)),
                ],
              ),
              SizedBox(
                height: 0.01.sh,
              ),
              DefaultTextFormField(
                  enabled: true,
                  hintText: CacheHelper.getData(key: "firstName") ?? "N/A"),
              SizedBox(
                height: 0.02.sh,
              ),
              const Row(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Message",
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: "Readex Pro",
                          fontSize: 13)),
                ],
              ),
              SizedBox(
                height: 0.01.sh,
              ),
              DefaultTextFormField(
                  enabled: true,
                  maxLines: 7,
                  hintText: CacheHelper.getData(key: "firstName") ?? "N/A"),
              SizedBox(
                height: 0.02.sh,
              ),
              DefaultButton(
                height: .05.sh,
                color: cPrimaryColor,
                text: "Send Message",
                onTap: () {},
              )
            ],
          ),
        ),
      )),
    );
  }
}
