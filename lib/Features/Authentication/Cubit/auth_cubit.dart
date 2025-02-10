import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../Core/Helper/cache_helper.dart';

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

  Future<void> signUp(String email, String phoneNumber, String name,
      String password, String last_name) async {
    try {
      emit(SignUpLoadingState());
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'email': email.trim(),
        'first_name': name.trim(),
        'last_name': last_name.trim(),
        'phone_number': phoneNumber.trim(),
        'createdAt': Timestamp.now(),
      });
      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      emit(SignUpErrorState(e.toString()));
    }
  }

  User? user = FirebaseAuth.instance.currentUser;

  Future<void> login(String email, String password) async {
    try {
      emit(LoginLoadingState());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      if (user != null) {
        var token = await user!.getIdToken();
        CacheHelper.saveData(key: "token", value: token);
        log("This is firebase token:$token");
      }
      emit(LoginSuccessState());
    }on FirebaseAuthException catch (e) {
      log(e.toString());
      emit(LoginErrorState(e.toString()));
    }
  }
  sendForgetPasswordRequest() async {
    try {
      emit(SendForgetPasswordRequestLoadingState());
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: forgetPasswordEmailController.text.trim(),
      );
      emit(SendForgetPasswordRequestSuccessState());
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      emit(SendForgetPasswordRequestErrorState());
    }
  }

  resendForgetPasswordRequest() async {
    try {
      emit(ReSendForgetPasswordRequestLoadingState());
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: forgetPasswordEmailController.text.trim(),
      );
      emit(ReSendForgetPasswordRequestSuccessState());
    }on FirebaseAuthException catch (E) {
      log(E.toString());
      emit(ReSendForgetPasswordRequestErrorState());
    }
  }

  clearResetPassword() {
    forgetPasswordEmailController.clear();
    restorePasswordOtpController.clear();
    resetPasswordNewPasswordController.clear();
    resetPasswordNewPasswordConfirmationController.clear();
    if (timer != null) {
      timer!.cancel();
    }
  }
}
