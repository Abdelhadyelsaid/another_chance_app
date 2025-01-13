import 'package:another_chance/Core/Shared/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../Core/Const/colors.dart';
import '../../../../Core/Shared/default_button_widget.dart';
import '../../../../Core/Shared/default_textform_widget.dart';
import '../../cubit/auth_cubit.dart';


class SignupScreen extends StatelessWidget {
  final  bool? isFromApp ;
  const SignupScreen({super.key, this.isFromApp});

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    return  BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener

        if(state is SignUpErrorState){
          customSnackBarr(context: context, text: state.message, color: Colors.red);
        }
        if(state is SignUpSuccessState){
          if (isFromApp == false) {
           // context.goNamed(Routes.loginScreen.name);
          }else if(isFromApp==true){
            context.pop();
          }
          customSnackBarr(context: context, text: "تم التسجيل بنجاح. يرجى تسجيل الدخول", color: Colors.green);
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
                    children: [
                      SizedBox(
                        height: height * 0.1,
                      ),
                      Center(
                          child: Text(
                            "Sign Up",
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
                        height: height * 0.03,
                      ),



                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            ///first name
                            const  Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("First Name",
                                    style: TextStyle(
                                        color: Color(0xFF626E7B),
                                        fontFamily: "Readex Pro",
                                        fontSize: 12)),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            DefaultTextFormField(
                                textDirection: TextDirection.ltr,
                                // suffixText: "  966+",
                                controller: cubit.signupFirstNameController),
                            SizedBox(
                              height: height * 0.01,
                            ),

                            /// last name
                            const  Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Last Name",
                                    style: TextStyle(
                                        color: Color(0xFF626E7B),
                                        fontFamily: "Readex Pro",
                                        fontSize: 12)),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            DefaultTextFormField(
                                textDirection: TextDirection.ltr,
                                // suffixText: "  966+",
                                controller: cubit.signupLastNameController),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            ///phone number
                            const  Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Phone Number",
                                    style: TextStyle(
                                        color: Color(0xFF626E7B),
                                        fontFamily: "Readex Pro",
                                        fontSize: 12)),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            DefaultTextFormField(
                              textInputType: TextInputType.phone,
                              textDirection: TextDirection.ltr,
                              // suffixText: "  966+",
                              controller: cubit.signupPhoneController ,
                              onChanged: (value){
                              },
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),

                            ///email
                            const  Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Email",
                                    style: TextStyle(
                                        color: Color(0xFF626E7B),
                                        fontFamily: "Readex Pro",
                                        fontSize: 12)),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            DefaultTextFormField(
                                textDirection: TextDirection.ltr,
                                // suffixText: "  966+",
                                controller: cubit.signupEmailController),
                            SizedBox(
                              height: height * 0.01,
                            ),

                            ///password
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Password",
                                    style: TextStyle(
                                        color: Color(0xFF626E7B),
                                        fontFamily: "Readex Pro",
                                        fontSize: 12)),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            DefaultTextFormField(
                                suffixIcon: IconButton(onPressed: (){
                                  cubit.changeShowPassword();
                                }, icon:cubit.showPassword ? const Icon(Icons.visibility_off_outlined) : const Icon(Icons.remove_red_eye_outlined)),
                                textDirection: TextDirection.ltr,
                                controller: cubit.signupPasswordController,
                                obscureText:cubit.showPassword ? false : true),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Repeat Password",
                                    style: TextStyle(
                                        color: Color(0xFF626E7B),
                                        fontFamily: "Readex Pro",
                                        fontSize: 12)),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            DefaultTextFormField(
                                suffixIcon: IconButton(onPressed: (){
                                  cubit.changeConfirmShowPassword();
                                }, icon:cubit.showConfirmPassword ? const Icon(Icons.visibility_off_outlined) : const Icon(Icons.remove_red_eye_outlined)),
                                textDirection: TextDirection.ltr,
                                controller: cubit.signupConfirmPasswordController,
                                obscureText:cubit.showConfirmPassword ? false : true),

                            SizedBox(
                              height: height * 0.1,
                            ),
                            DefaultButton(
                                borderRadius: BorderRadius.circular(5) ,
                                isLoading: state is SignUpLoadingState ? true : false,
                                height: height * 0.06,
                                color: cPrimaryColor,
                                text: "Register",
                                onTap: () {

                                  if(cubit.signupPhoneController.text.isNotEmpty && cubit.signupEmailController.text.isNotEmpty && cubit.signupPasswordController.text.isNotEmpty && cubit.signupFirstNameController.text.isNotEmpty  && cubit.signupLastNameController.text.isNotEmpty)
                                  {
                                  //  cubit.signUp( cubit.signupFirstNameController.text, cubit.signupLastNameController.text , cubit.signupPhoneController.text, cubit.signupEmailController.text, cubit.signupPasswordController.text);
                                  }else{
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        showCloseIcon: true,
                                        content:const  Text("يرجى ملئ جميع البيانات !",
                                            style: TextStyle(
                                                fontFamily: "Readex Pro",
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600)),
                                        duration: const Duration(seconds: 4),
                                        backgroundColor: Colors.red ,
                                        shape:
                                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                        // padding: const EdgeInsets.all(10),
                                        behavior: SnackBarBehavior.floating,
                                      ),
                                    );
                                  }



                                }


                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            DefaultButton(
                                borderRadius: BorderRadius.circular(5) ,
                                height: height * 0.06,
                                color: cSecondaryColor,
                                text: "Sign-In",
                                onTap: () {
                                  Navigator.pop(context);
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
