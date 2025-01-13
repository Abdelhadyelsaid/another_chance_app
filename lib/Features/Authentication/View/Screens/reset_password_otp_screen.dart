import 'package:another_chance/Core/Shared/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../Core/Const/colors.dart';
import '../../../../Core/Shared/default_button_widget.dart';
import '../../../../Core/Shared/default_textform_widget.dart';
import '../../../../routing/routes.dart';
import '../../cubit/auth_cubit.dart';



class ResetPasswordOtpScreen extends StatelessWidget {
  const ResetPasswordOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context,state){
        if(state is VerifyOtpAtForgetPasswordErrorState){
          customSnackBarr(context: context, text: "يرجى التاكد من رمز التحقق", color: Colors.red);
        }
        if(state is VerifyOtpAtForgetPasswordSuccessState){
          context.pushNamed(Routes.forgetPasswordNewPasswordScreen.name , extra:state.token );
        }
      },
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
                    "Verification",
                    style: TextStyle(
                        color: cPrimaryColor,
                        fontFamily: "Readex Pro",
                        fontSize: 18),
                  )),
              SizedBox(
                height: height * 0.1,
              ),
              Image.asset('assets/icons/app_icon.png',
                  height: height * 0.08,
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Center(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: .1.sw),
                    child: Text(
                      "Please enter the verification number sent to the\n    email: ${cubit.forgetPasswordEmailController.text}",
                      style:const  TextStyle(
                          color: Colors.black,
                          fontFamily: "Readex Pro",
                          fontSize: 12),
                    ),
                  )),
              SizedBox(
                height: height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [

                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      child: DefaultTextFormField(
                        textAlign: TextAlign.center ,
                        textDirection:  TextDirection.ltr,
                        controller: cubit.restorePasswordOtpController,
                        textInputType: TextInputType.number,
                        onChanged: (value){
                       //   cubit.restorePasswordOtpController.text =  arabicToEnglishNumber(  cubit.restorePasswordOtpController.text);
                        },
                      ),
                    ),

                    SizedBox(
                      height: height * 0.01,
                    ),
                    state is TimerStopState || cubit.start == 0
                        ? TextButton(
                        onPressed: () {
                        //  cubit.resendForgetPasswordRequest();
                          cubit.resetTimer();
                          cubit.startTimer();
                        },
                        child: Text("Resend the code",
                            style: TextStyle(
                                color: cPrimaryColor,
                                fontFamily: "Readex Pro",
                                fontSize: 12,
                                fontWeight: FontWeight.w600)))
                        : Text(
                        "You can resend the code after ${cubit.start} seconds",
                        style: const TextStyle(
                            color: Colors.black,
                            fontFamily: "Readex Pro",
                            fontSize: 12,
                            fontWeight: FontWeight.w400)),

                    SizedBox(
                      height: height * 0.1,
                    ),
                    DefaultButton(
                       isLoading: state is VerifyOtpAtForgetPasswordLoadingState ? true : false,
                        height: height * 0.06,
                        color: cPrimaryColor,
                        text: "Verification",
                        onTap: () {
                          if(cubit.restorePasswordOtpController.text.isNotEmpty){
                            context.pushNamed(Routes.forgetPasswordNewPasswordScreen.name ,extra: "dfdf");
                          //  cubit.verifyOtpAtForgetPassword();
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                showCloseIcon: true,
                                content:const  Text("ادخل رقم التحقق ",
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
                      height: height * 0.01,
                    ),
                    DefaultButton(
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
              ),
            ],
          ),
        ));
  },
);
  }
}
