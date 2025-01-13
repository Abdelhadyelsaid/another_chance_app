import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../Core/Const/colors.dart';
import '../../../../Core/Shared/default_button_widget.dart';
import '../../../../Core/Shared/default_textform_widget.dart';
import '../../../../Core/Shared/snack_bar.dart';
import '../../../../routing/routes.dart';
import '../../cubit/auth_cubit.dart';




class ResetConfirmPasswordScreen extends StatelessWidget {
  final String token;
  const ResetConfirmPasswordScreen({super.key , required this.token});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context,state){
        if(state is ResetPasswordSuccessState){
          AuthCubit.get(context).clearResetPassword();
          customSnackBarr(context: context, text: "تم تغيير الرقم السري بنجاح", color: Colors.green);

          context.goNamed(Routes.loginScreen.name);
        }
        if(state is ResetPasswordErrorState){
          customSnackBarr(context: context, text: "حدث خطأ برجاء المحاولة مرة اخرى", color: Colors.red);
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
                        "New Password",
                        style: TextStyle(
                            color: cPrimaryColor,
                            fontFamily: "Readex Pro",
                            fontSize: 16),
                      )),
                  SizedBox(
                    height: height * .1,
                  ),
                  Image.asset('assets/icons/app_icon.png',
                      height: height * 0.08, color: cPrimaryColor),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  ///password
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
                      suffixIcon: IconButton(onPressed: (){
                        cubit.changeShowPassword();
                      }, icon:cubit.showPassword ? const Icon(Icons.visibility_off_outlined) : const Icon(Icons.remove_red_eye_outlined)),
                      textDirection: TextDirection.ltr,
                      controller: cubit.resetPasswordNewPasswordController,
                      obscureText:cubit.showPassword ? false : true),
                  SizedBox(
                    height: height * 0.01,
                  ),

                  ///confirm password
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Repeat Password",
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
                      suffixIcon: IconButton(onPressed: (){
                        cubit.changeConfirmShowPassword();
                      }, icon:cubit.showConfirmPassword ? const Icon(Icons.visibility_off_outlined) : const Icon(Icons.remove_red_eye_outlined)),
                      textDirection: TextDirection.ltr,
                      controller: cubit.resetPasswordNewPasswordConfirmationController,
                      obscureText:cubit.showConfirmPassword ? false : true),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Column(
                    children: [

                      SizedBox(
                        height: height * 0.01,
                      ),

                      SizedBox(
                        height: height * 0.1,
                      ),

                      DefaultButton(
                        isLoading: state is ResetPasswordLoadingState ? true : false,
                          height: height * 0.06,
                          color: cPrimaryColor,
                          text: "Save",
                          onTap: () {
                           if(cubit.resetPasswordNewPasswordController.text.isNotEmpty && cubit.resetPasswordNewPasswordConfirmationController.text.isNotEmpty ){
                             if (cubit.resetPasswordNewPasswordController.text == cubit.resetPasswordNewPasswordConfirmationController.text) {
                             //  cubit.resetPassword(token: token);
                             }else{
                               ScaffoldMessenger.of(context).showSnackBar(
                                 SnackBar(
                                   showCloseIcon: true,
                                   content:const  Text("Password does not match !",
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
                           }else{
                             ScaffoldMessenger.of(context).showSnackBar(
                               SnackBar(
                                 showCloseIcon: true,
                                 content:const  Text("يرجى ادخال جميع البيانات",
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
                          }),
                      SizedBox(
                        height: height * 0.05,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
