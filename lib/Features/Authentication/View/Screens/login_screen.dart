import 'package:another_chance/Core/Shared/default_textform_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../Core/Const/colors.dart';
import '../../../../Core/Shared/default_button_widget.dart';
import '../../../../Core/Shared/snack_bar.dart';
import '../../../../routing/routes.dart';
import '../../cubit/auth_cubit.dart';

class LoginScreen extends StatelessWidget {
  final bool? isFromApp;

  const LoginScreen({super.key, this.isFromApp = false});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginErrorState) {
          customSnackBarr(
              context: context,
              text: "something went wrong!",
              color: Colors.red);
        }
        if (state is LoginSuccessState) {
          if (isFromApp == false || isFromApp == null) {
            context.goNamed(Routes.layoutScreen.name);
          } else if (isFromApp == true) {
            context.pop();
          }
          customSnackBarr(
              context: context,
              text: "تم تسجيل الدخول بنجاح",
              color: Colors.green);
        }
      },
      builder: (context, state) {
        return BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            var cubit = AuthCubit.get(context);
            return Scaffold(
                backgroundColor: Colors.white,
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      isFromApp == true
                          ? Column(
                              children: [
                                SizedBox(
                                  height: 80.h,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : const SizedBox(),
                      SizedBox(
                        height: height * 0.1,
                      ),
                      Center(
                          child: Text(
                        "Sign In",
                        style: TextStyle(
                            color: cPrimaryColor,
                            fontFamily: "Readex Pro",
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      )),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
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
                              height: height * 0.01,
                            ),
                            DefaultTextFormField(
                              textInputType: TextInputType.text,
                              textDirection: TextDirection.ltr,
                              // suffixText: "  966+",
                              controller: cubit.loginPhoneController,
                              onChanged: (value) {},
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Password",
                                    style: TextStyle(
                                        color: Color(0xFF626E7B),
                                        fontFamily: "Readex Pro",
                                        fontSize: 14)),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            DefaultTextFormField(
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      cubit.changeShowPassword();
                                    },
                                    icon: cubit.showPassword
                                        ? const Icon(
                                            Icons.visibility_off_outlined)
                                        : const Icon(
                                            Icons.remove_red_eye_outlined)),
                                textDirection: TextDirection.ltr,
                                controller: cubit.loginPasswordController,
                                obscureText: cubit.showPassword ? false : true),
                            SizedBox(
                              height: height * 0.1,
                            ),
                            TextButton(
                                onPressed: () {
                                  context.pushNamed(
                                      Routes.forgetPasswordScreen.name);
                                  //
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //         const RestorePhoneNumberScreen()));
                                },
                                child: Text(
                                  "Forgot Your password?",
                                  style: TextStyle(
                                      color: cPrimaryColor,
                                      fontFamily: "Readex Pro",
                                      fontSize: 12),
                                )),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            DefaultButton(
                                borderRadius: BorderRadius.circular(5),
                                isLoading:
                                    state is LoginLoadingState ? true : false,
                                height: height * 0.06,
                                color: cPrimaryColor,
                                text: "Login",
                                onTap: () {
                                  if (cubit.loginPhoneController.text
                                          .isNotEmpty &&
                                      cubit.loginPasswordController.text
                                          .isNotEmpty) {
                                    cubit.login( cubit.loginPhoneController.text , cubit.loginPasswordController.text);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        showCloseIcon: true,
                                        content: const Text(
                                            "يرجى ادخال جميع البيانات",
                                            style: TextStyle(
                                                fontFamily: "Readex Pro",
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600)),
                                        duration: const Duration(seconds: 4),
                                        backgroundColor: Colors.red,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        // padding: const EdgeInsets.all(10),
                                        behavior: SnackBarBehavior.floating,
                                      ),
                                    );
                                  }
                                }),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            DefaultButton(
                                borderRadius: BorderRadius.circular(5),
                                height: height * 0.06,
                                color: cSecondaryColor,
                                text: "Sign-Up",
                                onTap: () {
                                  context.pushNamed(Routes.signupScreen.name);
                                }),
                            SizedBox(
                              height: height * 0.05,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ));
          },
        );
      },
    );
  }
}
