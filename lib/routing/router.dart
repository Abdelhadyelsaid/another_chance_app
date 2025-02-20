import 'dart:developer';
import 'package:another_chance/Features/Authentication/View/Screens/Signup_screen.dart';
import 'package:another_chance/Features/Authentication/View/Screens/login_screen.dart';
import 'package:another_chance/Features/Home/View/Screens/layout_screen.dart';
import 'package:another_chance/Features/Home/View/Screens/productDetails_screen.dart';
import 'package:another_chance/Features/Home/View/Screens/product_screen.dart';
import 'package:another_chance/Features/OnBoarding/View/Screens/onboarding_screen.dart';
import 'package:another_chance/Features/Profile/View/Screens/account_info_screen.dart';
import 'package:another_chance/Features/Profile/View/Screens/customerService_screen.dart';
import 'package:another_chance/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../Features/Authentication/View/Screens/forget_password_screen.dart';
import '../Features/Authentication/View/Screens/reset_password_otp_screen.dart';
import '../Features/Profile/View/Screens/contact_screen.dart';

class CustomRouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final GoRouter _router = GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: Routes.loginScreen.path,
      routes: _routes);

  static GoRouter get router => _router;
  static final List<GoRoute> _routes = [
    onBoarding,
    loginScreen,
    signupScreen,
    forgetPasswordScreen,
    forgetPasswordOTPScreen,
    layoutScreen,
    productScreen,
    accountInfoScreen,
    contactScreen,
    customerServiceScreen
  ];

  static final loginScreen = GoRoute(
      path: Routes.loginScreen.path,
      name: Routes.loginScreen.name,
      builder: (context, state) {
        return LoginScreen();
      });
  static final signupScreen = GoRoute(
      path: Routes.signupScreen.path,
      name: Routes.signupScreen.name,
      builder: (context, state) {
        return SignupScreen();
      });
  static final onBoarding = GoRoute(
      path: Routes.onBoarding.path,
      name: Routes.onBoarding.name,
      builder: (context, state) {
        return OnBoardingPage();
      });
  static final forgetPasswordOTPScreen = GoRoute(
      path: Routes.forgetPasswordOTPScreen.path,
      name: Routes.forgetPasswordOTPScreen.name,
      builder: (context, state) {
        return const ResetPasswordOtpScreen();
      });
  static final forgetPasswordScreen = GoRoute(
      path: Routes.forgetPasswordScreen.path,
      name: Routes.forgetPasswordScreen.name,
      builder: (context, state) {
        return const ForgetPasswordScreen();
      });

  static final layoutScreen = GoRoute(
      path: Routes.layoutScreen.path,
      name: Routes.layoutScreen.name,
      builder: (context, state) {
        return LayoutScreen();
      });
  static final productScreen = GoRoute(
      path: Routes.productScreen.path,
      name: Routes.productScreen.name,
      builder: (context, state) {
        return ProductDetailsScreen();
      });
  static final accountInfoScreen = GoRoute(
      path: Routes.accountInfoScreen.path,
      name: Routes.accountInfoScreen.name,
      builder: (context, state) {
        return AccountInfoScreen();
      });
  static final contactScreen = GoRoute(
      path: Routes.contactScreen.path,
      name: Routes.contactScreen.name,
      builder: (context, state) {
        return ContactScreen();
      });
  static final customerServiceScreen = GoRoute(
      path: Routes.customerServiceScreen.path,
      name: Routes.customerServiceScreen.name,
      builder: (context, state) {
        return CustomerServiceScreen();
      });
}

class RouterTransitions {
  static CustomTransitionPage getFadeTransitionPage(
          {required BuildContext context,
          required GoRouterState state,
          required Widget child}) =>
      CustomTransitionPage(
        // transitionDuration: Duration(seconds: 3)
        child: child,
        key: state.pageKey,
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      );

  static CustomTransitionPage getSlideTransitionPage({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) =>
      CustomTransitionPage(
        child: child,
        key: state.pageKey,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const offsetBegin = Offset(1.0, 0.0);
          const offsetEnd = Offset.zero;

          var slideAnimation = Tween<Offset>(
            begin: offsetBegin,
            end: offsetEnd,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          ));

          return SlideTransition(
            position: slideAnimation,
            child: child,
          );
        },
      );
}
