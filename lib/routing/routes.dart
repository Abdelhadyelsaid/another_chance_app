class Route {
  String name;
  String path;

  Route({required this.name, required this.path});
}

class Routes {

  static final Route home =  Route(name: "home", path: "/");
  static final Route layoutScreen =  Route(name: "layoutScreen", path: "/layoutScreen");
  static final Route onBoarding =  Route(name: "onBoarding", path: "/onBoarding");
  static final Route loginScreen = Route(name: "loginScreen", path: "/loginScreen");
  static final Route signupScreen = Route(name: "signupScreen", path: "/signupScreen");
  static final Route forgetPasswordScreen = Route(name: "forgetPasswordScreen", path: "/forget-password");
  static final Route forgetPasswordNewPasswordScreen = Route(name: "forgetPasswordNewPasswordScreen", path: "/forget-password-new-password");
  static final Route forgetPasswordOTPScreen = Route(name: "forgetPasswordOTPScreen", path: "/forget-password-otp");
  static final Route productScreen = Route(name: "productScreen", path: "/productScreen");

}
