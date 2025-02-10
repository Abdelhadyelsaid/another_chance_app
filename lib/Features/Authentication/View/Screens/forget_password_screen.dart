import 'package:another_chance/Core/Shared/default_textform_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../Core/Const/colors.dart';
import '../../../../Core/Shared/default_button_widget.dart';
import '../../../../Core/Shared/snack_bar.dart';
import '../../../../routing/routes.dart';
import '../../cubit/auth_cubit.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SendForgetPasswordRequestErrorState) {
          customSnackBarr(
              context: context,
              text: "يرجى التاكد من البريد الالكتروني",
              color: Colors.red);
        }
        if (state is SendForgetPasswordRequestSuccessState) {
          AuthCubit.get(context)
            ..resetTimer()
            ..startTimer();
          context.pushNamed(Routes.forgetPasswordOTPScreen.name);
        }
      },
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return Scaffold(
            backgroundColor: cBackgroundColor,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.1,
                    ),
                    Center(
                        child: Text(
                      "Reset The Password",
                      style: TextStyle(
                          color: cPrimaryColor,
                          fontFamily: "Readex Pro",
                          fontSize: 14),
                    )),
                    SizedBox(
                      height: height * .1,
                    ),
                    Image.asset('assets/icons/app_icon.png',
                        height: height * 0.08, color: cPrimaryColor),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          textDirection: TextDirection.rtl,
                          "E-mail",
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: "Readex Pro",
                              fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Column(
                      children: [
                        DefaultTextFormField(
                          textDirection: TextDirection.ltr,
                          controller: cubit.forgetPasswordEmailController,
                          textInputType: TextInputType.emailAddress,
                          onChanged: (value) {},
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        SizedBox(
                          height: height * 0.1,
                        ),
                        DefaultButton(
                            // isLoading: state is SendOtpLoadingState ? true : false,
                            borderRadius: BorderRadius.circular(5),
                            height: height * 0.06,
                            color: cPrimaryColor,
                            text: "Continue",
                            onTap: () {
                              if (cubit.forgetPasswordEmailController.text
                                  .isNotEmpty) {
                                cubit.sendForgetPasswordRequest();
                                cubit.startTimer();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    showCloseIcon: true,
                                    content: const Text(
                                        "يرجى ادخال البريد الالكتروني ",
                                        style: TextStyle(
                                            fontFamily: "Readex Pro",
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600)),
                                    duration: const Duration(seconds: 4),
                                    backgroundColor: Colors.red,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    // padding: const EdgeInsets.all(10),
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                              }

                              // Navigator.push(context, MaterialPageRoute(builder: (context) => const ResetPasswordOtpScreen()));
                              // cubit.start!=30 ? null: cubit.startTimer();
                            }),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        DefaultButton(
                            borderRadius: BorderRadius.circular(5),
                            height: height * 0.06,
                            color: cSecondaryColor,
                            text: "Back",
                            onTap: () {
                              // cubit.resetTimer();
                              Navigator.pop(context);
                            }),
                        SizedBox(
                          height: height * 0.05,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
