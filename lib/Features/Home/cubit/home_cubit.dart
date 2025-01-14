import 'package:another_chance/Features/Authentication/View/Screens/Signup_screen.dart';
import 'package:another_chance/Features/Authentication/View/Screens/forget_password_screen.dart';
import 'package:another_chance/Features/Authentication/View/Screens/login_screen.dart';
import 'package:another_chance/Features/Authentication/View/Screens/reset_confirm_password_screen.dart';
import 'package:another_chance/Features/Home/View/Screens/home_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);
  int selectedIndex = 0;

  void changeIndex(int index) {
    selectedIndex = index;
    emit(LayoutChangeState());
  }

  List<Widget> screens = [
    const HomeScreen(),
    const ForgetPasswordScreen(),
    const SignupScreen(),
    const ResetConfirmPasswordScreen(token: ""),
  ];
}
