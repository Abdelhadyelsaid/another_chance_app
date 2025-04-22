import 'package:another_chance/Core/Const/colors.dart';
import 'package:another_chance/Core/Shared/default_button_widget.dart';
import 'package:another_chance/Features/OnBoarding/Cubit/on_boadring_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/Shared/default_textform_widget.dart';

class RequestCollectionScreen extends StatelessWidget {
  const RequestCollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => OnBoardingCubit(),
        child: BlocConsumer<OnBoardingCubit, OnBoardingState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = OnBoardingCubit.get(context);
            return SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: .05.sw, vertical: .02.sh),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/onboared1.png",
                        height: 250.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: .03.sh),
                        child: Text(
                          "Please fill the data to collect your plastic.....!",
                          style: TextStyle(color: Colors.grey, fontSize: 20.sp),
                        ),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Name",
                              style: TextStyle(
                                  color: Color(0xFF626E7B),
                                  fontFamily: "Readex Pro",
                                  fontSize: 14)),
                        ],
                      ),
                      SizedBox(
                        height: 0.01.sh,
                      ),
                      DefaultTextFormField(
                        textInputType: TextInputType.text,
                        textDirection: TextDirection.ltr,
                        controller: cubit.loginPhoneController,
                        onChanged: (value) {},
                      ),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("E-mail",
                              style: TextStyle(
                                  color: Color(0xFF626E7B),
                                  fontFamily: "Readex Pro",
                                  fontSize: 14)),
                        ],
                      ),
                      SizedBox(
                        height: 0.01.sh,
                      ),
                      DefaultTextFormField(
                        textInputType: TextInputType.text,
                        textDirection: TextDirection.ltr,
                        controller: cubit.loginPhoneController,
                        onChanged: (value) {},
                      ),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Phone/Whatsapp",
                              style: TextStyle(
                                  color: Color(0xFF626E7B),
                                  fontFamily: "Readex Pro",
                                  fontSize: 14)),
                        ],
                      ),
                      SizedBox(
                        height: 0.01.sh,
                      ),
                      DefaultTextFormField(
                        textInputType: TextInputType.phone,
                        textDirection: TextDirection.ltr,
                        controller: cubit.loginPhoneController,
                        onChanged: (value) {},
                      ),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("address",
                              style: TextStyle(
                                  color: Color(0xFF626E7B),
                                  fontFamily: "Readex Pro",
                                  fontSize: 14)),
                        ],
                      ),
                      SizedBox(
                        height: 0.01.sh,
                      ),
                      DefaultTextFormField(
                        textInputType: TextInputType.phone,
                        textDirection: TextDirection.ltr,
                        controller: cubit.loginPhoneController,
                        onChanged: (value) {},
                      ),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Notes",
                              style: TextStyle(
                                  color: Color(0xFF626E7B),
                                  fontFamily: "Readex Pro",
                                  fontSize: 14)),
                        ],
                      ),
                      SizedBox(
                        height: 0.01.sh,
                      ),
                      DefaultTextFormField(
                        textInputType: TextInputType.text,
                        textDirection: TextDirection.ltr,
                        controller: cubit.loginPhoneController,
                        maxLines: 7,
                        onChanged: (value) {},
                      ),
                      SizedBox(
                        height: 0.04.sh,
                      ),
                      DefaultButton(
                        width: .8.sw,
                        height: .05.sh,
                        onTap: () async {},
                        color: cPrimaryColor,
                        text: 'Request a Collection',
                      ),
                      SizedBox(
                        height: 0.05.sh,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget buildSectionHeader(String title) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18.sp,
              color: Color(0xff545454),
              fontFamily: "Tajawal",
              fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
