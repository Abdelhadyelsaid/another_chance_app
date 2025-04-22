class Route {
  String name;
  String path;

  Route({required this.name, required this.path});
}

class Routes {
  static final Route layoutScreen =
      Route(name: "layoutScreen", path: "/layoutScreen");
  static final Route onBoarding =
      Route(name: "onBoarding", path: "/onBoarding");
  static final Route loginScreen =
      Route(name: "loginScreen", path: "/loginScreen");
  static final Route signupScreen =
      Route(name: "signupScreen", path: "/signupScreen");
  static final Route forgetPasswordScreen =
      Route(name: "forgetPasswordScreen", path: "/forget-password");
  static final Route forgetPasswordNewPasswordScreen = Route(
      name: "forgetPasswordNewPasswordScreen",
      path: "/forget-password-new-password");
  static final Route forgetPasswordOTPScreen =
      Route(name: "forgetPasswordOTPScreen", path: "/forget-password-otp");
  static final Route productScreen =
      Route(name: "productScreen", path: "/productScreen");
  static final Route accountInfoScreen =
      Route(name: "accountInfoScreen", path: "/accountInfoScreen");
  static final Route contactScreen =
      Route(name: "contactScreen", path: "/contactScreen");
  static final Route customerServiceScreen =
      Route(name: "customerServiceScreen", path: "/customerServiceScreen");
  static final Route cartScreen =
      Route(name: "cartScreen", path: "/cartScreen");
  static final Route thanksScreen =
      Route(name: "thanksScreen", path: "/thanksScreen");
  static final Route ordersScreen =
      Route(name: "ordersScreen", path: "/ordersScreen");
  static final Route ordersDetailsScreen =
      Route(name: "ordersDetailsScreen", path: "/ordersDetailsScreen");
  static final Route searchScreen = Route(name: "searchScreen", path: "/searchScreen");
  static final Route requestCollectionScreen = Route(name: "requestCollectionScreen", path: "/requestCollectionScreen");

}
