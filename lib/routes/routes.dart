import 'package:get/get.dart';
import 'package:razan_project/logic/binidings/auth_binidings.dart';
import 'package:razan_project/logic/binidings/main_biniding.dart';
import 'package:razan_project/logic/controllers/product_controller.dart';
import 'package:razan_project/view/screens/auth/forget_password.dart';
import 'package:razan_project/view/screens/cart_screen.dart';
import 'package:razan_project/view/screens/main_screen.dart';
import 'package:razan_project/view/screens/payment_screen.dart';
import 'package:razan_project/view/screens/welcome_screen.dart';
import 'package:razan_project/view/widget/cart/cart_product_card.dart';
import '../logic/binidings/product_pinding.dart';
import '../view/screens/auth/login_screen.dart';
import '../view/screens/auth/signup_screen.dart';

class AppRoutes {
  //intialRoute
  static const welcome = Routes.welcomescreen;
  static const MainScreens = Routes.mainScreen;

  //getPage

  static final routes = [
    GetPage(name: Routes.welcomescreen, page: () => WelcomeScreen()),
    GetPage(
        name: Routes.loginScreen,
        page: () => LoginScreen(),
        binding: AuthBiniding()),
    GetPage(
        name: Routes.signUpScreen,
        page: () => SignUpScreen(),
        binding: AuthBiniding()),
    GetPage(
        name: Routes.forgetpasswordscreen,
        page: () => ForgetPasswordScreen(),
        binding: AuthBiniding()),
    GetPage(
        name: Routes.mainScreen,
        page: () => MainScreen(),
        bindings: [AuthBiniding(), MainBiniding(), ProductBindings()]),
    GetPage(
        name: Routes.cartScreen,
        page: () => CartScreen(),
        bindings: [AuthBiniding(), ProductBindings()]),
    GetPage(
      name: Routes.paymentScreen,
      page: () => PayMentScreen(),
      bindings: [
        AuthBiniding(),
        ProductBindings(),
        MainBiniding(),
      ],
    ),
  ];
}

class Routes {
  static const welcomescreen = "/welcomeScreen";
  static const loginScreen = "/loginScreen";
  static const signUpScreen = "/sginUpScreen";
  static const forgetpasswordscreen = '/forgetpasswordscreen';
  static const mainScreen = '/mainScreeen';
  static const cartScreen = '/cartScreen';
  static const paymentScreen = '/paymentScreen';
}
