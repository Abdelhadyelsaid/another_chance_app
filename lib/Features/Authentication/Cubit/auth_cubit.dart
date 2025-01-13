import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  ///**************************** Login ******************///
  TextEditingController loginPhoneController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  ///**************************** SignUp ******************///
  TextEditingController signupPhoneController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();
  TextEditingController signupConfirmPasswordController =
      TextEditingController();
  TextEditingController signupFirstNameController = TextEditingController();
  TextEditingController signupLastNameController = TextEditingController();
  TextEditingController signupEmailController = TextEditingController();

  ///**************************** forget password ******************///

  TextEditingController forgetPasswordEmailController = TextEditingController();
  TextEditingController restorePasswordOtpController = TextEditingController();
  TextEditingController resetPasswordNewPasswordController =
      TextEditingController();
  TextEditingController resetPasswordNewPasswordConfirmationController =
      TextEditingController();

  bool showPassword = false;
  bool showConfirmPassword = false;

  void changeShowPassword() {
    showPassword = !showPassword;
    emit(ChangeShowPasswordState());
  }

  void changeConfirmShowPassword() {
    showConfirmPassword = !showConfirmPassword;
    emit(ChangeShowPasswordState());
  }


  /// OTP Timers

  int start = 30;
  Timer? timer;
  void resetTimer() {
    start = 30;
    emit(TimerStopState());
  }
  void startTimer() {
    emit(TimerStartState());
    timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (start == 0) {
        timer.cancel();
        // start = 60;
        emit(TimerStopState());
      } else {
        start = start - 1;
        emit(TimerMinusState());
      }
    });
  }


  clearResetPassword(){
    forgetPasswordEmailController.clear();
    restorePasswordOtpController.clear();
    resetPasswordNewPasswordController.clear();
    resetPasswordNewPasswordConfirmationController.clear();
    if(timer!=null){
      timer!.cancel();
    }

  }
}
